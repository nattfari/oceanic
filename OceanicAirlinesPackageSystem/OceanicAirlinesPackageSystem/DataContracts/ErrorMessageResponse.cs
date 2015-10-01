using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using WebHost.DataContracts.DTOs;

namespace WebHost.DataContracts
{
    [DataContract]
    public class ErrorMessageResponse
    {
        [DataMember(Name = "error")]
        public ErrorMessageDTO Error { get; set; }

        public ErrorMessageResponse(int code, string description, string timestamp)
        {
            Error = new ErrorMessageDTO()
            {
                Code = code,
                Description = description,
                Timestamp = timestamp,
            };
        }
    }
}