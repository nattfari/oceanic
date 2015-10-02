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
    public class EITService : ExternalService
    {
        public EITService()
            : base(@"https://eastindiatrading-ces.azurewebsites.net/", "f701a1b0-8c20-40b1-8dbd-8dc566653cdd")
        {
        }

    }
}
