using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EnterInsideShooping.Models;

namespace EnterInsideShooping.Controllers
{
    public class ProductsController : Controller
    {
        private GreeneryEntities db = new GreeneryEntities();
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult ProductListPartial()
        {
            var productList = db.Products.OrderByDescending(x => x.ProductId).ToList();
            return PartialView(productList);
        }
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }  
    }
}
