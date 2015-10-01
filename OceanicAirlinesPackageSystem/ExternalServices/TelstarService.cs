using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;
using ExternalServices.DataContracts;
using Newtonsoft.Json;

namespace ExternalServices
{
    public class TelstarService : ExternalService
    {
        public TelstarService()
            : base(@"https://eastindiatrading-ces.azurewebsites.net/")
        {
        }

        public override IEnumerable<by> GetCities()
        {
            var result = HttpClient.GetAsync("api/cities").Result;
            if (result.IsSuccessStatusCode)
            {
                var jsonResponse = result.Content.ReadAsStringAsync().Result;
                var convertedResponse = JsonConvert.DeserializeObject<CitiesResponseContract>(jsonResponse);
                Console.WriteLine();
            }
            return null;
        }

        public override IEnumerable<Route> GetRoute(by by)
        {
            throw new NotImplementedException();
        }
    }
}
