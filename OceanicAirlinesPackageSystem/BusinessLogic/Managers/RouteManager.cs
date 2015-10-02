using System;
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

        private long SaveRoute(CalculationManager.Node destination, forsendelse rute, pakke pakke)
        {
            if (destination.Previous == null)
            {
                rute.pakke = pakke;
                rute.StartBy = destination.By.CityId;
                return DataManager.OpretRute(rute);
            }

            if (rute.SlutBy == null)
                rute.SlutBy = destination.By.CityId;

            var sd = destination.Previous.Ruter.FirstOrDefault(p => p.From == destination.Previous && p.To == destination);

            var forsendelse = new forsendelsesRute();
            forsendelse.StartBy = destination.Previous.By.CityId;
            forsendelse.SlutBy = destination.By.CityId;
            forsendelse.Price = Convert.ToUInt32(sd.Route.Pris);
            forsendelse.TransportTime = sd.Route.Rute.Time;
            forsendelse.TransportType = (Int64)sd.Route.TransportType;

            rute.forsendelsesRute.Add(forsendelse);

            SaveRoute(destination.Previous, rute, pakke);
            return -1; //We never get here, but meh.
        }

        public Tuple<CalculationManager.Node, long> CalculateRouteWeight(by fra, by til, int height, int depth, int width, int weight, int pakkeTypeId)
        {
            var pakke = new pakke
            {
                SizeDepth = depth,
                SizeHight = height,
                SizeWidth = width,
                Weight = weight
            };

            var result = _calculationManager.CalculateRouteWeight(fra, til, _externalApis, pakke, DataManager.HentPakkeType(pakkeTypeId));
            long forsendelsesId = SaveRoute(result, new forsendelse(), pakke);
            return new Tuple<CalculationManager.Node, long> (result, forsendelsesId);
        }

        public Tuple<CalculationManager.Node, long> CalculateRouteTime(by fra, by til, int height, int depth, int width, int weight, int pakkeTypeId)
        {
            var pakke = new pakke
            {
                SizeDepth = depth,
                SizeHight = height,
                SizeWidth = width,
                Weight = weight
            };

            var result = _calculationManager.CalculateRouteTime(fra, til, _externalApis, pakke, DataManager.HentPakkeType(pakkeTypeId));
            var routeId = SaveRoute(result, new forsendelse(), pakke);
            return new Tuple<CalculationManager.Node, long>(result, routeId);
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
