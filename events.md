# Events from Iot Hub

`Content-Type: application/cloudevents-batch+json; charset=utf-8` array of events `[ {...}, {...} ]`

`Content-Type: application/cloudevents+json; charset=utf-8` single event `{...}`

[Understand system properties](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-messages-construct#system-properties-of-d2c-iot-hub-messages)

- `iothub-enqueuedtime`

Example `DeviceTelemetry` batch event:

```json
[
  {
    "id" : "9033a55e-cbde-215d-cb52-c389d7a46432",
    "source" : "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOTEDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/IOT-DEMO",
    "specversion" : "1.0",
    "type" : "Microsoft.Devices.DeviceTelemetry",
    "subject" : "devices/edge1/SimulatedTemperatureSensor",
    "time" : "2022-11-04T04:56:54.76Z",
    "data" : {
      "properties" : {
        "sequenceNumber" : "152",
        "batchId" : "9723dac3-afe8-40a9-a817-2fef38a38fbe"
      },
      "systemProperties" : {
        "iothub-content-type" : "application/json",
        "iothub-content-encoding" : "utf-8",
        "iothub-connection-device-id" : "edge1",
        "iothub-connection-module-id" : "SimulatedTemperatureSensor",
        "iothub-connection-auth-method" : "{\"scope\":\"module\",\"type\":\"sas\",\"issuer\":\"iothub\",\"acceptingIpFilterRule\":null}",
        "iothub-connection-auth-generation-id" : "638031334845958358",
        "iothub-enqueuedtime" : "2022-11-04T04:56:54.76Z",
        "iothub-message-source" : "Telemetry"
      },
      "body" : {
        "machine" : {
          "temperature" : 99.64407567040831,
          "pressure" : 9.959451658654112
        },
        "ambient" : {
          "temperature" : 21.499273690360436,
          "humidity" : 25
        },
        "timeCreated" : "2022-11-04T04:55:07.0541766Z"
      }
    }
  }, 
  {
    "id" : "1e9e5728-bc82-12fe-7ac4-06756731bad2",
    "source" : "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOTEDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/IOT-DEMO",
    "specversion" : "1.0",
    "type" : "Microsoft.Devices.DeviceTelemetry",
    "subject" : "devices/edge1/SimulatedTemperatureSensor",
    "time" : "2022-11-04T04:56:54.76Z",
    "data" : {
      "properties" : {
        "sequenceNumber" : "153",
        "batchId" : "9723dac3-afe8-40a9-a817-2fef38a38fbe"
      },
      "systemProperties" : {
        "iothub-content-type" : "application/json",
        "iothub-content-encoding" : "utf-8",
        "iothub-connection-device-id" : "edge1",
        "iothub-connection-module-id" : "SimulatedTemperatureSensor",
        "iothub-connection-auth-method" : "{\"scope\":\"module\",\"type\":\"sas\",\"issuer\":\"iothub\",\"acceptingIpFilterRule\":null}",
        "iothub-connection-auth-generation-id" : "638031334845958358",
        "iothub-enqueuedtime" : "2022-11-04T04:56:54.76Z",
        "iothub-message-source" : "Telemetry"
      },
      "body" : {
        "machine" : {
          "temperature" : 100.14799140238601,
          "pressure" : 10.01685978001866
        },
        "ambient" : {
          "temperature" : 20.511354142473326,
          "humidity" : 24
        },
        "timeCreated" : "2022-11-04T04:55:09.0560085Z"
      }
    }
  }, 
  {
    "id" : "c29e64c2-7235-ccbe-2717-ed750e8fda5b",
    "source" : "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOTEDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/IOT-DEMO",
    "specversion" : "1.0",
    "type" : "Microsoft.Devices.DeviceTelemetry",
    "subject" : "devices/edge1/SimulatedTemperatureSensor",
    "time" : "2022-11-04T04:56:54.76Z",
    "data" : {
      "properties" : {
        "sequenceNumber" : "154",
        "batchId" : "9723dac3-afe8-40a9-a817-2fef38a38fbe"
      },
      "systemProperties" : {
        "iothub-content-type" : "application/json",
        "iothub-content-encoding" : "utf-8",
        "iothub-connection-device-id" : "edge1",
        "iothub-connection-module-id" : "SimulatedTemperatureSensor",
        "iothub-connection-auth-method" : "{\"scope\":\"module\",\"type\":\"sas\",\"issuer\":\"iothub\",\"acceptingIpFilterRule\":null}",
        "iothub-connection-auth-generation-id" : "638031334845958358",
        "iothub-enqueuedtime" : "2022-11-04T04:56:54.76Z",
        "iothub-message-source" : "Telemetry"
      },
      "body" : {
        "machine" : {
          "temperature" : 100.30332797975855,
          "pressure" : 10.034556352124392
        },
        "ambient" : {
          "temperature" : 21.01959960932645,
          "humidity" : 25
        },
        "timeCreated" : "2022-11-04T04:55:11.0577858Z"
      }
    }
  }, 
  {
    "id" : "9b61a1fd-0d12-e82b-bc45-31fdafbd248e",
    "source" : "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOTEDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/IOT-DEMO",
    "specversion" : "1.0",
    "type" : "Microsoft.Devices.DeviceTelemetry",
    "subject" : "devices/edge1/SimulatedTemperatureSensor",
    "time" : "2022-11-04T04:56:54.76Z",
    "data" : {
      "properties" : {
        "sequenceNumber" : "155",
        "batchId" : "9723dac3-afe8-40a9-a817-2fef38a38fbe"
      },
      "systemProperties" : {
        "iothub-content-type" : "application/json",
        "iothub-content-encoding" : "utf-8",
        "iothub-connection-device-id" : "edge1",
        "iothub-connection-module-id" : "SimulatedTemperatureSensor",
        "iothub-connection-auth-method" : "{\"scope\":\"module\",\"type\":\"sas\",\"issuer\":\"iothub\",\"acceptingIpFilterRule\":null}",
        "iothub-connection-auth-generation-id" : "638031334845958358",
        "iothub-enqueuedtime" : "2022-11-04T04:56:54.76Z",
        "iothub-message-source" : "Telemetry"
      },
      "body" : {
        "machine" : {
          "temperature" : 100.76020687766223,
          "pressure" : 10.086605846822279
        },
        "ambient" : {
          "temperature" : 20.839085262810823,
          "humidity" : 24
        },
        "timeCreated" : "2022-11-04T04:55:13.0595629Z"
      }
    }
  }
]
```

Example `DeviceDisconnected` event:

```json
[
  {
    "id": "289a1c2b-f8b7-c06e-7f29-2aec1f0ad80a",
    "source": "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOT-EDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/IOT-DEMO",
    "specversion": "1.0",
    "type": "Microsoft.Devices.DeviceDisconnected",
    "subject": "devices/edge1/$edgeHub",
    "time": "2022-11-07T09:47:11.4366356Z",
    "data": {
      "deviceConnectionStateEventInfo": {
        "sequenceNumber": "000000000000000001D8F268B5BC335E0000000200000000000000000000003A"
      },
      "hubName": "iot-demo000000010",
      "deviceId": "edge1",
      "moduleId": "$edgeHub"
    }
  },
  {
    "id": "da91f900-fa38-2996-3565-5de8755b7580",
    "source": "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOT-EDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/IOT-DEMO",
    "specversion": "1.0",
    "type": "Microsoft.Devices.DeviceDisconnected",
    "subject": "devices/edge1/SimulatedTemperatureSensor",
    "time": "2022-11-07T09:47:01.4991237Z",
    "data": {
      "deviceConnectionStateEventInfo": {
        "sequenceNumber": "000000000000000001D8F268B5BC335E00000002000000000000000000000039"
      },
      "hubName": "iot-demo000000010",
      "deviceId": "edge1",
      "moduleId": "SimulatedTemperatureSensor"
    }
  }
]
```
