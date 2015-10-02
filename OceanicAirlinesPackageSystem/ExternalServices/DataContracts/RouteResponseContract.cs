using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Text;
using System.Threading.Tasks;

namespace ExternalServices.DataContracts
{
    public class RouteResponseContract
    {
        public List<RouteDTO> routes { get; set; }

        public class RouteDTO
        {
            public int destination { get; set; }
            public int price { get; set; }
            public int duration { get; set; }
        }

    }
}
