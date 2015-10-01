using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;

namespace BusinessLogic.Managers
{
    class DataManager
    {
        public static IList<by> HentByer()
        {
            using (var context = new OADbContext())
            {
                return context.by.ToList();
            }
        }
    }
}
