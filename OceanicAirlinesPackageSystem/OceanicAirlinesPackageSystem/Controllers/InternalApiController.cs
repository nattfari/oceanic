using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Web.Http;
using AutoMapper;
using BusinessLogic.Data;
using Microsoft.Ajax.Utilities;
using WebHost.DataContracts;
using WebHost.DataContracts.DTOs;

namespace WebHost.Controllers
{
    public class InternalApiController : ApiController
    {
        [Route("internal/cities")]
        [HttpGet]
        public GetCitiesContract GetRoutes()
        {
            OADbContext ctx = new OADbContext();

            var cities = ctx.by.ToList();

            var cityDtos = Mapper.Map<List<@by>, List<CityDTO>>(cities);

            var result = new GetCitiesContract
            {
                Cities = cityDtos
            };

            return result;
        }

        [Route("internal/fragttyper")]
        [HttpGet]
        public List<FragtTypeDTO> GetFragttyper()
        {
            OADbContext ctx = new OADbContext();

            var typer = ctx.packetType.ToList();

            var pakkeTyper = Mapper.Map<List<packetType>, List<FragtTypeDTO>>(typer);

            return pakkeTyper;
        }

        [Route("internal/hentAdministration")]
        [HttpGet]
        public AdministrationResponse getAdministrationInfo()
        {
            OADbContext ctx = new OADbContext();

            var byer = ctx.by.ToList();

            var pakkedimensioner = ctx.pakkeDimintioner.ToList();

            var result = new AdministrationResponse()
            {
                PakkeDimensioner = new List<PakkeDimensionDto>(),
                Lufthavne = new List<LufthavnDTO>()
            };

            foreach (var pakkedimension in pakkedimensioner)
            {
                var dimension = new PakkeDimensionDto();
                var pakkerpriser = pakkedimension.pakkePris.Select(x => new PakkePriserDto()
                {
                    FromWeight = x.FromWeight,
                    ToWeight = x.ToWeight,
                    Price = x.Price,
                    Id = x.Id
                }).ToList();

                dimension.PakkePriser = pakkerpriser;
                dimension.DimensionNavn = pakkedimension.Name;

                result.PakkeDimensioner.Add(dimension);
            }

            result.Lufthavne = Mapper.Map<List<@by>,List<LufthavnDTO>>(byer);

            result.FragtTypeMultipliers = ctx.packetType.Select(x => new FragtTypeMultiplierDTO()
            {
                Multiplier = x.multiplier,
                Name = x.PacketType1

            }).ToList();
            ctx.Dispose();
            return result;
        }

        
        [Route("internal/gemSoegning")]
        [HttpPost]
        public void GemSoegning([FromBody] GemSoegningRequest request)
        {
            OADbContext ctx = new OADbContext();

            var forsendelse = ctx.forsendelse.SingleOrDefault(x => x.Id == request.forsendelseId);
            if(forsendelse != null)
                forsendelse.Saved = true;

            ctx.forsendelse.AddOrUpdate(forsendelse);

            ctx.SaveChanges();
        }

        [Route("internal/administration")]
        [HttpPost]
        public void SaveAdministrationInfo([FromBody] AdministrationResponse administration)
        {
            OADbContext ctx = new OADbContext();

            //pakkepriser foreach find id 
            foreach (var pakkeDimension in administration.PakkeDimensioner)
            {
                foreach (var pakkePris in pakkeDimension.PakkePriser)
                {
                    var dbPakkePris = ctx.pakkePris.FirstOrDefault(x => x.Id == pakkePris.Id);
                    if (dbPakkePris != null)
                    {
                        dbPakkePris.Price = pakkePris.Price;
                        ctx.pakkePris.AddOrUpdate(dbPakkePris);
                    }
                }
            }
            ctx.SaveChanges();

            //byer foreach id sæt aktiv/deaktiv
            foreach (var lufthavn in administration.Lufthavne)
            {
                var dbLufthavn = ctx.by.FirstOrDefault(x => x.Id == lufthavn.Id);
                if (dbLufthavn != null) {
                    dbLufthavn.Active = lufthavn.IsActive;
                    ctx.by.AddOrUpdate(dbLufthavn);
                }
            }

            ctx.SaveChanges();

            //pakketyper where name == administration.pakketype
            foreach (var pakkeType in administration.FragtTypeMultipliers)
            {
                var dbPakkeType = ctx.packetType.FirstOrDefault(x => x.PacketType1 == pakkeType.Name);
                if (dbPakkeType != null) {
                    dbPakkeType.multiplier = pakkeType.Multiplier;
                    ctx.packetType.AddOrUpdate();
                }
            }

            ctx.SaveChanges();
            ctx.Dispose();
        }
    }
    public class GemSoegningRequest
    {
        public long forsendelseId { get; set; }
    }
}
