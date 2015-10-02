using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;

namespace WebHost.DataContracts.DTOs
{
    [DataContract]
    public class ErrorMessageDTO
    {
        [DataMember(Name = "code")]
        public int Code { get; set; }

        [DataMember(Name = "description")]
        public string Description { get; set; }

        [DataMember(Name = "timestamp")]
        public string Timestamp { get; set; }
    }
}