using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Net.Http;
using System.Web;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;
using ExternalServices;

namespace WebHost.Controllers
{
    public class ExternalApiController : ApiController
    {
        [Route("api/cities")]
        [HttpGet]
        public IEnumerable<string> GetCitites()
        {
            IList<IExternalServicesApi> externalServices = new List<IExternalServicesApi>()
            {
                new MockService()
            };
            var routeManager = new RouteManager(externalServices);
            var result = routeManager.GetRoutes(new @by());

            // TODO: Replace dummy data with our own routes from datamanager
            return new string[] {"by1", "by2"};
        }

        [Route("api/cities/{id}/routes/")]
        [HttpGet]
        public IEnumerable<string> GetRoute(
            [FromUri] string id, 
            [FromBody] DateTime date, 
            string messurements = null, 
            int? weight = null, 
            string requirements = null)
        {
            var routeData = Request.GetRouteData();
            
            // TODO: Replace dummy data with our own routes from route
            return new[] {""};
        }
    }
}
