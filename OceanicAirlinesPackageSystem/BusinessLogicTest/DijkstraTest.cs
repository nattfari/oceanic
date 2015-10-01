using System;
using System.Collections.Generic;
using System.Diagnostics;
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
    public class DijkstraTest
    {

        public void printRute(CalculationManager.Node n)
        {
            if (n.Previous != null)
                printRute(n.Previous);
            Debug.WriteLine(n.By.Name);
        }

        [TestMethod]
        public void TestDijkstra()
        {
            var by1 = DataManager.HentByer().First();
            
            var manager = new CalculationManager();
            List<IExternalServicesApi> w = new List<IExternalServicesApi>();
            w.Add(new TestThingie());
            var pakke = new pakke() {SizeDepth = 30, SizeHight = 50, SizeWidth = 30, Weight = 4500};
            for (int i = 1; i < 32 ; i++)
            {
                var by2 = DataManager.HentByer().ToArray()[i];
            var result = manager.CalculateRouteWeight(by1, by2, w, pakke);
            if (result != null)
            {
                Debug.WriteLine(String.Format("Fra: {0} til {1}", by1.Name, by2.Name));
                printRute(result);
            }
            }
        }
    }
}