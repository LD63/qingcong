using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;

namespace FershGreen.Controllers
{
    public class AppointController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: Appoint

            /// <summary>
            /// 体检预约
            /// </summary>
            /// <param name="pageIndex"></param>
            /// <param name="pageCount"></param>
            /// <param name="Name"></param>
            /// <returns></returns>
        public ActionResult Index(int pageIndex = 1, int pageCount = 4, string Name = "")
        {
            // return View(db.Appointment.ToList());
            int totalCount = db.Appointment.OrderBy(p => p.AppID).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Appointment> use = db.Appointment.OrderBy(p => p.AppID).Where(p => Name == "" || p.AppName.Contains(Name))
                 .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;
            return View(use);
        }

        //填写体检类容
        public ActionResult Edit(int? id)
        {
            var App = db.Appointment.Find(id);
            ViewBag.Name1 = App.AppName;
            ViewBag.Date = string.Format("{0:yyyy-MM-dd}", DateTime.Now);
            ViewBag.Iso= App.AppIsomorphism;
            return View(App);
            //return RedirectToAction("Index");
        }
        [HttpPost]
        public ActionResult Edit(Appointment App,Inspect inspect, Surgery surgery, Internal Int)
        {
            db.Entry(App).State = System.Data.Entity.EntityState.Modified;
            var Cus = db.Inspect.Add(inspect);
            if (Cus.InID != null)
            {
                db.Surgery.Add(surgery);
                db.Internal.Add(Int);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }
        //添加
        [HttpPost]
        public ActionResult Create(Appointment App)
        {
            db.Appointment.Add(App);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //删除
        public ActionResult Delete(int? id)
        {
            var dele = db.Appointment.Find(id);
            db.Appointment.Remove(dele);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
    }