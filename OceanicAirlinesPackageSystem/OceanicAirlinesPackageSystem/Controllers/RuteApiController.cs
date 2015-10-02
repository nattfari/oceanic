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
            var billigsteRute = new CalculationManager.Node();

            var dimension = ctx.pakkeDimintioner.SingleOrDefault(x => x.Name == ruteRequest.DimensionsType);
            
            var fraBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.FraBy);
            var tilBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.TilBy);
            
            int Id;
            long hurtigsteRuteId = 0;
            long billigsteRuteId = 0;

            if (ruteRequest.FragtTyper.Length > 0)
                Id = Convert.ToInt32(ruteRequest.FragtTyper.First());
            else
            {
                Id = Int32.MaxValue;
            }
            
            if(fraBy != null && tilBy != null) {                
                RouteManager routeManager = new RouteManager(externalServices);
                var routeManagerResult = routeManager.CalculateRouteTime(fraBy, tilBy, dimension.Height, dimension.Depth, dimension.Width, ruteRequest.Vaegt, Id);    
                
                rute = routeManagerResult.Item1;
                hurtigsteRuteId = routeManagerResult.Item2;

                var billigsteRouteManagerResult = routeManager.CalculateRouteWeight(fraBy, tilBy, dimension.Height,
                    dimension.Depth, dimension.Width, ruteRequest.Vaegt, Id);
                
                billigsteRute = billigsteRouteManagerResult.Item1;
                billigsteRuteId = billigsteRouteManagerResult.Item2;
            }

            ctx.Dispose();

            //map rute til ruteresponsedto
            var billigsteRuteDto = Mapper.Map<RuteDTO>(billigsteRute);
            var ruteDto = Mapper.Map<RuteDTO>(rute);

            foreach (var ruteTrin in ruteDto.RuteTrin)
            {
                ruteDto.TotalTid += ruteTrin.Tid;
                ruteDto.TotalPris += ruteTrin.Pris;
                ruteDto.RuteType = "Hurtigste Rute";
                ruteDto.RuteId = hurtigsteRuteId;
            }

            foreach (var ruteTrin in billigsteRuteDto.RuteTrin)
            {
                billigsteRuteDto.TotalTid += ruteTrin.Tid;
                billigsteRuteDto.TotalPris += ruteTrin.Pris;
                billigsteRuteDto.RuteType = "Billigste Rute";
                billigsteRuteDto.RuteId = billigsteRuteId;
            }

            RuteResponseDTO result = new RuteResponseDTO()
            {
                Ruter = new List<RuteDTO>() { ruteDto, billigsteRuteDto },
                RuteRequest = ruteRequest                
            };

            return result;
        }
    }
}