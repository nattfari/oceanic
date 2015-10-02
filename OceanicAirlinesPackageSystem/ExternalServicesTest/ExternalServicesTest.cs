using System;
using System.Collections.Generic;
using System.Linq;
using BusinessLogic.Data;
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

        [TestMethod]
        public void TestGetRoutes()
        {
            var city = new @by() {Active = true, CityId = 2, Id = 2, Name = "Cairo"};
            var package = new pakke()
            {
                SizeDepth = 30,
                SizeHight = 50,
                SizeWidth = 30,
                Weight = 4500,
                packetType = new packetType()
                {
                    forsendelsesType = new List<forsendelsesType>()
                    {
                        new forsendelsesType(){packetTypeId = 1}
                    }
                }
            };
            foreach (var externalService in _externalServices)
            {
                var routes = externalService.GetRoute(city, package);
                Assert.IsTrue(routes != null);
            }
        }
    }
}
