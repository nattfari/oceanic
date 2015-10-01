using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using AutoMapper;
using BusinessLogic.Data;
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
            OADbContext ctx = new OADbContext();

            var cities = ctx.by.ToList();

            var cityDtos = Mapper.Map<List<@by>, List<CityDTO>>(cities);

            var result = new GetCitiesContract
            {
                Cities = cityDtos
            };

            return result;
        }

        [Route("internal/fragttyper")]
        [HttpGet]
        public List<FragtTypeDTO> GetFragttyper()
        {
            OADbContext ctx = new OADbContext();

            var typer = ctx.packetType.ToList();

            var pakkeTyper = Mapper.Map <List<packetType>, List<FragtTypeDTO>>(typer);

            return pakkeTyper;
        }
    }
}
