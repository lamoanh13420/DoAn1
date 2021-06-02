using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DoAn.Models;

namespace DoAn.Areas.Admin.Controllers
{
    public class LoaiToursController : Controller
    {
        private DulichEntities db = new DulichEntities();

        // GET: Admin/LoaiTours
        public ActionResult Index()
        {
            return View(db.LoaiTours.ToList());
        }

        

        // GET: Admin/LoaiTours/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/LoaiTours/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ID_LoaiTour,TenLoaiTour")] LoaiTour loaiTour)
        {
            if (ModelState.IsValid)
            {
                db.LoaiTours.Add(loaiTour);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(loaiTour);
        }

        // GET: Admin/LoaiTours/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiTour loaiTour = db.LoaiTours.Find(id);
            if (loaiTour == null)
            {
                return HttpNotFound();
            }
            return View(loaiTour);
        }

        // POST: Admin/LoaiTours/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ID_LoaiTour,TenLoaiTour")] LoaiTour loaiTour)
        {
            if (ModelState.IsValid)
            {
                db.Entry(loaiTour).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(loaiTour);
        }

        // GET: Admin/LoaiTours/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            LoaiTour loaiTour = db.LoaiTours.Find(id);
            if (loaiTour == null)
            {
                return HttpNotFound();
            }
            return View(loaiTour);
        }

        // POST: Admin/LoaiTours/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LoaiTour loaiTour = db.LoaiTours.Find(id);
            db.LoaiTours.Remove(loaiTour);
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
