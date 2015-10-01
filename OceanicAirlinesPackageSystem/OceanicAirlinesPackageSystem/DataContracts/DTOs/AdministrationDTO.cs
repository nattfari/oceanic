using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHost.DataContracts.DTOs
{
    public class AdministrationResponse
    {
        public double FragtTypeMultiplierKoel { get; set; }
        public double FragtTypeMultiplierVaaben { get; set; }
        public double FragtTypeMultiplierForsigtig { get; set; }

        public List<LufthavnDTO> Lufthavne { get; set; } 
    }

    public class LufthavnDTO
    {
        public Guid Id { get; set; }
        public string Navn { get; set; }
        public bool Aktiv { get; set; }
    }

    public class PakkeDimension
    {
        
    }

}