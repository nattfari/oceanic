using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebHost.DataContracts.DTOs;

namespace WebHost.DataContracts
{
    public class GetCitiesContract
    {
        public List<CityDTO> cities;

        public GetCitiesContract()
        {
            cities = new List<CityDTO>();
        }
    }
}