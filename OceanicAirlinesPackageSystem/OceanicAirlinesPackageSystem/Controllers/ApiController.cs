using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;
using ExternalServices;
using WebHost.DataContracts;

namespace WebHost.Controllers
{
    public class ApiController : System.Web.Http.ApiController
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
            var result = routeManager.GetRoutes();

            // TODO: Replace dummy data with our own routes from datamanager
            return new string[] {"by1", "by2"};
        }

        [Route("api/cities/{id}/routes")]
        public IEnumerable<string> GetRoute()
        {
            // TODO: Replace dummy data with our own routes from route
            return new[] {""};
        }
    }
}
