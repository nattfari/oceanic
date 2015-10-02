using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using AutoMapper;
using BusinessLogic.Data;
using ExternalServices.DataContracts;
using Newtonsoft.Json;

namespace ExternalServices
{
    public class TelstarService : ExternalService
    {
        public TelstarService()
            : base(@"https://telstarlogistics-ces.azurewebsites.net", "bb4952b4-1d5d-4150-9679-402146913031")
        {
        }

    }
}
