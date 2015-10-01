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

            var ctx = new OADbContext();
            
            var fraBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.FraBy);
            var tilBy = ctx.by.SingleOrDefault(x => x.Name == ruteRequest.TilBy);
            var pakkepris = ctx.pakkeDimintioner.FirstOrDefault(p => p.Name == ruteRequest.DimensionsType);
            var pakke = new pakke {Weight = Convert.ToInt32(ruteRequest.Vaegt), SizeDepth = pakkepris.Depth, SizeWidth = pakkepris.Width, SizeHight = pakkepris.Height};
            if(fraBy != null && tilBy != null) {
                CalculationManager calculationManager = new CalculationManager();
                var rute = calculationManager.CalculateRouteTime(fraBy, tilBy, externalServices.ToList(), pakke);
            }

            ctx.Dispose();

            //map rute til ruteresponsedto
            var result = new RuteResponseDTO();

            return result;
        }
    }
}