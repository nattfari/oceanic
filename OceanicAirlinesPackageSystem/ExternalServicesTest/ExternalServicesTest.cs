using System;
using System.Collections.Generic;
using System.Linq;
using ExternalServices;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace ExternalServicesTest
{
    [TestClass]
    public class ExternalServicesTest
    {
        private List<ExternalService> _externalServices;
        [TestInitialize]
        public void Setup()
        {
            _externalServices = new List<ExternalService>
            {
                new TelstarService(), 
                new EITService()
            };

        }

        [TestMethod]
        public void TestGetCities()
        {
            foreach (var externalService in _externalServices)
            {
                var cities = externalService.GetCities();
                Assert.IsTrue(cities.ToList().Count <= 32);
            }
            
        }
    }
}
