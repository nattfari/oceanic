using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHost.DataContracts.DTOs
{
    public class AdministrationResponse
    {
        public List<FragtTypeMultiplierDTO> FragtTypeMultipliers { get; set; } 
        public List<CityDTO> Lufthavne { get; set; } 
        public List<PakkeDimensionDto> PakkeDimensioner { get; set; } 
    }

    public class FragtTypeMultiplierDTO
    {
        public float Multiplier { get; set; }
        public string Name { get; set; }
    }

    public class PakkeDimensionDto
    {
        public string DimensionNavn { get; set; }
        public List<PakkePriserDto> PakkePriser { get; set; } 
    }

    public class PakkePriserDto
    {
        public int FromWeight { get; set; }
        public int ToWeight { get; set; }
        public int Price { get; set; }
        public long Id { get; set; }
    }
}