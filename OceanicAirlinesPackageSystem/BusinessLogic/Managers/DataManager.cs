<<<<<<< HEAD
﻿using System;
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
=======
﻿using System;
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
>>>>>>> 43f43cab64fbe07f27f1e6e167effebfcd01ee54
