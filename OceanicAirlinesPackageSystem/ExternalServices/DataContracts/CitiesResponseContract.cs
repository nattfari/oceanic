using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ExternalServices.DataContracts
{
    public class CitiesResponseContract
    {
        public IEnumerable<CityDTO> cities { get; set; }
    }

    public class CityDTO
    {
        public int id { get; set; }
        public string name { get; set; }
    }
}
