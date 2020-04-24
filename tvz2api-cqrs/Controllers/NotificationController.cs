using tvz2api_cqrs.Models;
using tvz2api_cqrs.Infrastructure.Commands;
using tvz2api_cqrs.Enumerations;
using tvz2api_cqrs.Implementation.Queries;
using tvz2api_cqrs.Implementation.Commands;
using tvz2api_cqrs.QueryModels;
using tvz2api_cqrs.Infrastructure.Messaging;
using tvz2api_cqrs.Implementation.Specifications;
using Microsoft.AspNetCore.Mvc;
using tvz2api_cqrs.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR;
using tvz2api_cqrs.Hubs;
using tvz2api_cqrs.Custom;

namespace tvz2api_cqrs.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class NotificationController : CustomController
  {
    private readonly ICommandBus _commandBus;
    private readonly IQueryBus _queryBus;
    private readonly IHubContext<NotificationHub> _hubContext;

    public NotificationController(ICommandBus commandBus, IQueryBus queryBus, IHubContext<NotificationHub> notificationHub, lmsContext context) : base(context)
    {
      _commandBus = commandBus;
      _queryBus = queryBus;
      _hubContext = notificationHub;
    }

    [HttpGet("{id}")]
    public async Task<IActionResult> GetDetails(int id)
    {
      var result = await _queryBus.ExecuteAsync(new NotificationQuery(id));
      return Ok(result);
    }

    [HttpGet("user/{userId}")]
    public async Task<IActionResult> GetUserNotifications(int userId)
    {
      var result = await _queryBus.ExecuteAsync(new NotificationUserQuery(userId));
      return Ok(result);
    }

    [HttpGet("user-total/{userId}")]
    public async Task<IActionResult> GetUserNotificationsTotal(int userId)
    {
      var result = await _queryBus.ExecuteAsync(new NotificationUserTotalQuery(userId));
      return Ok(result);
    }

    [HttpPost]
    public async Task<IActionResult> CreateNew(NotificationCreateCommand command)
    {
      await _commandBus.ExecuteAsync(command);
      return Ok();
    }
  }
}