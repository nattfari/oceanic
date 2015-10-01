using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AutoMapper;
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

            OADbContext ctx = new OADbContext();
            var rute = new CalculationManager.Node();

            var fraBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.FraBy);
            var tilBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.TilBy);

            if(fraBy != null && tilBy != null) {
                RouteManager routeManager = new RouteManager(externalServices);
                CalculationManager calculationManager = new CalculationManager();
                rute = calculationManager.CalculateRouteTime(fraBy, tilBy, externalServices.ToList());
            }

            ctx.Dispose();

            //map rute til ruteresponsedto
            var ruteDto = Mapper.Map<RuteDTO>(rute);

            RuteResponseDTO result = new RuteResponseDTO()
            {
                Ruter = new List<RuteDTO>() { ruteDto }
            };

            return result;
        }
    }
}