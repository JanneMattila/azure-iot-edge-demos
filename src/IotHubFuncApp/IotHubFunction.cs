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
    public void Run(
        [EventHubTrigger("",
            Connection = "EventHubConnectionString",
            ConsumerGroup = "func",
            IsBatched = false)] string eventData,
            FunctionContext context)
    {
        foreach (var item in context.BindingContext.BindingData)
        {
            _logger.LogInformation($"{item.Key}: {item.Value}");
        }
        _logger.LogInformation(eventData);
    }
}
