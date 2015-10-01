using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;

namespace ExternalServices
{
    public class MockService : ExternalService
    {
        public MockService() : base(@"https://google.dk")
        {

        }

        public override IEnumerable<by> GetCities()
        {
            var result = new List<@by>()
            {
                new @by() {CityId = 1, Id = 1, Name = "Cairo"},
                new @by() {CityId = 2, Id = 2, Name = "Tanger"},
                new @by() {CityId = 32, Id = 32, Name = "St. Helena"},
            };
            return result;
        }

        public override IEnumerable<Route> GetRoute(by by)
        {
            var result = new List<Route>()
            {
                new Route()
                {
                    Pris = 20,
                    Rute = new rute()
                    {
                        EndCity = 1,
                        StartCity = 3,
                        Id = 5,
                        Time = 5000
                    },
                    TransportType = TransportType.TELSTAR
                },
                new Route()
                {
                    Pris = 20,
                    Rute = new rute()
                    {
                        EndCity = 2,
                        StartCity = 5,
                        Id = 6,
                        Time = 12000
                    },
                    TransportType = TransportType.EIC
                },
                new Route()
                {
                    Pris = 20,
                    Rute = new rute()
                    {
                        EndCity = 2,
                        StartCity = 8,
                        Id = 9,
                        Time = 12000
                    },
                    TransportType = TransportType.Oceanic
                },

            };
            return result;
        }
    }
}
