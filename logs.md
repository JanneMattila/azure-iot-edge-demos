# Logs

Create `deny` NSG and then execute `sudo docker logs edgeHub`:

```bash
$ sudo docker logs edgeHub
<7> 2022-11-04 05:34:22.879 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Authenticator] - Client edge1/SimulatedTemperatureSensor re-authentication successful
<7> 2022-11-04 05:34:22.879 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.ConnectionReauthenticator] - Reauthenticated client edge1/SimulatedTemperatureSensor successfully
<7> 2022-11-04 05:34:23.010 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.RoutingEdgeHub] - Received 1 message(s) from edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:34:23.011 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Amqp.LinkHandlers.EventsLinkHandler] - EventsLinkHandler processed 1 messages for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:34:23.777 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient] - Received connection status changed callback with connection status Disconnected_Retrying and reason Communication_Error for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:34:23.777 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient] - Received connection status changed callback with connection status Disconnected and reason Retry_Expired for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:34:23.778 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient] - Operation OpenAsync timed out for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:34:23.778 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.DeviceConnectivityManager] - IotHub call timed out
<4> 2022-11-04 05:34:23.778 +00:00 [WRN] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnection] - Error creating cloud connection for client edge1/SimulatedTemperatureSensor
System.TimeoutException: The operation timed out.
 ---> Microsoft.Azure.Devices.Client.Exceptions.IotHubCommunicationException: Transient network error occurred, please retry.
 ---> System.TimeoutException: The operation did not complete within the allocated time 00:01:00 for object <your-iot-hub>.azure-devices.net:5671.
   at Microsoft.Azure.Amqp.ExceptionDispatcher.Throw(Exception exception)
   at Microsoft.Azure.Amqp.AsyncResult.End[TAsyncResult](IAsyncResult result)
   at Microsoft.Azure.Amqp.Transport.AmqpTransportInitiator.ConnectAsyncResult.End(IAsyncResult result)
   at Microsoft.Azure.Amqp.Transport.AmqpTransportInitiator.<>c.<ConnectAsync>b__17_1(IAsyncResult r)
   at System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Client.Transport.AmqpIoT.AmqpIoTTransport.InitializeAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpIoTConnector.OpenConnectionAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpConnectionHolder.EnsureConnectionAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpConnectionHolder.OpenSessionAsync(DeviceIdentity deviceIdentity, TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.AmqpIoT.AmqpUnit.EnsureSessionIsOpenAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.AmqpIoT.AmqpUnit.OpenAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpTransportHandler.OpenAsync(CancellationToken cancellationToken)
   at Microsoft.Azure.Devices.Client.Transport.ProtocolRoutingDelegatingHandler.OpenAsync(CancellationToken cancellationToken)
   at Microsoft.Azure.Devices.Client.Transport.ErrorDelegatingHandler.<>c__DisplayClass27_0.<<ExecuteWithErrorHandlingAsync>b__0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Client.Transport.ErrorDelegatingHandler.ExecuteWithErrorHandlingAsync[T](Func`1 asyncOperation)
   --- End of inner exception stack trace ---
   at Microsoft.Azure.Devices.Client.Transport.ErrorDelegatingHandler.ExecuteWithErrorHandlingAsync[T](Func`1 asyncOperation)
   at Microsoft.Azure.Devices.Client.Transport.RetryDelegatingHandler.<>c__DisplayClass38_0.<<OpenInternalAsync>b__0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Client.Transport.RetryDelegatingHandler.EnsureOpenedAsync(CancellationToken cancellationToken)
   at Microsoft.Azure.Devices.Client.InternalClient.OpenAsync()
   --- End of inner exception stack trace ---
   at Microsoft.Azure.Devices.Client.InternalClient.OpenAsync()
   at Microsoft.Azure.Devices.Edge.Util.TaskEx.TimeoutAfter(Task task, TimeSpan timeout, Action action) in /mnt/vss/_work/1/s/edge-util/src/Microsoft.Azure.Devices.Edge.Util/TaskEx.cs:line 160
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ModuleClientWrapper.OpenAsync() in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ModuleClientWrapper.cs:line 56
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.<>c__DisplayClass30_0.<<InvokeFunc>b__0>d.MoveNext() in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 194
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.InvokeFunc[T](Func`1 func, String operation, Boolean useForConnectivityCheck) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 146
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.InvokeFunc[T](Func`1 func, String operation, Boolean useForConnectivityCheck) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 182
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.OpenAsync() in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 62
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnection.ConnectToIoTHub(ITokenProvider newTokenProvider) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnection.cs:line 137
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnection.CreateNewCloudProxyAsync(ITokenProvider newTokenProvider) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnection.cs:line 112
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnection.Create(IIdentity identity, Action`2 connectionStatusChangedHandler, ITransportSettings[] transportSettings, IMessageConverterProvider messageConverterProvider, IClientProvider clientProvider, ICloudListener cloudListener, ITokenProvider tokenProvider, TimeSpan idleTimeout, Boolean closeOnIdleTimeout, TimeSpan operationTimeout, TimeSpan cloudConnectionHangingTimeout, String productInfo, Option`1 modelId) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnection.cs:line 101
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnectionProvider.TryCreateCloudConnectionFromServiceIdentity(IIdentity identity, Action`2 connectionStatusChangedHandler, Boolean refreshOutOfDateCache, CloudListener cloudListener, String authChain) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnectionProvider.cs:line 285
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnectionProvider.ConnectInternalWithDeviceStateTracking(IIdentity identity, Action`2 connectionStatusChangedHandler, Boolean refreshCachedIdentity) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnectionProvider.cs:line 256
<6> 2022-11-04 05:34:23.780 +00:00 [INF] [Microsoft.Azure.Devices.Edge.Hub.Core.ConnectionManager] - Error getting cloud connection for device edge1/SimulatedTemperatureSensor
System.TimeoutException: The operation timed out.
 ---> Microsoft.Azure.Devices.Client.Exceptions.IotHubCommunicationException: Transient network error occurred, please retry.
 ---> System.TimeoutException: The operation did not complete within the allocated time 00:01:00 for object <your-iot-hub>.azure-devices.net:5671.
   at Microsoft.Azure.Amqp.ExceptionDispatcher.Throw(Exception exception)
   at Microsoft.Azure.Amqp.AsyncResult.End[TAsyncResult](IAsyncResult result)
   at Microsoft.Azure.Amqp.Transport.AmqpTransportInitiator.ConnectAsyncResult.End(IAsyncResult result)
   at Microsoft.Azure.Amqp.Transport.AmqpTransportInitiator.<>c.<ConnectAsync>b__17_1(IAsyncResult r)
   at System.Threading.Tasks.TaskFactory`1.FromAsyncCoreLogic(IAsyncResult iar, Func`2 endFunction, Action`1 endAction, Task`1 promise, Boolean requiresSynchronization)
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Client.Transport.AmqpIoT.AmqpIoTTransport.InitializeAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpIoTConnector.OpenConnectionAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpConnectionHolder.EnsureConnectionAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpConnectionHolder.OpenSessionAsync(DeviceIdentity deviceIdentity, TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.AmqpIoT.AmqpUnit.EnsureSessionIsOpenAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.AmqpIoT.AmqpUnit.OpenAsync(TimeSpan timeout)
   at Microsoft.Azure.Devices.Client.Transport.Amqp.AmqpTransportHandler.OpenAsync(CancellationToken cancellationToken)
   at Microsoft.Azure.Devices.Client.Transport.ProtocolRoutingDelegatingHandler.OpenAsync(CancellationToken cancellationToken)
   at Microsoft.Azure.Devices.Client.Transport.ErrorDelegatingHandler.<>c__DisplayClass27_0.<<ExecuteWithErrorHandlingAsync>b__0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Client.Transport.ErrorDelegatingHandler.ExecuteWithErrorHandlingAsync[T](Func`1 asyncOperation)
   --- End of inner exception stack trace ---
   at Microsoft.Azure.Devices.Client.Transport.ErrorDelegatingHandler.ExecuteWithErrorHandlingAsync[T](Func`1 asyncOperation)
   at Microsoft.Azure.Devices.Client.Transport.RetryDelegatingHandler.<>c__DisplayClass38_0.<<OpenInternalAsync>b__0>d.MoveNext()
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Client.Transport.RetryDelegatingHandler.EnsureOpenedAsync(CancellationToken cancellationToken)
   at Microsoft.Azure.Devices.Client.InternalClient.OpenAsync()
   --- End of inner exception stack trace ---
   at Microsoft.Azure.Devices.Client.InternalClient.OpenAsync()
   at Microsoft.Azure.Devices.Edge.Util.TaskEx.TimeoutAfter(Task task, TimeSpan timeout, Action action) in /mnt/vss/_work/1/s/edge-util/src/Microsoft.Azure.Devices.Edge.Util/TaskEx.cs:line 160
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ModuleClientWrapper.OpenAsync() in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ModuleClientWrapper.cs:line 56
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.<>c__DisplayClass30_0.<<InvokeFunc>b__0>d.MoveNext() in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 194
--- End of stack trace from previous location ---
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.InvokeFunc[T](Func`1 func, String operation, Boolean useForConnectivityCheck) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 146
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.InvokeFunc[T](Func`1 func, String operation, Boolean useForConnectivityCheck) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 182
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient.OpenAsync() in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/ConnectivityAwareClient.cs:line 62
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnection.ConnectToIoTHub(ITokenProvider newTokenProvider) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnection.cs:line 137
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnection.CreateNewCloudProxyAsync(ITokenProvider newTokenProvider) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnection.cs:line 112
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnection.Create(IIdentity identity, Action`2 connectionStatusChangedHandler, ITransportSettings[] transportSettings, IMessageConverterProvider messageConverterProvider, IClientProvider clientProvider, ICloudListener cloudListener, ITokenProvider tokenProvider, TimeSpan idleTimeout, Boolean closeOnIdleTimeout, TimeSpan operationTimeout, TimeSpan cloudConnectionHangingTimeout, String productInfo, Option`1 modelId) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnection.cs:line 101
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnectionProvider.TryCreateCloudConnectionFromServiceIdentity(IIdentity identity, Action`2 connectionStatusChangedHandler, Boolean refreshOutOfDateCache, CloudListener cloudListener, String authChain) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnectionProvider.cs:line 285
   at Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudConnectionProvider.ConnectInternalWithDeviceStateTracking(IIdentity identity, Action`2 connectionStatusChangedHandler, Boolean refreshCachedIdentity) in /mnt/vss/_work/1/s/edge-hub/core/src/Microsoft.Azure.Devices.Edge.Hub.CloudProxy/CloudConnectionProvider.cs:line 256
<4> 2022-11-04 05:34:23.781 +00:00 [WRN] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Could not get an active Iot Hub connection for client edge1/SimulatedTemperatureSensor
azureuser@vm:~$ 
```

Remove `deny` NSG and then execute `sudo docker logs edgeHub`:

```bash
<7> 2022-11-04 05:38:38.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 1. Next start offset = 129.
<7> 2022-11-04 05:38:38.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 129 with batch size 99.
<7> 2022-11-04 05:38:38.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 129.
<7> 2022-11-04 05:38:38.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream.
<7> 2022-11-04 05:38:38.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream, divided into 1 groups. Processing maximum 10 groups in parallel.
<7> 2022-11-04 05:38:38.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.ConnectionManager] - Obtained cloud connection for device edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:38.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Finished processing messages to upstream
<7> 2022-11-04 05:38:38.124 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.DeviceConnectivityManager] - IotHub call succeeded
<7> 2022-11-04 05:38:38.124 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient] - Operation SendEventAsync succeeded for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:38.124 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudProxy] - Sending message for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:38.124 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 129 with batch size 100.
<7> 2022-11-04 05:38:38.124 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 129.
<7> 2022-11-04 05:38:43.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.RoutingEdgeHub] - Received 1 message(s) from edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:43.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Amqp.LinkHandlers.EventsLinkHandler] - EventsLinkHandler processed 1 messages for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:43.112 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 129 with batch size 100.
<7> 2022-11-04 05:38:43.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 1. Next start offset = 130.
<7> 2022-11-04 05:38:43.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 130 with batch size 99.
<7> 2022-11-04 05:38:43.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 130.
<7> 2022-11-04 05:38:43.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream.
<7> 2022-11-04 05:38:43.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream, divided into 1 groups. Processing maximum 10 groups in parallel.
<7> 2022-11-04 05:38:43.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.ConnectionManager] - Obtained cloud connection for device edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:43.113 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Finished processing messages to upstream
<7> 2022-11-04 05:38:43.210 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.DeviceConnectivityManager] - IotHub call succeeded
<7> 2022-11-04 05:38:43.210 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient] - Operation SendEventAsync succeeded for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:43.210 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudProxy] - Sending message for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:43.211 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 130 with batch size 100.
<7> 2022-11-04 05:38:43.211 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 130.
<7> 2022-11-04 05:38:48.114 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.RoutingEdgeHub] - Received 1 message(s) from edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:48.114 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Amqp.LinkHandlers.EventsLinkHandler] - EventsLinkHandler processed 1 messages for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:48.114 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 130 with batch size 100.
<7> 2022-11-04 05:38:48.115 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 1. Next start offset = 131.
<7> 2022-11-04 05:38:48.115 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 131 with batch size 99.
<7> 2022-11-04 05:38:48.115 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 131.
<7> 2022-11-04 05:38:48.115 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream.
<7> 2022-11-04 05:38:48.115 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream, divided into 1 groups. Processing maximum 10 groups in parallel.
<7> 2022-11-04 05:38:48.115 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.ConnectionManager] - Obtained cloud connection for device edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:48.115 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Finished processing messages to upstream
<7> 2022-11-04 05:38:48.138 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.DeviceConnectivityManager] - IotHub call succeeded
<7> 2022-11-04 05:38:48.138 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient] - Operation SendEventAsync succeeded for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:48.138 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudProxy] - Sending message for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:48.139 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 131 with batch size 100.
<7> 2022-11-04 05:38:48.139 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 131.
<7> 2022-11-04 05:38:53.116 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.RoutingEdgeHub] - Received 1 message(s) from edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:53.116 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Amqp.LinkHandlers.EventsLinkHandler] - EventsLinkHandler processed 1 messages for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 131 with batch size 100.
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 1. Next start offset = 132.
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 132 with batch size 99.
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 132.
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream.
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream, divided into 1 groups. Processing maximum 10 groups in parallel.
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.ConnectionManager] - Obtained cloud connection for device edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:53.117 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Finished processing messages to upstream
<7> 2022-11-04 05:38:53.135 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.DeviceConnectivityManager] - IotHub call succeeded
<7> 2022-11-04 05:38:53.135 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.ConnectivityAwareClient] - Operation SendEventAsync succeeded for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:53.135 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.CloudProxy.CloudProxy] - Sending message for edge1/SimulatedTemperatureSensor
<7> 2022-11-04 05:38:53.135 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Getting next batch for endpoint iothub starting from 132 with batch size 100.
<7> 2022-11-04 05:38:53.135 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Storage.MessageStore] - Obtained next batch for endpoint iothub with batch size 0. Next start offset = 132.
```

`sudo docker logs edgeHub | grep upstream`:

```bash
<7> 2022-11-04 05:41:28.184 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream.
<7> 2022-11-04 05:41:28.184 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream, divided into 1 groups. Processing maximum 10 groups in parallel.
<7> 2022-11-04 05:41:28.184 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Finished processing messages to upstream
<7> 2022-11-04 05:41:33.186 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream.
<7> 2022-11-04 05:41:33.186 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Sending 1 message(s) upstream, divided into 1 groups. Processing maximum 10 groups in parallel.
<7> 2022-11-04 05:41:33.186 +00:00 [DBG] [Microsoft.Azure.Devices.Edge.Hub.Core.Routing.CloudEndpoint] - Finished processing messages to upstream
```
