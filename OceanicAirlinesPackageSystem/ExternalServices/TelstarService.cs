using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExternalServices
{
    class TelstarService : ExternalService
    {
        public TelstarService() : base("test")
        {
        }

        public override IEnumerable<string> GetCities()
        {
            throw new NotImplementedException();
        }

        public override IEnumerable<string> GetRoute()
        {
            throw new NotImplementedException();
        }
    }
}
