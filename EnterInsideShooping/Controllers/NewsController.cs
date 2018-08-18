using EnterInsideShooping.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
//using PagedList;

namespace EnterInsideShooping.Controllers
{
    public class NewsController : Controller
    {
        // GET: News
        GreeneryEntities db = new GreeneryEntities();
        public ActionResult Index()
        {
            return View();
        }
        public PartialViewResult NewsListPartial()
        {
            var newsList = db.News.OrderByDescending(x => x.NewsId).ToList();
            return PartialView(newsList);


        }


        //public PartialViewResult NewsListPartial(int? page)
        //{
        //    var pageNumber = page ?? 1;
        //    var pageSize = 10;
        //    var newsList = db.News.OrderByDescending(x => x.NewsId).ToPagedList(pageNumber, pageSize);
        //    return PartialView(newsList);


        //}
    }
}