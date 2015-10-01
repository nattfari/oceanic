using System.Collections.Generic;
using System.Runtime.Serialization;
using WebHost.DataContracts.DTOs;

namespace WebHost.DataContracts
{
    [DataContract]
    public class GetRoutesContract
    {
        [DataMember(Name = "routes")]
        public IEnumerable<RouteDTO> Routes { get; set; }

        public GetRoutesContract()
        {
            Routes = new List<RouteDTO>();
        }
    }
}