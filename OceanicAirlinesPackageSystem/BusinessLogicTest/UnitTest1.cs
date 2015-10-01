using System;
using System.Collections.Generic;
using System.Linq;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using BusinessLogic.Managers;
using ExternalServices;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace BusinessLogicTest
{
    public class TestThingie : IExternalServicesApi
    {
        public virtual IEnumerable<by> GetCities()
        {
            return new[] { new @by { CityId = 344, Id = 344, Name = "njdsak" }, new by { CityId = 344, Id = 344, Name = "jkjkj" } };
        }

        public virtual IEnumerable<Route> GetRoute(by by)
        {
            return new[] { new Route { TransportType = TransportType.EIC, Pris = 11, Rute = new rute { Time = 8, StartCity = 1, EndCity = 2 } } };
        }
    }


    [TestClass]
    public class UnitTest1
    {


        [TestMethod]
        public void TestDijkstra()
        {
            var by1 = DataManager.HentByer().First();
            var by2 = DataManager.HentByer().ToArray()[15];
            var manager = new CalculationManager();
            List<IExternalServicesApi> w = new List<IExternalServicesApi>();
            w.Add(new TestThingie());
             manager.CalculateRouteTime(by1, by2, w);

        }
    }
}