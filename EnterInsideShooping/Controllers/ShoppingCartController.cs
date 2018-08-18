using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EnterInsideShooping.Models;
using System.Net;

namespace EnterInsideShooping.Controllers
{
    public class ShoppingCartController : Controller
    {
        GreeneryEntities db = new GreeneryEntities();
        private string strCart = "Cart";
        // GET: ShoppingCart
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult OrderNow(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            if (Session[strCart] == null)
            {
                List<Cart> lsCart = new List<Cart>
                {
                    new Cart(db.Products.Find(id),1)
                };
                Session[strCart] = lsCart;
            }
            else
            {
                List<Cart> lsCart = (List<Cart>)Session[strCart];
                int check = IsExistingCheck(id);
                if (check == 0)
                    lsCart.Add(new Cart(db.Products.Find(id), 1));
                else
                    lsCart[check].Quantity++;
                //lsCart.Add(new Cart(db.Products.Find(id), 1));
                Session[strCart] = lsCart;
            }
            return View("Index");

        }
        private int IsExistingCheck(int? id)
        {


            List<Cart> lsCart = (List<Cart>)Session[strCart];
            int a = lsCart.Count;

            for (int i = 0; i < a; i++)
            {
                if (lsCart[i].Product.ProductId == id)
                    return i;
            }
            return 0;
        }

        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            int check = IsExistingCheck(id);
            List<Cart> lsCart = (List<Cart>)Session[strCart];
            lsCart.RemoveAt(check);
            return View("Index");
        }
        public ActionResult UpdateCart(FormCollection frc)
        {
            string[] quantities = frc.GetValues("quantity");
            List<Cart> lstCart = (List<Cart>)Session[strCart];
            for (int i = 0; i < lstCart.Count; i++)
            {
                lstCart[i].Quantity = Convert.ToInt32(quantities[i]);
            }
            Session[strCart] = lstCart;
            return View("Index");
        }

        
        public ActionResult CheckOut()
        {
            return View("CheckOut");
        }
        public ActionResult ProcessOrder(FormCollection frc)
        {
            List<Cart> lstCart = (List < Cart >) Session[strCart];
            //save the order into order table
            Order order = new Order()
            {
                CustomerName = frc["cusName"],
                CustomerPhone = frc["cusPhone"],
                CustomerEmail = frc["cusEmail"],
                CustomerAddress = frc["cusAddress"],
                OrderDate = DateTime.Now,
                PaymentType="Cash",
                Status="Processing"
            };
            db.Orders.Add(order);
            db.SaveChanges();
            //Save the order detail into order detail table
            foreach (Cart cart in lstCart)
            {
                OrderDetail orderDetail = new OrderDetail()
                {
                    OrderID=order.OrderID,
                    ProductID=cart.Product.ProductId,
                    Quantity=cart.Quantity,
                    Price=cart.Product.Price
                };
                db.OrderDetails.Add(orderDetail);
                db.SaveChanges();
            }
            //Remove shopping cart session
            Session.Remove(strCart);
            return View("OrderSuccess");
        }
    }
}