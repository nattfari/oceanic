using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;
using ExternalServices;
using WebHost.DataContracts.DTOs;

namespace WebHost.Controllers
{
    public class RuteApiController : ApiController
    {
        [Route("rute/soeg")]
        [HttpPost]
        public RuteResponseDTO GetRoutes([FromBody] RuteRequest ruteRequest)
        {
            IList<IExternalServicesApi> externalServices = new List<IExternalServicesApi>()
            {
                new MockService()
            };

            CalculationManager calculationManager = new CalculationManager();
            //calculationManager.CalculateRouteTime(new @by(), new @by(), externalServices);

            var result = new RuteResponseDTO();

            return result;
        }
    }
}