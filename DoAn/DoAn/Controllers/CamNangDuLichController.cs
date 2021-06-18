using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Controllers
{
    public class CamNangDuLichController : Controller
    {
        DulichEntities db = new DulichEntities();
        // GET: CamNangDuLich
        public ActionResult Index()
        {
            return View(db.CamNangDuLiches.ToList());
        }

        // GET: XemTinTuc/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CamNangDuLich CNDL = db.CamNangDuLiches.Find(id);

            if (CNDL == null)
            {
                return HttpNotFound();
            }
            return View(CNDL);
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