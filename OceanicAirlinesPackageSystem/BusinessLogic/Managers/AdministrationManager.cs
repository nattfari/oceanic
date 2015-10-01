using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;

namespace BusinessLogic.Managers
{
    public class AdministrationManager
    {
        public void DeaktiverBy(by by)
        {
            //DataManager.
        }

        public void AktiverBy(by by)
        {
            DataManager.AktiverBy(by);
        }
    }
}
