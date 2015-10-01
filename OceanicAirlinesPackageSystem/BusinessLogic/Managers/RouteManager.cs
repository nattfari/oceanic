using System.Collections.Generic;
using BusinessLogic.ExternalInterfaces;

namespace BusinessLogic.Managers
{
    public class RouteManager
    {
        private readonly IList<IExternalApi> _externalApis;

        public RouteManager(IList<IExternalApi> externalApis)
        {
            _externalApis = externalApis;
            var CalcualationManager = new CalculationManager();
        }
    }
}
