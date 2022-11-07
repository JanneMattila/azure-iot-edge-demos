# Events from Iot Hub

## Instructions

Here are few screenshots if you want to enable device events to webhook:

![Select Events from Iot Hub](https://user-images.githubusercontent.com/2357647/200296387-4f094984-55dd-4cef-974f-13db4a1372cb.png)

![Select Event Subscription](https://user-images.githubusercontent.com/2357647/200296553-4189f5ae-8d00-49eb-8e65-da787a581a79.png)

![Add subscription information](https://user-images.githubusercontent.com/2357647/200296651-82b27163-c62a-48f1-988b-e817b5b42ebf.png)

![Add webhook endpoint](https://user-images.githubusercontent.com/2357647/200296740-b72b68bd-e8ba-4f83-89f7-07aa5c14c9ea.png)

![Select endpoint](https://user-images.githubusercontent.com/2357647/200296834-b093ade9-ebd5-4904-9a0f-eaa25a4053d3.png)

Add "webhook" capable endpoint. If you don't have one, then you can always self-host [Echo](https://github.com/JanneMattila/Echo)
using image from [Docker Hub](https://hub.docker.com/r/jannemattila/echo).

![Webhook endpoint details](https://user-images.githubusercontent.com/2357647/200296912-b7321423-8f5a-40a9-a043-e25a1f4c3311.png)

You can configure batching in "Additional Features":

![Additional settings for webhook](https://user-images.githubusercontent.com/2357647/200296954-52f4efcf-a601-4040-9dd2-0aac2d0fcd27.png)

## Example messages to webhook

`Content-Type: application/cloudevents-batch+json; charset=utf-8` content type means array of events `[ {...}, {...} ]`

`Content-Type: application/cloudevents+json; charset=utf-8` content type means single event `{...}`

[Understand system properties](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-messages-construct#system-properties-of-d2c-iot-hub-messages)

- `iothub-enqueuedtime`

Example `DeviceConnected` event:

```json
[
  {
    "id": "3143b509-1a83-5667-2d5e-65b040328fb3",
    "source": "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOT-EDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/iot-demo",
    "specversion": "1.0",
    "type": "Microsoft.Devices.DeviceConnected",
    "subject": "devices/edge1/SimulatedTemperatureSensor",
    "time": "2022-11-07T11:00:25.1191309Z",
    "data": {
      "deviceConnectionStateEventInfo": {
        "sequenceNumber": "000000000000000001D8F268B5BC335E0000000200000000000000000000003B"
      },
      "hubName": "iot-demo",
      "deviceId": "edge1",
      "moduleId": "SimulatedTemperatureSensor"
    }
  },
  {
    "id": "c6952ec1-2c98-baab-4713-011ed5d7d1e4",
    "source": "/SUBSCRIPTIONS/ee932f8a-a75a-4115-b95f-2896ce3e3517/RESOURCEGROUPS/RG-AZURE-IOT-EDGE/PROVIDERS/MICROSOFT.DEVICES/IOTHUBS/IOT-DEMO",
    "specversion": "1.0",
    "type": "Microsoft.Devices.DeviceConnected",
    "subject": "devices/edge1/$edgeHub",
    "time": "2022-11-07T11:00:25.2284564Z",
    "data": {
      "deviceConnectionStateEventInfo": {
        "sequenceNumber": "000000000000000001D8F268B5BC335E0000000200000000000000000000003C"
      },
      "hubName": "iot-demo",
      "deviceId": "edge1",
      "moduleId": "$edgeHub"
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
      "hubName": "iot-demo",
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
      "hubName": "iot-demo",
      "deviceId": "edge1",
      "moduleId": "SimulatedTemperatureSensor"
    }
  }
]
```

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
