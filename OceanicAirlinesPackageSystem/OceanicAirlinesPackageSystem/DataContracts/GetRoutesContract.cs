using System.Collections.Generic;
using WebHost.DataContracts.DTOs;

namespace WebHost.DataContracts
{
    public class GetRoutesContract
    {
        public IEnumerable<RouteDTO> routes { get; set; }

        public GetRoutesContract()
        {
            routes = new List<RouteDTO>();
        }
    }
}