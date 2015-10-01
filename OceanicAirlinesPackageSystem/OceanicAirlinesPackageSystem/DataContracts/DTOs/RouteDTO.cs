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
        public int destination { get; set; }
        public int price { get; set; }
        public int duration { get; set; }
    }
}