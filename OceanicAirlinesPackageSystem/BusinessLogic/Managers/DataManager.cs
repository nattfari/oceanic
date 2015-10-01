using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;

namespace BusinessLogic.Managers
{
    public class DataManager
    {
        public static IList<by> HentByer()
        {
            using (var context = new OADbContext())
            {
                return context.by.ToList();
            }
        }

        public static IList<Route> HentRuter(by _by)
        {
            using (var context = new OADbContext())
            {
                return (from thing in context.rute
                    where thing.StartCity == _by.CityId
                    select thing).Select(r => new Route {Rute = r, TransportType = TransportType.Oceanic}).ToList();
            }
        }
    }
}
