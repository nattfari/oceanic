using System.Collections.Generic;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;
using ExternalServices;

namespace WebHost.Factories
{
    public static class ManagerFactory
    {
        public static RouteManager GetRouteManager()
        {
            IList<IExternalServicesApi> externalServices = new List<IExternalServicesApi>()
            {
                new EITService(),
                new TelstarService()
            };
            var routeManager = new RouteManager(externalServices);
            return routeManager;
        }
    }
}
