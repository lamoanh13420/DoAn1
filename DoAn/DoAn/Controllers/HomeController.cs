using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;
using PagedList;
using PagedList.Mvc;


namespace DoAn.Controllers
{
    public class HomeController : Controller
    {
        private DulichEntities db = new DulichEntities();
        public ActionResult Index(string searchBy, string search)
        {
            if (searchBy == "TenTour")
            {
                return View(db.Tours.Where(s => s.TenTour.StartsWith(search)).ToList());
            }
            else if (searchBy == "ChiPhi")
            {
                return View(db.Tours.Where(s => s.Gia.ToString().StartsWith(search)).ToList());
            }

            return View(db.Tours.ToList());
        }

        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Tour tour = db.Tours.Find(id);
            if (tour == null)
            {
                return HttpNotFound();
            }
            return View(tour);
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}