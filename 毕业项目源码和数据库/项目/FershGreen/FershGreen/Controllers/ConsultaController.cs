using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;

namespace FershGreen.Controllers
{
    public class ConsultaController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: Consulta
        public ActionResult Index(int pageIndex = 1, int pageCount = 4, string Name = "")
        {
            string a = Session["Name"].ToString();
            if (Session["Role"].ToString() == "主任医生")
            {
                //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
                List<Consultation> use = db.Consultation.OrderBy(p => p.ConsuID).Where(p => Name == "" || p.ConsuName.Contains(Name))
                     .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
                int totalCount = db.Consultation.OrderBy(p => p.ConsuID).Count();
                //总页.
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
                List<Consultation> use = db.Consultation.OrderBy(p => p.ConsuID).Where(p => (p.ConsuFill == a && Name == "") || (p.ConsuFill == a && p.ConsuName.Contains(Name)))
                     .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
                int totalCount = db.Consultation.OrderBy(p => p.ConsuID).Where(p => p.ConsuFill == a).Count();
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
        public ActionResult Create(Consultation Con)
        {
            db.Consultation.Add(Con);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        //删除
        public ActionResult Delete(int? id)
        {
            var dele = db.Consultation.Find(id);
            db.Consultation.Remove(dele);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        public ActionResult Bithday(int pageIndex = 1, int pageCount = 4)
        {
            var cus1 = db.Customer.ToList();
            var cus2 = new List<Customer>().OrderBy(p=>p.CusID).Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            
            foreach (var item in cus1)
            {
                DateTime date = DateTime.Parse(item.CusBirth.ToString());
                if (date.Month==DateTime.Now.Month&&date.Day<=DateTime.Now.Day+10)
                {
                    cus2.Add(item);
                }
            }
            int totalCount = cus2.OrderBy(p => p.CusBirth).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.cus = cus2;
            return View();
        }
        [HttpPost]
        //编辑
        public ActionResult Edit(Consultation Con)
        {
            db.Entry(Con).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}