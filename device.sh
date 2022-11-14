# Enable auto export
set -a

# All the variables for the deployment
subscription_name="AzureDev"
resource_group_name="rg-azure-iot-edge"

iot_hub_name="iot-demo000000010"

simple_device1_id="simple-device1"

simple_device_identity_json=$(az iot hub device-identity create --device-id $simple_device1_id --hub-name $iot_hub_name -o json)
echo $simple_device_identity_json

simple_device_identity_connection_string_json=$(az iot hub device-identity connection-string show --device-id $simple_device1_id --hub-name $iot_hub_name -o json)
echo $simple_device_identity_connection_string_json

simple_device_identity_connection_string=$(echo $simple_device_identity_connection_string_json | jq -r .connectionString)
echo $simple_device_identity_connection_string

az iot device simulate -d $simple_device1_id -n $iot_hub_name

simple_device_payload=$(jo -p time=$(date +%R) date=$(date +%F))
az iot device send-d2c-message -d $simple_device1_id -n $iot_hub_name \
 --data "$simple_device_payload" \
 --properties "my_identifier=12345;my_alternative_identifier=ABCDE" \
 --msg-count 5
