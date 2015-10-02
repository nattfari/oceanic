using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHost.DataContracts.DTOs
{   
    public class RuteRequestDTO
    {
        public string FraBy { get; set; }
        public string TilBy { get; set; }
        public string Vaegt { get; set; }
        public string[] FragtTyper { get; set; }
        public int Dimension { get; set; }
        public List<RuteDTO> Ruter { get; set; } 
    }

    public class RuteResponseDTO
    {
        public RuteRequest RuteRequest { get; set; }
        public List<RuteDTO> Ruter { get; set; }
    }

    public class RuteDTO
    {
        public long RuteId { get; set; }
        public string RuteType { get; set; }
        public double TotalTid { get; set; }
        public double TotalPris { get; set; }
        public List<RuteTrinDTO> RuteTrin { get; set; } 
    }

    public class RuteTrinDTO
    {
        public string FraBy { get; set; }
        public string TilBy { get; set; }
        public int Tid { get; set; }
        public double Pris { get; set; }
        public string TransportType { get; set; }
    }
}