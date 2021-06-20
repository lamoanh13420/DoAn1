using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Areas.Admin.Controllers
{
    public class DatVeController : Controller
    {
        DulichEntities db = new DulichEntities();
        // GET: Admin/LichTrinhs
        public ActionResult Index()
        {
            return View(db.DatVes.ToList());
        }
    }
}