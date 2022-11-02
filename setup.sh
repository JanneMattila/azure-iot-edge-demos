# Enable auto export
set -a

# All the variables for the deployment
subscription_name="AzureDev"
resource_group_name="rg-azure-iot-edge"
location="northeurope"

iot_hub_name="iot-demo000000010"
iot_hub_sku="S1"

edge_device_id="edge1"

vnet_name="vnet-iot"
subnet_vm_name="snet-vm"

vm_name="vm"
vm_username="azureuser"
vm_password=$(openssl rand -base64 32)

nsg_name="nsg-vm"
nsg_rule_ssh_name="ssh-rule"

# Prepare extensions and providers
az extension add --upgrade --yes --name azure-iot

# Login and set correct context
az login -o table
az account set --subscription $subscription_name -o table

# Create resource group
az group create -l $location -n $resource_group_name -o table

iot_hub_json=$(az iot hub create --resource-group $resource_group_name --name $iot_hub_name --sku $iot_hub_sku --partition-count 2 -o json)
echo $iot_hub_json

device_identity_json=$(az iot hub device-identity create --device-id $edge_device_id --edge-enabled --hub-name $iot_hub_name -o json)
echo $device_identity_json

device_identity_connection_string_json=$(az iot hub device-identity connection-string show --device-id $edge_device_id --hub-name $iot_hub_name -o json)
echo $device_identity_connection_string_json

device_identity_connection_string=$(echo $device_identity_connection_string_json | jq -r .connectionString)
echo $device_identity_connection_string

az iot hub device-identity list --hub-name $iot_hub_name
az iot hub device-identity list --hub-name $iot_hub_name -o table

az iot edge set-modules --device-id $edge_device_id --hub-name $iot_hub_name --content deployment.template.json

az network nsg create \
  --resource-group $resource_group_name \
  --name $nsg_name

az network nsg rule create \
  --resource-group $resource_group_name \
  --nsg-name $nsg_name \
  --name $nsg_rule_ssh_name \
  --protocol '*' \
  --direction inbound \
  --source-address-prefix '*' \
  --source-port-range '*' \
  --destination-address-prefix '*' \
  --destination-port-range 22 \
  --access allow \
  --priority 100

vnet_id=$(az network vnet create -g $resource_group_name --name $vnet_name \
  --address-prefix 10.0.0.0/8 \
  --query newVNet.id -o tsv)
echo $vnet_id

subnet_vm_id=$(az network vnet subnet create -g $resource_group_name --vnet-name $vnet_name \
  --name $subnet_vm_name --address-prefixes 10.4.0.0/24 \
  --nsg-name $nsg_name \
  --query id -o tsv)
echo $subnet_vm_id

# Use cloud init file from:
curl -s https://raw.githubusercontent.com/Azure/iotedge-vm-deploy/1.4/cloud-init.txt > cloud-init.txt
cat cloud-init.txt

awk "{sub(/{{{dcs}}}/,\"$device_identity_connection_string\"); print}" cloud-init.txt > cloud-init-updated.txt
cat cloud-init-updated.txt

vm_json=$(az vm create \
  --resource-group $resource_group_name  \
  --name $vm_name \
  --image "Canonical:0001-com-ubuntu-server-focal:20_04-lts:latest" \
  --size Standard_DS3_v2 \
  --admin-username $vm_username \
  --admin-password $vm_password \
  --custom-data cloud-init-updated.txt \
  --subnet $subnet_vm_id \
  --nsg "" \
  --public-ip-sku Standard \
  -o json)

vm_public_ip_address=$(echo $vm_json | jq -r .publicIpAddress)
echo $vm_public_ip_address

# Display variables
# Remember to enable auto export
set -a
echo vm_username=$vm_username
echo vm_password=$vm_password
echo vm_public_ip_address=$vm_public_ip_address
echo device_identity_connection_string=$device_identity_connection_string

ssh $vm_username@$vm_public_ip_address

# Or using sshpass
sshpass -p $vm_password ssh $vm_username@$vm_public_ip_address

# Setup VM (if not using cloud-init)-->
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update
sudo apt-get install moby-engine -y
# sudo apt-get install docker.io -y

# https://learn.microsoft.com/en-us/azure/iot-edge/how-to-provision-single-device-linux-symmetric?view=iotedge-1.4&tabs=azure-cli%2Cubuntu
sudo apt-get install aziot-edge defender-iot-micro-agent-edge

sudo iotedge config mp --connection-string $device_identity_connection_string

sudo iotedge config apply
# <--Setup VM (if not using cloud-init)

sudo cat /etc/aziot/config.toml

sudo iotedge system status

sudo iotedge system logs
sudo iotedge system logs -- -f

# Switch to debug logging
sudo iotedge system set-log-level debug
sudo iotedge system restart

# Switch to normal logging
sudo iotedge system set-log-level info
sudo iotedge system restart

sudo iotedge check

sudo iotedge list

sudo iotedge support-bundle --since 6h


# Exit VM
exit

# Firewall
# https://learn.microsoft.com/en-us/azure/iot-edge/troubleshoot?view=iotedge-1.4#check-your-firewall-and-port-configuration-rules


az iot hub module-identity list --device-id $edge_device_id --hub-name $iot_hub_name

# Wipe out the resources
az group delete --name $resource_group_name -y
