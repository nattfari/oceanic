using System.Collections.Generic;
using System.Linq;
using BusinessLogic.ExternalInterfaces;

namespace BusinessLogic.Managers
{
    public class RouteManager
    {
        private readonly IList<IExternalServicesApi> _externalApis;

        public RouteManager(IList<IExternalServicesApi> externalApis)
        {
            _externalApis = externalApis;
        }

        public IEnumerable<string> GetRoutes()
        {
            var result = new List<string>();
            foreach (var externalServicesApi in _externalApis)
            {
                result.AddRange(externalServicesApi.GetRoute());
            }
            return result;
        }
    }
}
