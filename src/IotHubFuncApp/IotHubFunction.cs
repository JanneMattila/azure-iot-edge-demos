using Microsoft.Azure.Functions.Worker;
using Microsoft.Extensions.Logging;

namespace IotHubFuncApp;

public class IotHubFunction
{
    private readonly ILogger _logger;

    public IotHubFunction(ILoggerFactory loggerFactory)
    {
        _logger = loggerFactory.CreateLogger<IotHubFunction>();
    }

    [Function("IotHubFunction")]
    public void Run([EventHubTrigger("iothub",
            Connection = "EventHubConnectionString",
            ConsumerGroup = "func",
            IsBatched = true)] string[] events)
    {
        var json = $"[{string.Join(',', events)}]";

        _logger.LogInformation(json);
    }
}