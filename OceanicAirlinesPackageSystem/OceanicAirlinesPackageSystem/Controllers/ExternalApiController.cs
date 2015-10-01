using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Net.Http;
using System.Web;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;
using ExternalServices;
using WebHost.DataContracts;
using WebHost.DataContracts.DTOs;

namespace WebHost.Controllers
{
    public class ExternalApiController : ApiController
    {
        [Route("api/cities")]
        [HttpGet]
        public GetCitiesContract GetCitites()
        {
            IList<IExternalServicesApi> externalServices = new List<IExternalServicesApi>()
            {
                new MockService()
            };
            var routeManager = new RouteManager(externalServices);
            // TODO: Replace dummy data with our own routes from datamanager


            var result = new GetCitiesContract()
            {
                Cities = new List<CityDTO>()
                {
                    new CityDTO() {Id = 1, Name = "Cario"},
                    new CityDTO() {Id = 2, Name = "Tanger"},
                    new CityDTO() {Id = 3, Name = "Tunis"},
                    new CityDTO() {Id = 4, Name = "Tripoli"},
                    new CityDTO() {Id = 5, Name = "De Kanariske Øer"},

                }
            };

            return result;
        }

        [Route("api/cities/{id}/routes/")]
        [HttpGet]
        public GetRoutesContract GetRoute(
            [FromUri] string id, 
            DateTime date,
            string measurements,
            int? weight, 
            string requirements,
            string types)
        {
            
            // TODO: Replace dummy data with our own routes from route
            var result = new GetRoutesContract()
            {
                Routes = new List<RouteDTO>()
                {
                    new RouteDTO() {destination = 1, duration = 8, price = 8},
                    new RouteDTO() {destination = 2, duration = 3, price = 8},
                    new RouteDTO() {destination = 3, duration = 7, price = 8},
                    new RouteDTO() {destination = 4, duration = 1, price = 8},
                }
            };
            return result;
        }
    }
}
