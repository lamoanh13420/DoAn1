using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class TravelShoppingCartController : Controller
    {
        DulichEntities db = new DulichEntities();
        
        // GET: TravelShoppingCart
        public Cart GetCart()
        {
            Cart cart = Session["Cart"] as Cart;
            if (cart == null || Session["Cart"] == null)
            {
                cart = new Cart();
                Session["Cart"] = cart;
            }
            return cart;
        }

        public ActionResult AddtoCart(int id)
        {
            var tour = db.Tours.SingleOrDefault(s => s.ID_Tour == id);
            if (tour != null)
            {
                GetCart().Add(tour);
            }
            return RedirectToAction("ShowToCart", "TravelShoppingCart");
        }



        public ActionResult ShowToCart()
        {
            if (Session["Cart"] == null)
                return RedirectToAction("ShowToCart", "TravelShoppingCart");
            Cart cart = Session["Cart"] as Cart;
            return View(cart);
        }

        public ActionResult Update_Quantity_Cart(FormCollection form)
        {
            Cart cart = Session["Cart"] as Cart;
            int id_tour = int.Parse(form["id_Tour"]);
            int SoLuongVe = int.Parse(form["SoLuongVe"]);
            cart.Update_Quantity_Shopping(id_tour, SoLuongVe);
            return RedirectToAction("ShowToCart", "TravelShoppingCart");
        }

        public ActionResult RemoveCart(int id)
        {
            Cart cart = Session["Cart"] as Cart;
            cart.Remove_CartItem(id);
            return RedirectToAction("ShowToCart", "TravelShoppingCart");
        }

        public PartialViewResult BagCart()
        {
            int total_item = 0;
            Cart cart = Session["Cart"] as Cart;
            if (cart != null)
            {
                total_item = cart.Total_Quantity();
            }
            ViewBag.infoCart = total_item;
            return PartialView("BagCart");
        }

        public ActionResult CheckOut(FormCollection form)
        {
            try
            {
                Cart cart = Session["Cart"] as Cart;
                DatVe datve = new DatVe();
                datve.NgayDat = DateTime.Now;
                datve.GhiChu = form["GhiChu"];
                datve.ID_KH = int.Parse(form["id_KH"]);
                db.DatVes.Add(datve);
                foreach (var item in cart.Items)
                {
                    ChiTietDatVe chitiet = new ChiTietDatVe();
                    chitiet.ID_DatVe = datve.ID_DatVe;
                    chitiet.ID_Tour = item._tour.ID_Tour;
                    chitiet.ThanhTien = (double)item._tour.Gia;
                    chitiet.SoLuongVe = item._quantity;
                    db.ChiTietDatVes.Add(chitiet);

                }
                db.SaveChanges();
                cart.CleanCart();
                return RedirectToAction("Success", "TravelShoppingCart");
            }
            catch
            {
                return Content("Đặt Vé Không Thành Công!!! Vui Lòng Kiểm Tra Lại Thông Tin Khách Hàng....");
            }
        }

        public ActionResult Success()
        {
            return View();
        }
    }
}