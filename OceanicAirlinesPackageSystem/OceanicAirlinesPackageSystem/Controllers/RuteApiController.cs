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

            var dimension = ctx.pakkeDimintioner.SingleOrDefault(x => x.Name == ruteRequest.DimensionsType);
            
            var fraBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.FraBy);
            var tilBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.TilBy);
            int Id;
            if (ruteRequest.FragtTyper.Length == 0)
                Id = Convert.ToInt32(ruteRequest.FragtTyper.First());
            else
            {
                Id = Int32.MaxValue;
            }
            
            if(fraBy != null && tilBy != null) {
                RouteManager routeManager = new RouteManager(externalServices);
                rute = routeManager.CalculateRouteTime(fraBy, tilBy, 25, 25, 25, 1000, Id);
            }

            ctx.Dispose();

            //map rute til ruteresponsedto
            var ruteDto = Mapper.Map<RuteDTO>(rute);

            foreach (var ruteTrin in ruteDto.RuteTrin)
            {
                ruteDto.TotalTid += ruteTrin.Tid;
                ruteDto.TotalPris += ruteTrin.Pris;
            }

            RuteResponseDTO result = new RuteResponseDTO()
            {
                Ruter = new List<RuteDTO>() { ruteDto },
                RuteRequest = ruteRequest                
            };

            return result;
        }
    }
}