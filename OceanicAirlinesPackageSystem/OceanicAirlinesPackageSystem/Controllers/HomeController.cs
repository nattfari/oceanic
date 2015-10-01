using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BusinessLogic.Data;

namespace WebHost.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            var ctx = new OADbContext();
            
            var by = ctx.by.Where(x => x.Name == "Kairo");
            ViewBag.Title = "Home Page";
            
            return View();
        }
    }
}
