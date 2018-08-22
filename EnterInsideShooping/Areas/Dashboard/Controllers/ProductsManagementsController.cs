using EnterInsideShooping.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;

namespace EnterInsideShooping.Areas.Dashboard.Controllers
{
    public class ProductsManagementsController : Controller
    {
        private GreeneryEntities db = new GreeneryEntities();
        // GET: Dashboard/ProductsManagements
                // GET: Products1
        public ActionResult Index()
        {
            var products = db.Products.Include(p => p.Category).Include(p => p.Storage).Include(p => p.User);
            return View(products.ToList());
        }

        // GET: Products1/Details/5
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

        // GET: Products1/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name");

            ViewBag.StorageId = new SelectList(db.Storages, "StorageId", "Storage1");
            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username");
            return View();
        }

        // POST: Products1/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ProductId,ProductName,Image,UserId,CategoryId,ColorId,ModelId,StorageId,SellStartDate,SellEndDate,IsNew,Price")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name", product.CategoryId);

            ViewBag.StorageId = new SelectList(db.Storages, "StorageId", "Storage1", product.StorageId);
            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username", product.UserId);
            return View(product);
        }
        //public ActionResult Create(ArtWork artwork, HttpPostedFileBase image)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        if (image != null)
        //        {
        //            //attach the uploaded image to the object before saving to Database
        //            artwork.ImageMimeType = image.ContentLength;
        //            artwork.ImageData = new byte[image.ContentLength];
        //            image.InputStream.Read(artwork.ImageData, 0, image.ContentLength);

        //            //Save image to file
        //            var filename = image.FileName;
        //            var filePathOriginal = Server.MapPath("/images/upload");
        //            var filePathThumbnail = Server.MapPath("/images/upload");
        //            string savedFileName = Path.Combine(filePathOriginal, filename);
        //            image.SaveAs(savedFileName);

        //            //Read image back from file and create thumbnail from it
        //            var imageFile = Path.Combine(Server.MapPath("~/Content/Uploads/Originals"), filename);
        //            using (var srcImage = Image.FromFile(imageFile))
        //            using (var newImage = new Bitmap(100, 100))
        //            using (var graphics = Graphics.FromImage(newImage))
        //            using (var stream = new MemoryStream())
        //            {
        //                graphics.SmoothingMode = SmoothingMode.AntiAlias;
        //                graphics.InterpolationMode = InterpolationMode.HighQualityBicubic;
        //                graphics.PixelOffsetMode = PixelOffsetMode.HighQuality;
        //                graphics.DrawImage(srcImage, new Rectangle(0, 0, 100, 100));
        //                newImage.Save(stream, ImageFormat.Png);
        //                var thumbNew = File(stream.ToArray(), "image/png");
        //                artwork.ArtworkThumbnail = thumbNew.FileContents;
        //            }
        //        }

        //        //Save model object to database
        //        db.ArtWorks.Add(artwork);
        //        db.SaveChanges();
        //        return RedirectToAction("Index");
        //    }

        //    return View(artwork);
        //}
        // GET: Products1/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name", product.CategoryId);

            ViewBag.StorageId = new SelectList(db.Storages, "StorageId", "Storage1", product.StorageId);
            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username", product.UserId);
            return View(product);
        }

        // POST: Products1/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ProductId,ProductName,Image,UserId,CategoryId,ColorId,ModelId,StorageId,SellStartDate,SellEndDate,IsNew,Price")] Product product)
        {
            if (ModelState.IsValid)
            {
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "CategoryId", "Name", product.CategoryId);

            ViewBag.StorageId = new SelectList(db.Storages, "StorageId", "Storage1", product.StorageId);
            ViewBag.UserId = new SelectList(db.Users, "UserId", "Username", product.UserId);
            return View(product);
        }

        // GET: Products1/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Products1/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Product product = db.Products.Find(id);
            db.Products.Remove(product);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
