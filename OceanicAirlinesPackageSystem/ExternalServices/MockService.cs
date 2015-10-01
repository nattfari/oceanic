using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExternalServices
{
    public class MockService : ExternalService
    {
        public MockService() : base("")
        {

        }

        public override IEnumerable<string> GetCities()
        {
            return new[] {"city1", "city2"};
        }

        public override IEnumerable<string> GetRoute()
        {
            return new[] {"route1", "route2"};
        }
    }
}
