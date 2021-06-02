using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;
using PagedList;
using PagedList.Mvc;

namespace DoAn.Areas.Admin.Controllers
{
    public class ToursController : Controller
    {
        private DulichEntities db = new DulichEntities();

        // GET: Admin/Tours
        public ActionResult Index(int? page)
        {
            if (page == null) page = 1;
            var tours = (from l in db.Tours
                           select l).OrderBy(x => x.ID_Tour);
            int pageSize = 5;
            int pageNum = (page ?? 1);

            return View(tours.ToPagedList(pageNum, pageSize));
        }

        // GET: Admin/Tours/Details/5
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

        // GET: Admin/Tours/Create
        public ActionResult Create()
        {
            ViewBag.ID_LoaiTour = new SelectList(db.LoaiTours, "ID_LoaiTour", "TenLoaiTour");
            return View();
        }

        // POST: Admin/Tours/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Tour tour)
        {
            try
            {
                if (tour.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(tour.ImageUpload.FileName);
                    string extension = Path.GetExtension(tour.ImageUpload.FileName);
                    fileName = fileName + extension;
                    tour.HinhAnh = "~/Images/" + fileName;
                    tour.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Images/"), fileName));
                }
                ViewBag.ID_LoaiTour = new SelectList(db.LoaiTours, "ID_LoaiTour", "TenLoaiTours", tour.ID_LoaiTour);
                db.Tours.Add(tour);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/Tours/Edit/5
        public ActionResult Edit(int? id)
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
            ViewBag.ID_LoaiTour = new SelectList(db.LoaiTours, "ID_LoaiTour", "TenLoaiTour", tour.ID_LoaiTour);
            return View(tour);
        }

        // POST: Admin/Tours/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Tour tour)
        {
            if (tour.ImageUpload != null)
            {
                string fileName = Path.GetFileNameWithoutExtension(tour.ImageUpload.FileName);
                string extension = Path.GetExtension(tour.ImageUpload.FileName);
                fileName = fileName + extension;
                tour.HinhAnh = "~/Images/" + fileName;
                tour.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Images/"), fileName));

            }

            ViewBag.ID_LoaiTour = new SelectList(db.LoaiTours, "ID_LoaiTour", "TenLoaiTours", tour.ID_LoaiTour);
            db.Entry(tour).State = EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        // GET: Admin/Tours/Delete/5
        public ActionResult Delete(int? id)
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

        // POST: Admin/Tours/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Tour tour = db.Tours.Find(id);
            db.Tours.Remove(tour);
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
