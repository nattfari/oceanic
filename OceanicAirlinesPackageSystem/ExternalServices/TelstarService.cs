using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;

namespace ExternalServices
{
    class TelstarService : ExternalService
    {
        public TelstarService() : base("test")
        {
        }

        public override IEnumerable<by> GetCities()
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<Route> GetRoute(by by)
        {
            throw new NotImplementedException();
        }
    }
}
