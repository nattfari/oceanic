using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
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

            return loginFailed;
        }
    }
}