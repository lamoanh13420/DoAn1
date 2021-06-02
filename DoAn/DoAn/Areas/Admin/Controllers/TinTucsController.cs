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
    public class TinTucsController : Controller
    {
        private DulichEntities db = new DulichEntities();

        // GET: Admin/TinTucs
        public ActionResult Index(int ? page)
        {
            if (page == null) page = 1;
            var tinTucs = (from l in db.TinTucs
                         select l).OrderBy(x => x.ID_TT);
            int pageSize = 5;
            int pageNum = (page ?? 1);

            return View(tinTucs.ToPagedList(pageNum,pageSize));
        }

        // GET: Admin/TinTucs/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // GET: Admin/TinTucs/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/TinTucs/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(TinTuc tt)
        {
            try
            {
                if (tt.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(tt.ImageUpload.FileName);
                    string extension = Path.GetExtension(tt.ImageUpload.FileName);
                    fileName = fileName + extension;
                    tt.ImageTT = "~/Images/" + fileName;
                    tt.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Images/"), fileName));
                    tt.NgayNhapTT = DateTime.Now;
                }
                
                db.TinTucs.Add(tt);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/TinTucs/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // POST: Admin/TinTucs/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TinTuc tt)
        {
            try
            {
                if (tt.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(tt.ImageUpload.FileName);
                    string extension = Path.GetExtension(tt.ImageUpload.FileName);
                    fileName = fileName + extension;
                    tt.ImageTT = "~/Images/" + fileName;
                    tt.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Images/"), fileName));
                    tt.NgayNhapTT = DateTime.Now;
                }

                db.Entry(tt).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        // GET: Admin/TinTucs/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            TinTuc tinTuc = db.TinTucs.Find(id);
            if (tinTuc == null)
            {
                return HttpNotFound();
            }
            return View(tinTuc);
        }

        // POST: Admin/TinTucs/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TinTuc tinTuc = db.TinTucs.Find(id);
            db.TinTucs.Remove(tinTuc);
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
