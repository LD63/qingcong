using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;


namespace FershGreen.Controllers
{
    public class InspectController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: Inspect
        /// <summary>
        /// 体检类容界面
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageCount"></param>
        /// <param name="Name"></param>
        /// <returns></returns>
        public ActionResult Index(int pageIndex = 1, int pageCount = 4, string Name = "")
        {
            
            // return View(db.Inspect.ToList());
            int totalCount = db.Inspect.OrderBy(p => p.InID).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Inspect> use = db.Inspect.OrderBy(p => p.InID).Where(p => Name == "" || p.InName.Contains(Name))
                 .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;
            return View(use);
        }
        //添加
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Inspect inspect, Surgery surgery, Internal Int)
        {
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
    }
}