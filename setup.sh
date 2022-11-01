# Enable auto export
set -a

# All the variables for the deployment
subscription_name="AzureDev"
resource_group_name="rg-azure-iot-edge"
location="northeurope"

iot_hub_name="iot-demo000000010"
iot_hub_sku="S1"

edge_device_id="edge1"

vnet_name="vnet-myakstcp"
subnet_vm_name="snet-vm"

vm_name="vm"
vm_username="azureuser"
vm_password=$(openssl rand -base64 32)

nsg_name="nsg-vm"
nsg_rule_ssh_name="ssh-rule"

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

vm_json=$(az vm create \
  --resource-group $resource_group_name  \
  --name $vm_name \
  --image UbuntuLTS \
  --size Standard_DS3_v2 \
  --admin-username $vm_username \
  --admin-password $vm_password)

vm_public_ip_address=$(echo $vm_json | jq -r .publicIpAddress)
echo $vm_public_ip_address

# Display variables
# Remember to enable auto export
set -a
echo vm_username=$vm_username
echo vm_password=$vm_password
echo stats_server_address=$stats_server_address
echo vm_public_ip_address=$vm_public_ip_address
echo vm_private_ip_address=$vm_private_ip_address
echo lb_public_ip_address=$lb_public_ip_address

ssh $vm_username@$vm_public_ip_address
ssh $vm_username@$lb_public_ip_address

# Or using sshpass
sshpass -p $vm_password ssh $vm_username@$vm_public_ip_address
sshpass -p $vm_password ssh $vm_username@$lb_public_ip_address

# Setup VM
sudo apt update
sudo apt install docker.io -y

# Exit VM
exit

# Wipe out the resources
az group delete --name $resource_group_name -y
