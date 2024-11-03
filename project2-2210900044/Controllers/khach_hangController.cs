﻿using System;
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
    public class khach_hangController : Controller
    {
        private prj2_ngohoangminhEntities db = new prj2_ngohoangminhEntities();

        // GET: khach_hang
        public ActionResult Index()
        {
            return View(db.khach_hang.ToList());
        }

        // GET: khach_hang/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khach_hang khach_hang = db.khach_hang.Find(id);
            if (khach_hang == null)
            {
                return HttpNotFound();
            }
            return View(khach_hang);
        }

        // GET: khach_hang/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: khach_hang/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "kh_id,ten,email,sodienthoai")] khach_hang khach_hang)
        {
            if (ModelState.IsValid)
            {
                db.khach_hang.Add(khach_hang);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(khach_hang);
        }

        // GET: khach_hang/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khach_hang khach_hang = db.khach_hang.Find(id);
            if (khach_hang == null)
            {
                return HttpNotFound();
            }
            return View(khach_hang);
        }

        // POST: khach_hang/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "kh_id,ten,email,sodienthoai")] khach_hang khach_hang)
        {
            if (ModelState.IsValid)
            {
                db.Entry(khach_hang).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(khach_hang);
        }

        // GET: khach_hang/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            khach_hang khach_hang = db.khach_hang.Find(id);
            if (khach_hang == null)
            {
                return HttpNotFound();
            }
            return View(khach_hang);
        }

        // POST: khach_hang/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            khach_hang khach_hang = db.khach_hang.Find(id);
            db.khach_hang.Remove(khach_hang);
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
