using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class CustomerController : Controller
    {
        DulichEntities db = new DulichEntities();
        // GET: Customers
        public ActionResult Create()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Create(KhachHang kh)
        {
            db.KhachHangs.Add(kh);
            db.SaveChanges();
            return RedirectToAction("ShowToCart", "TravelShoppingCart");
        }
    }
}