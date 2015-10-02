using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebHost.DataContracts.DTOs
{
    public class UserLoginDTO
    {
        public string Username { get; set; }
        public string Password { get; set; }
    }

    public class OpretBrugerDTO
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string ConfirmPassword { get; set; }
    }
}