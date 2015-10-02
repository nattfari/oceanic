using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Globalization;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using ExternalServices.DataContracts;
using Newtonsoft.Json;
using TransportType = BusinessLogic.Data.TransportType;

namespace ExternalServices
{
    public abstract class ExternalService : IExternalServicesApi, IDisposable
    {
        protected HttpClient HttpClient;

        protected ExternalService(string endpoint, string apiKey)
        {
            HttpClient = new HttpClient();
            HttpClient.DefaultRequestHeaders.Accept.Clear();
            HttpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            HttpClient.DefaultRequestHeaders.Authorization = new AuthenticationHeaderValue(apiKey);
            //HttpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("charset=UTF-8"));
            var uriBuilder = new UriBuilder(endpoint);
            HttpClient.BaseAddress = uriBuilder.Uri;
        }

        public virtual IEnumerable<by> GetCities()
        {
            var cities = new List<by>();
            var result = HttpClient.GetAsync("api/cities").Result;
            if (result.IsSuccessStatusCode)
            {
                var jsonResponse = result.Content.ReadAsStringAsync().Result;
                var convertedResponse = JsonConvert.DeserializeObject<CitiesResponseContract>(jsonResponse);

                cities = convertedResponse.cities.Select(city => new @by() { Id = city.id, Name = city.name }).ToList();
            }
//            else
//            {
//                throw new WebException(string.Format("GetCities from {0} failed", HttpClient.BaseAddress));
//            }
            return cities;
        }

        public virtual IEnumerable<Route> GetRoute(by by, pakke pakke)
        {
            var routes = new List<Route>();

            var queryString = HttpUtility.ParseQueryString(string.Empty);
            queryString["date"] = DateTime.Now.AddDays(1).ToString("o");
            queryString["measurements"] = string.Format("{0}x{1}x{2}", pakke.SizeDepth, pakke.SizeHight, pakke.SizeWidth);
            queryString["weight"] = (pakke.Weight * 0.001).ToString(CultureInfo.InvariantCulture);
            queryString["requirements"] = GetRequirements(pakke.packetType.forsendelsesType);
            var queryParams = queryString.ToString();

            //var result = HttpClient.GetAsync(uriBuilder.ToString()).Result;
            var url = string.Format("api/cities/{0}/routes?{1}", by.CityId, queryParams);
            var result = HttpClient.GetAsync(url).Result;
            if (result.IsSuccessStatusCode)
            {
                var jsonResponse = result.Content.ReadAsStringAsync().Result;
                var convertedResponse = JsonConvert.DeserializeObject<RouteResponseContract>(jsonResponse);
                routes =
                    convertedResponse.routes.Select(
                        route =>
                            new Route()
                            {
                                Pris = route.price,
                                Rute =
                                    new rute()
                                    {
                                        Time = route.duration,
                                        EndCity = route.destination,
                                        StartCity = by.CityId
                                    }
                            }).ToList();

            }
//            else
//            {
//                throw new WebException(string.Format("GetRoutes from {0} failed", HttpClient.BaseAddress));                
//            }
            return routes;
        }

        private static string GetRequirements(IEnumerable<forsendelsesType> requirements)
        {
            var packedIds = requirements.Select(forsendelsesType => forsendelsesType.packetTypeId.ToString());
            return string.Join(", ", packedIds);
        }

        public void Dispose()
        {
            HttpClient.Dispose();
        }
    }
}
