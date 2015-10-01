using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
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

        protected ExternalService(string endpoint)
        {
            HttpClient = new HttpClient();
            HttpClient.DefaultRequestHeaders.Accept.Clear();
            HttpClient.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
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
            else
            {
                throw new WebException(string.Format("GetCities from {0} failed", HttpClient.BaseAddress));
            }
            return cities;
        }

        public virtual IEnumerable<Route> GetRoute(by by)
        {
            //TODO: Get routes from external service
            return new[] { new Route { TransportType = TransportType.EIC, Pris = 11, Rute = new rute { Time = 8, StartCity = 1, EndCity = 2 } }};
        }

        public void Dispose()
        {
            HttpClient.Dispose();
        }
    }
}
