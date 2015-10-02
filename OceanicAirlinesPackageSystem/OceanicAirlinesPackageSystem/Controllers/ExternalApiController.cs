using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using System.Net.Http;
using System.Web;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;
using ExternalServices;
using WebHost.DataContracts;
using WebHost.DataContracts.DTOs;
using WebHost.Factories;
using WebHost.Filters;

namespace WebHost.Controllers
{
    [AuthorizeByApiKey]
    public class ExternalApiController : ApiController
    {
        [Route("api/cities")]
        [HttpGet]
        public GetCitiesContract GetCitites()
        {
            var aktiveByer = DataManager.HentAktiveredeByer();
            
            var citiesContract = new GetCitiesContract()
            {
                Cities = aktiveByer.Select(city => new CityDTO(){Id = city.CityId, Name = city.Name}).ToList()
            };

            return citiesContract;
        }

        [Route("api/cities/{id}/routes/")]
        [HttpGet]
        public GetRoutesContract GetRoute(
            [FromUri] string id, 
            DateTime date,
            string measurements,
            int? weight, 
            string requirements = null)
        {
            var routeManager = ManagerFactory.GetRouteManager();
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
