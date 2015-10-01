using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
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
                return (from ruteObjekt in context.rute
                    where ruteObjekt.StartCity == _by.CityId
                    select ruteObjekt).Select(r => new Route {Rute = r, TransportType = TransportType.Oceanic}).ToList();
            }
        }

        public static void AktiverBy(by by)
        {
            using (var context = new OADbContext())
            {
              //  context.by.AddOrUpdate();
            }
        }
    }
}
