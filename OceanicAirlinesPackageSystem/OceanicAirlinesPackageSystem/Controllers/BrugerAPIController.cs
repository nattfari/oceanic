using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using AutoMapper;
using BusinessLogic.Data;
using WebHost.DataContracts.DTOs;

namespace WebHost.Controllers
{
    public class BrugerAPIController : ApiController
    {
        [Route("user/create")]
        [HttpPost]
        public bool OpretBruger([FromBody] OpretBrugerDTO bruger)
        {
            OADbContext ctx = new OADbContext();

            users user = new users()
            {
                BrugerNavn = bruger.Username,
                password = bruger.Password,
                IsAdmin = bruger.IsAdmin
            };

            ctx.users.Add(user);
            ctx.SaveChanges();

            return true;
        }

        [Route("user/hentAdministration")]
        [HttpGet]
        public AdministrationResponse getAdministrationInfo()
        {
            OADbContext ctx = new OADbContext();

            var byer = ctx.by.ToList();

            var pakkedimensioner = ctx.pakkeDimintioner;

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

            result.Lufthavne = Mapper.Map<List<@by>, List<LufthavnDTO>>(byer);

            result.FragtTypeMultipliers = ctx.packetType.Select(x => new FragtTypeMultiplierDTO()
            {
                Multiplier = x.multiplier,
                Name = x.PacketType1

            }).ToList();
            ctx.Dispose();
            return result;
        }

        [Route("user/login")]
        [HttpPost]
        public UserLoginResponse Login([FromBody] UserLoginDTO bruger)
        {
            OADbContext ctx = new OADbContext();

            var user = ctx.users.SingleOrDefault(x => x.BrugerNavn == bruger.Username && x.password == bruger.Password);

            if (user != null)
            {
                UserLoginResponse loginSuccess = new UserLoginResponse()
                {
                    IsAdmin = user.IsAdmin,
                    Result = true
                };

                return loginSuccess;
            }

            UserLoginResponse loginFailed = new UserLoginResponse()
            {
                Result = false,
                IsAdmin = false
            };
            ctx.Dispose();
            return loginFailed;
        }
    }
}