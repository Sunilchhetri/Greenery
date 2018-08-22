using EnterInsideShooping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace EnterInsideShooping.Controllers
{
    public class LoginController : Controller
    {
        GreeneryEntities db = new GreeneryEntities();
        // GET: Login
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(Users data)
        {
            var checklogin = db.Users.Where(x => x.Username == data.Username && x.Password == data.Password).Count();

            if (checklogin != 0)
            {
                return RedirectToAction("Index", "Products");

            }
            ViewBag.msg = "Incorrect password or username";
            return View();
            
        }
    }
}