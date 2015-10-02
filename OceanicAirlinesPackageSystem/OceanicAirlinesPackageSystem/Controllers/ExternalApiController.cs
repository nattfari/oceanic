using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Http;
using BusinessLogic.Data;
using BusinessLogic.Managers;
using WebHost.DataContracts;
using WebHost.DataContracts.DTOs;
using WebHost.Filters;

namespace WebHost.Controllers
{
    [AuthorizeByApiKey]
    public class ExternalApiController : ApiController
    {
        [Route("api/cities")]
        [HttpGet]
        public GetCitiesContract GetCitites()
        {
            var aktiveByer = DataManager.HentAktiveredeByer();
            
            var citiesContract = new GetCitiesContract
            {
                Cities = aktiveByer.Select(city => new CityDTO {Id = city.CityId, Name = city.Name}).ToList()
            };

            return citiesContract;
        }

        [Route("api/cities/{id}/routes/")]
        [HttpGet]
        public GetRoutesContract GetRoute(
            [FromUri] int id, 
            DateTime date,
            string measurements,
            double weight, 
            string requirements = null)
        {
            var routesResult = new GetRoutesContract();
            List<RouteDTO> routes = new List<RouteDTO>();
            try
            {
                var splittedMeasurements = measurements.Split('x');

                var depth = (int) Convert.ToDouble(splittedMeasurements[0]);
                var width = (int) Convert.ToDouble(splittedMeasurements[1]);
                var height = (int) Convert.ToDouble(splittedMeasurements[2]);
                var package = new pakke
                {
                    SizeDepth = depth,
                    SizeWidth = width,
                    SizeHight = height,
                    Weight = (int)(weight * 1000),
                    forsendelse = new List<forsendelse>
                    {
                        new forsendelse
                        {
                            AfsendelsesDato = date,
                            forsendelsesType = GetForsendelsesType(requirements)
                        }
                    }
                };
                var ruter = DataManager.HentRuter(new @by {CityId = id});

                var calculationManager = new CalculationManager();

                var forsendelsesTyper = GetForsendelsesType(requirements).Select(x => x.packetTypeId.Value).ToList();
                var multiplier = DataManager.HentPakkeType(forsendelsesTyper);

                routes = new List<RouteDTO>();
                foreach (var route in ruter)
                {
                    routes.Add(new RouteDTO
                    {
                        destination = route.Rute.EndCity,
                        duration = route.Rute.Time,
                        price = Convert.ToInt32(calculationManager.BeregnPris(package, multiplier))
                    });
                }
            }
            catch (Exception)
            {

            }

            routesResult.Routes = routes;
            return routesResult;
        }

        private ICollection<forsendelsesType> GetForsendelsesType(string requirements)
        {
            var splittedRequirements = requirements.Split(',');
            var result = splittedRequirements.Select(splittedRequirement => new forsendelsesType {packetTypeId = int.Parse(splittedRequirement)}).ToList();
            return result;
        }
    }
}
