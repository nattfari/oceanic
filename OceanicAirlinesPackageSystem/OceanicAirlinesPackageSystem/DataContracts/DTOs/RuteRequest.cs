using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHost.DataContracts.DTOs
{
    public class RuteRequest
    {
        public string FraBy { get; set; }
        public string TilBy { get; set; }
        public int Vaegt { get; set; }
        public string[] FragtTyper { get; set; }
        public string DimensionsType { get; set; }
    }
}