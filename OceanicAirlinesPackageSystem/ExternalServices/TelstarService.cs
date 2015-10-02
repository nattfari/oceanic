using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using BusinessLogic.Data;

namespace ExternalServices
{
    public class TelstarService : ExternalService
    {
        public TelstarService()
            : base(@"https://telstarlogistics-ces.azurewebsites.net", "bb4952b4-1d5d-4150-9679-402146913031")
        {
        }

        protected override BusinessLogic.Data.TransportType GetTransportType()
        {
            return BusinessLogic.Data.TransportType.TELSTAR;
        }
    }
}
