using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Data
{
    public enum TransportType
    {
        Oceanic = 1,
        TELSTAR = 2,
        EIC = 3
    }

    public class Route
    {
        public rute Rute;
        public double Pris;
        public TransportType TransportType;
    }
}