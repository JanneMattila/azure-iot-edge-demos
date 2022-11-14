# Azure IoT Edge demos

Azure IoT Edge demos

## Monitoring queries

IoT Edge: Total device disk space percent used - Percentage of total disk space used for an IoT Edge device:

```sql
let totalBytesByDevice = InsightsMetrics
    | where Origin == "iot.azm.ms" and Namespace == "metricsmodule"
    | where Name == "edgeAgent_total_disk_space_bytes"
    | extend dimensions=parse_json(Tags)
    | extend device = tostring(dimensions.edge_device)
    | extend iothub = tostring(dimensions.iothub)
    | extend value = tolong(Val)
    | extend diskname = tostring(dimensions.disk_name)
    | extend id = strcat(iothub, "::", device)
    | project device, id, diskname, value, TimeGenerated, _ResourceId
    | top-nested of id by Ignore0=max(1),
    top-nested 1 of TimeGenerated by Ignore1=max(TimeGenerated),
    top-nested of diskname by Ignore2=max(1),
    top-nested of value by Ignore3=max(1)
    | project-away Ignore*
    | summarize Bytes=max(value) by id, diskname
    | summarize totalBytes=sum(Bytes) by id;
InsightsMetrics
| where Origin == "iot.azm.ms" and Namespace == "metricsmodule"
| where Name == "edgeAgent_available_disk_space_bytes"
| extend dimensions=parse_json(Tags)
| extend device = tostring(dimensions.edge_device)
| extend iothub = tostring(dimensions.iothub)
| extend value = tolong(Val)
| extend diskname = tostring(dimensions.disk_name)
| extend id = strcat(iothub, "::", device)
| project device, id, diskname, value, TimeGenerated, _ResourceId
| summarize Bytes=max(value)
    by device, diskname, TimeGenerated, id, 
    _ResourceId
| summarize availBytes=sum(Bytes) by id, device, TimeGenerated, _ResourceId
| join kind=leftouter totalBytesByDevice
    on $left.id == $right.id
| extend percentUsed = round((todouble(totalBytes) - todouble(availBytes)) / 
    todouble(totalBytes) * 100, 0)
| project TimeGenerated, device, percentUsed, _ResourceId
| summarize AggregatedValue = max(percentUsed)
    by bin(TimeGenerated, 30m), 
    device, _ResourceId
```

Example output:

| TimeGenerated            | device | _ResourceId                                                        | AggregatedValue |
| ------------------------ | ------ | ------------------------------------------------------------------ | --------------- |
| 11/7/2022 9:00:00.000 AM | edge1  | /subscriptions/.../providers/microsoft.devices/iothubs/iot-demo123 | 8               |
| 11/7/2022 8:30:00.000 AM | edge1  | /subscriptions/.../providers/microsoft.devices/iothubs/iot-demo123 | 8               |
| 11/7/2022 8:00:00.000 AM | edge1  | /subscriptions/.../providers/microsoft.devices/iothubs/iot-demo123 | 8               |

IoT Edge: Edge Hub queue size over threshold - Number of times a device's Edge Hub queue size (sum) was over the configured threshold during the evaluation period:

```sql 
let qlenThreshold = 0;
InsightsMetrics
| where Origin == "iot.azm.ms" and Namespace == "metricsmodule"
| where Name == "edgehub_queue_length"
| extend dimensions=parse_json(Tags)
| extend device = tostring(dimensions.edge_device)
| extend ep = tostring(dimensions.endpoint)
| extend qlen = toint(Val)
| project device, qlen, ep, TimeGenerated, _ResourceId
| summarize sum(qlen) by TimeGenerated, device, _ResourceId, qlen
| where sum_qlen >= qlenThreshold
| project-away sum_qlen
```

Example output:

| TimeGenerated            | device | _ResourceId                                                        | qlen |
| ------------------------ | ------ | ------------------------------------------------------------------ | ---- |
| 11/7/2022 8:01:37.000 AM | edge1  | /subscriptions/.../providers/microsoft.devices/iothubs/iot-demo123 | 0    |
| 11/7/2022 8:02:07.000 AM | edge1  | /subscriptions/.../providers/microsoft.devices/iothubs/iot-demo123 | 0    |
| 11/7/2022 8:02:37.000 AM | edge1  | /subscriptions/.../providers/microsoft.devices/iothubs/iot-demo123 | 0    |

## Links

[The IoT Edge OSS project](https://github.com/Azure/iotedge)

- [EnvironmentVariables](https://github.com/Azure/iotedge/blob/main/doc/EnvironmentVariables.md)

[Stretching the IoT Edge performance limits](https://techcommunity.microsoft.com/t5/internet-of-things-blog/stretching-the-iot-edge-performance-limits/ba-p/2993856)

[Check your firewall and port configuration rules](https://learn.microsoft.com/en-us/azure/iot-edge/troubleshoot?view=iotedge-1.4#check-your-firewall-and-port-configuration-rules)

[IoT Hub quotas and throttling](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-quotas-throttling)

[Azure IoT Edge Dev Tool](https://github.com/Azure/iotedgedev)

[Microsoft Azure IoT SDK for .NET](https://github.com/Azure/azure-iot-sdk-csharp)

[Microsoft Artifact Registry](https://mcr.microsoft.com/)

[iotedge-vm-deploy](https://github.com/Azure/iotedge-vm-deploy/tree/1.4)

[Understand system properties](https://learn.microsoft.com/en-us/azure/iot-hub/iot-hub-devguide-messages-construct#system-properties-of-d2c-iot-hub-messages)

[Metrics collector module](https://learn.microsoft.com/en-us/azure/iot-edge/how-to-collect-and-transport-metrics?view=iotedge-1.4&tabs=iothub#metrics-collector-module)

- [Access built-in metrics](https://learn.microsoft.com/en-us/azure/iot-edge/how-to-access-built-in-metrics?view=iotedge-1.4)

[Network emulation (netem)](https://wiki.linuxfoundation.org/networking/netem)
