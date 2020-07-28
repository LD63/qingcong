using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;

namespace FershGreen.Controllers
{
    public class ReturnVisitController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: ReturnVisit
        /// <summary>
        /// 回访记录
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageCount"></param>
        /// <param name="Name"></param>
        /// <returns></returns>
        public ActionResult Index(int pageIndex = 1, int pageCount = 4, string Name = "")
        {
            string a = Session["Name"].ToString();
            ViewBag.bag = db.Customer.Where(p=>p.CusDoctor==a).ToList();
          
            if (Session["Role"].ToString() == "主任医生")
            {
                //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
                List<ReturnVisit> use = db.ReturnVisit.OrderBy(p => p.RetID).Where(p => Name == "" || p.RetName.Contains(Name))
                     .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
                int totalCount = db.ReturnVisit.OrderBy(p => p.RetID).Count();
                //总页数
                double totalPage = Math.Ceiling((double)totalCount / pageCount);
                ViewBag.pageIndex = pageIndex;
                ViewBag.pageCount = pageCount;
                ViewBag.totalCount = totalCount;
                ViewBag.totalPage = totalPage;
                ViewBag.Name = Name;
                return View(use);
            }
            else
            {
                //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
                List<ReturnVisit> use = db.ReturnVisit.OrderBy(p => p.RetID).Where(p => (p.RetPeople == a && Name == "") || (p.RetPeople == a && p.RetName.Contains(Name)))
                     .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
                int totalCount = db.ReturnVisit.OrderBy(p => p.RetID).Where(p => p.RetPeople == a).Count();
                //总页数
                double totalPage = Math.Ceiling((double)totalCount / pageCount);
                ViewBag.pageIndex = pageIndex;
                ViewBag.pageCount = pageCount;
                ViewBag.totalCount = totalCount;
                ViewBag.totalPage = totalPage;
                ViewBag.Name = Name;
                return View(use);
            }

        }
        [HttpPost]
        //添加
        public ActionResult Create(ReturnVisit visit)
        {
            db.ReturnVisit.Add(visit);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        //删除
        public ActionResult Delete(int? id)
        {
           var dele= db.ReturnVisit.Find(id);
            db.ReturnVisit.Remove(dele);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        [HttpPost]
        //编辑
        public ActionResult Edit(ReturnVisit visit)
        {
            db.Entry(visit).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}