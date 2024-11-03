using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using project2_2210900044.Models;

namespace project2_2210900044.Controllers
{
    public class chi_tiet_don_hangController : Controller
    {
        private prj2_ngohoangminhEntities db = new prj2_ngohoangminhEntities();

        // GET: chi_tiet_don_hang
        public ActionResult Index()
        {
            var chi_tiet_don_hang = db.chi_tiet_don_hang.Include(c => c.don_hang).Include(c => c.skin);
            return View(chi_tiet_don_hang.ToList());
        }

        // GET: chi_tiet_don_hang/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            chi_tiet_don_hang chi_tiet_don_hang = db.chi_tiet_don_hang.Find(id);
            if (chi_tiet_don_hang == null)
            {
                return HttpNotFound();
            }
            return View(chi_tiet_don_hang);
        }

        // GET: chi_tiet_don_hang/Create
        public ActionResult Create()
        {
            ViewBag.dh_id = new SelectList(db.don_hang, "dh_id", "dh_id");
            ViewBag.sk_id = new SelectList(db.skins, "sk_id", "tenskin");
            return View();
        }

        // POST: chi_tiet_don_hang/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "ctdh_id,dh_id,sk_id,soluong,thanh_tien")] chi_tiet_don_hang chi_tiet_don_hang)
        {
            if (ModelState.IsValid)
            {
                db.chi_tiet_don_hang.Add(chi_tiet_don_hang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.dh_id = new SelectList(db.don_hang, "dh_id", "dh_id", chi_tiet_don_hang.dh_id);
            ViewBag.sk_id = new SelectList(db.skins, "sk_id", "tenskin", chi_tiet_don_hang.sk_id);
            return View(chi_tiet_don_hang);
        }

        // GET: chi_tiet_don_hang/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            chi_tiet_don_hang chi_tiet_don_hang = db.chi_tiet_don_hang.Find(id);
            if (chi_tiet_don_hang == null)
            {
                return HttpNotFound();
            }
            ViewBag.dh_id = new SelectList(db.don_hang, "dh_id", "dh_id", chi_tiet_don_hang.dh_id);
            ViewBag.sk_id = new SelectList(db.skins, "sk_id", "tenskin", chi_tiet_don_hang.sk_id);
            return View(chi_tiet_don_hang);
        }

        // POST: chi_tiet_don_hang/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ctdh_id,dh_id,sk_id,soluong,thanh_tien")] chi_tiet_don_hang chi_tiet_don_hang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(chi_tiet_don_hang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.dh_id = new SelectList(db.don_hang, "dh_id", "dh_id", chi_tiet_don_hang.dh_id);
            ViewBag.sk_id = new SelectList(db.skins, "sk_id", "tenskin", chi_tiet_don_hang.sk_id);
            return View(chi_tiet_don_hang);
        }

        // GET: chi_tiet_don_hang/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            chi_tiet_don_hang chi_tiet_don_hang = db.chi_tiet_don_hang.Find(id);
            if (chi_tiet_don_hang == null)
            {
                return HttpNotFound();
            }
            return View(chi_tiet_don_hang);
        }

        // POST: chi_tiet_don_hang/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            chi_tiet_don_hang chi_tiet_don_hang = db.chi_tiet_don_hang.Find(id);
            db.chi_tiet_don_hang.Remove(chi_tiet_don_hang);
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
