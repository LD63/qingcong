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
            string a = Session["Name"].ToString();
            if (Session["Role"].ToString() == "主任医生")
            {
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
            else
            {
                int totalCount = db.Inspect.OrderBy(p => p.InID).Where(p=>p.InDoctor==a).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<Inspect> use = db.Inspect.OrderBy(p => p.InID).Where(p=>(p.InDoctor == a && Name == "") || (p.InDoctor == a && p.InName.Contains(Name)))
                 .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;
            return View(use);
            }
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
        //修改
        public ActionResult Edit(int? id)
        {
            var Ins = db.Inspect.Find(id);
            var Sur = db.Surgery.Where(p => p.SInID == id).ToList();
            var Int = db.Internal.Where(p => p.DInID == id).ToList();
            ViewBag.Cus = Ins;
            ViewBag.Pre = Sur;
            ViewBag.His = Int;
            return View();
        }
        [HttpPost]
        public ActionResult Edit(Inspect inspect, Surgery surgery, Internal nal)
        {
            db.Entry(inspect).State = System.Data.Entity.EntityState.Modified;
            db.Entry(surgery).State = System.Data.Entity.EntityState.Modified;
            db.Entry(nal).State = System.Data.Entity.EntityState.Modified;

            db.SaveChanges();
            return RedirectToAction("Index");
        }
        //详情
        public ActionResult Details(int? id)
        {
            var Ins = db.Inspect.Find(id);
            var Sur = db.Surgery.Where(p => p.SInID == id).ToList();
            var Int = db.Internal.Where(p => p.DInID == id).ToList();
            ViewBag.Cus = Ins;
            ViewBag.Pre = Sur;
            ViewBag.His = Int;
            return View();
        }
        //删除
        public ActionResult Delete(int? id)
        {
            var dele1 = db.Surgery.Where(p => p.SInID == id).ToList();
            db.Surgery.RemoveRange(dele1);
            var dele2 = db.Internal.Where(p => p.DInID == id).ToList();
            db.Internal.RemoveRange(dele2);
            var dele = db.Inspect.Find(id);
            db.Inspect.Remove(dele);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}