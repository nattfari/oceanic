using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading.Tasks;
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

        public virtual IEnumerable<string> GetCities()
        {
            var response = HttpClient.GetAsync("api/cities");
            if (response.Result.IsSuccessStatusCode)
            {
                response.Result.Content.ReadAsStringAsync();
            }
            return new[] {"te", "tes"};
        }

        public virtual IEnumerable<string> GetRoute()
        {
            return new[] {"12", "12"};
        }

        public void Dispose()
        {
            HttpClient.Dispose();
        }
    }
}
