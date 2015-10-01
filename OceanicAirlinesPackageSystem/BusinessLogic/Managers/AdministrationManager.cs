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
            DataManager.DeaktiverBy(by);
        }

        public void AktiverBy(by by)
        {
            DataManager.AktiverBy(by);
        }

        public List<pakkePris> HentPakkePriser ()
        {
            return DataManager.HentPakkePriser();
        }

        public IList<@by> HentAktiveredeByer()
        {
            return DataManager.HentAktiveredeByer();
        }

        public IList<@by> HentDeaktiveredeByer()
        {
            return DataManager.HentDeaktiveredeByer();
        }


    }
}
