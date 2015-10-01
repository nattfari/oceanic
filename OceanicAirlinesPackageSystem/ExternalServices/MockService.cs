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
            throw new NotImplementedException();
            //return new[] {"city1", "city2"};
        }

        public override IEnumerable<Route> GetRoute(by by)
        {
            throw new NotImplementedException();
            //return new[] {"route1", "route2"};
        }
    }
}
