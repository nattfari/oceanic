using System;
using System.Linq;
using ExternalServices;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace ExternalServicesTest
{
    [TestClass]
    public class ExternalServicesTest
    {
        private ExternalService _externalService;
        [TestInitialize]
        public void Setup()
        {
            _externalService = new TelstarService();

        }

        [TestMethod]
        public void TestGetCities()
        {
            var cities = _externalService.GetCities();
            Assert.IsTrue(cities.ToList().Count <= 32);
        }
    }
}
