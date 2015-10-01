using System.Collections.Generic;
using System.Linq;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;

namespace BusinessLogic.Managers
{
    public class RouteManager
    {
        private readonly IList<IExternalServicesApi> _externalApis;

        public RouteManager(IList<IExternalServicesApi> externalApis)
        {
            _externalApis = externalApis;
            var mgr = new CalculationManager();
            
        }

        public IEnumerable<Route> GetRoutes(by by)
        {
            var result = new List<Route>();
            foreach (var externalServicesApi in _externalApis)
            {
                result.AddRange(externalServicesApi.GetRoute(by));
            }
            return result;
        }
    }
}
