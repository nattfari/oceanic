using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHost.DataContracts.DTOs
{
    public class RouteDTO
    {
        public int destination { get; set; }
        public int price { get; set; }
        public int duration { get; set; }
    }
}