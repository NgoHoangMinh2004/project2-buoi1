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
    public class skinsController : Controller
    {
        private prj2_ngohoangminhEntities db = new prj2_ngohoangminhEntities();

        // GET: skins
        public ActionResult Index()
        {
            return View(db.skins.ToList());
        }

        // GET: skins/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            skin skin = db.skins.Find(id);
            if (skin == null)
            {
                return HttpNotFound();
            }
            return View(skin);
        }

        // GET: skins/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: skins/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "sk_id,tenskin,mota,gia")] skin skin)
        {
            if (ModelState.IsValid)
            {
                db.skins.Add(skin);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(skin);
        }

        // GET: skins/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            skin skin = db.skins.Find(id);
            if (skin == null)
            {
                return HttpNotFound();
            }
            return View(skin);
        }

        // POST: skins/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "sk_id,tenskin,mota,gia")] skin skin)
        {
            if (ModelState.IsValid)
            {
                db.Entry(skin).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(skin);
        }

        // GET: skins/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            skin skin = db.skins.Find(id);
            if (skin == null)
            {
                return HttpNotFound();
            }
            return View(skin);
        }

        // POST: skins/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            skin skin = db.skins.Find(id);
            db.skins.Remove(skin);
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
