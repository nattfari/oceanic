using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;

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
            var response = HttpClient.GetAsync("api/cities");
            if (response.Result.IsSuccessStatusCode)
            {
                response.Result.Content.ReadAsStringAsync();
            }
            return new[] { new by { CityId = 1, Id = 1, Name = "By1" }, new by { CityId = 2, Id = 2, Name = "By2" } };
        }

        public virtual IEnumerable<Route> GetRoute(by by)
        {
            return new[] { new Route { TransportType = TransportType.EIC, Pris = 11, Rute = new rute { Time = 8, StartCity = 1, EndCity = 2 } }};
        }

        public void Dispose()
        {
            HttpClient.Dispose();
        }
    }
}
