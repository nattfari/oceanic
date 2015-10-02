using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WebHost.DataContracts.DTOs
{
    [DataContract]
    public class RouteDTO
    {
        [DataMember(Name = "destination")]
        public long destination { get; set; }
        [DataMember(Name = "price")]
        public int price { get; set; }
        [DataMember(Name = "duration")]
        public int duration { get; set; }
    }
}