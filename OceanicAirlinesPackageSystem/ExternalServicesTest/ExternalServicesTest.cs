using System;
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
            _externalService = new MockService();

        }

        [TestMethod]
        public void TestGetCities()
        {
            var cities = _externalService.GetCities();
        }
    }
}
