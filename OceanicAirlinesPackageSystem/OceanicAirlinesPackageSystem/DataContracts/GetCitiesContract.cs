using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.Web;
using WebHost.DataContracts.DTOs;

namespace WebHost.DataContracts
{
    [DataContract]
    public class GetCitiesContract
    {
        [DataMember(Name = "cities")]
        public List<CityDTO> Cities;

        public GetCitiesContract()
        {
            Cities = new List<CityDTO>();
        }
    }
}