using System.Collections.Generic;
using System.Web.Http;
using WebHost.DataContracts;
using WebHost.DataContracts.DTOs;

namespace WebHost.Controllers
{
    public class InternalApiController : ApiController
    {
        [Route("internal/cities")]
        [HttpGet]
        public GetCitiesContract GetRoutes()
        {
            var result = new GetCitiesContract
            {
                cities = new List<CityDTO>()
                {
                    new CityDTO() {Id = 1, Name = "Aalborg"},
                    new CityDTO() {Id = 2, Name = "København"},
                    new CityDTO() {Id = 3, Name = "Aarhus"},
                    new CityDTO() {Id = 4, Name = "Roskilde"},
                    new CityDTO() {Id = 5, Name = "Snekkersten"},
                }
            };
            return result;
        }

    }
}
