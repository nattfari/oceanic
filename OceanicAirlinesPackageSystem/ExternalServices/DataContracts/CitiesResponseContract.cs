using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExternalServices.DataContracts
{
    public class CitiesResponseContract
    {
        public IEnumerable<City> cities { get; set; }
    }

    public class City
    {
        public int id { get; set; }
        public string name { get; set; }
    }
}
