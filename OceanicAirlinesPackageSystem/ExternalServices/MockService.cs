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
        public MockService() : base(@"https://google.dk", "123")
        {

        }

        public override IEnumerable<by> GetCities()
        {
            var result = new List<@by>()
            {
                new @by() {CityId = 1, Id = 1, Name = "Cairo"},
                new @by() {CityId = 2, Id = 2, Name = "Tanger"},
                new @by() {CityId = 3, Id = 3, Name = "Cake Town"},
                new @by() {CityId = 5, Id = 5, Name = "I Am Lost"},
                new @by() {CityId = 8, Id = 8, Name = "Oh no!"},
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
