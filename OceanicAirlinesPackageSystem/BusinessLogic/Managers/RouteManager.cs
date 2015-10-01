using System.Collections.Generic;
using System.Linq;
using System.Runtime.Versioning;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;

namespace BusinessLogic.Managers
{
    public class RouteManager
    {
        private readonly IList<IExternalServicesApi> _externalApis;
        private readonly CalculationManager _calculationManager;
        public RouteManager(IList<IExternalServicesApi> externalApis)
        {
            _externalApis = externalApis;
            _calculationManager = new CalculationManager();
        }

        public CalculationManager.Node CalculateRouteWeight(by fra, by til, pakke sendtPakke)
        {
            return _calculationManager.CalculateRouteWeight(fra, til, _externalApis, sendtPakke);
        }

        public CalculationManager.Node CalculateRouteTime(by fra, by til, pakke sendtPakke)
        {
            return _calculationManager.CalculateRouteTime(fra, til, _externalApis, sendtPakke);
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
