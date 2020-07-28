using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;

namespace FershGreen.Controllers
{
    public class CustomerController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: Customer
        /// <summary>
        /// 客户信息界面
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageCount"></param>
        /// <param name="Name"></param>
        /// <returns></returns>
        public ActionResult Index(int pageIndex = 1, int pageCount = 4, string Name = "")
        {
            //return View(db.Customer.ToList()); //总行数
                string a = Session["Name"].ToString();
                if (Session["Role"].ToString()=="主任医生")
                {
                    //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
                    List<Customer> use = db.Customer.OrderBy(p => p.CusID).Where(p => Name == "" || p.CusName.Contains(Name))
                         .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
                    int totalCount = db.Customer.OrderBy(p => p.CusDoctor).Count();
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
                    List<Customer> use = db.Customer.OrderBy(p => p.CusID).Where(p => (p.CusDoctor == a && Name == "") ||(p.CusDoctor == a&& p.CusName.Contains(Name)))
                         .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
                    int totalCount = db.Customer.OrderBy(p => p.CusID).Where(p => p.CusDoctor == a).Count();
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
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Customer customer,Present present,MedicalHistory history,Family family,Menstrual menstrual,Marriage marriage)
        {
            var Cus = db.Customer.Add(customer);
            if (Cus.CusID!=null)
            {
                db.Present.Add(present);
                db.MedicalHistory.Add(history);
                db.Family.Add(family);
                db.Menstrual.Add(menstrual);
                db.Marriage.Add(marriage);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }
            public ActionResult Edit(int? id)
        {
            var Cus = db.Customer.Find(id);
            var Pre = db.Present.Where(p => p.PCusID == id).ToList();
            var His = db.MedicalHistory.Where(p => p.MCusID == id).ToList();
            var Fam = db.Family.Where(p => p.FCusID == id).ToList();
            var Men = db.Menstrual.Where(p => p.SCusID == id).ToList();
            var Mar = db.Marriage.Where(p => p.RCusID == id).ToList();
            ViewBag.Cus = Cus;
            ViewBag.Pre = Pre;
            ViewBag.His = His;
            ViewBag.Fam = Fam;
            ViewBag.Men = Men;
            ViewBag.Mar = Mar;
            return View();
        }
        [HttpPost]
        public ActionResult Edit(Customer customer, Present present, MedicalHistory history, Family family, Menstrual menstrual, Marriage marriage)
        {
            db.Entry(customer).State = System.Data.Entity.EntityState.Modified;
            db.Entry(present).State = System.Data.Entity.EntityState.Modified;
            db.Entry(history).State = System.Data.Entity.EntityState.Modified;
            db.Entry(family).State = System.Data.Entity.EntityState.Modified;
            db.Entry(menstrual).State = System.Data.Entity.EntityState.Modified;
            db.Entry(marriage).State = System.Data.Entity.EntityState.Modified;

            db.SaveChanges();
            return RedirectToAction("Index");
        }
        //详情
        public ActionResult Details(int? id)
        {
            var Cus = db.Customer.Find(id);
            var Pre = db.Present.Where(p => p.PCusID == id).ToList();
            var His = db.MedicalHistory.Where(p => p.MCusID == id).ToList();
            var Fam = db.Family.Where(p => p.FCusID == id).ToList();
            var Men = db.Menstrual.Where(p => p.SCusID == id).ToList();
            var Mar = db.Marriage.Where(p => p.RCusID == id).ToList();
            ViewBag.Cus = Cus;
            ViewBag.Pre = Pre;
            ViewBag.His = His;
            ViewBag.Fam = Fam;
            ViewBag.Men = Men;
            ViewBag.Mar = Mar;
            return View();
        }
        //删除
        public ActionResult Delete(int? id)
        {
            var dele1 = db.MedicalHistory.Where(p => p.MCusID == id).ToList();
            db.MedicalHistory.RemoveRange(dele1);
            var dele2 = db.Present.Where(p => p.PCusID == id).ToList();
            db.Present.RemoveRange(dele2);
            var dele3 = db.Family.Where(p => p.FCusID == id).ToList();
            db.Family.RemoveRange(dele3);
            var dele4 = db.Menstrual.Where(p => p.SCusID == id).ToList();
            db.Menstrual.RemoveRange(dele4);
            var dele5 = db.Marriage.Where(p => p.RCusID == id).ToList();
            db.Marriage.RemoveRange(dele5);
            var dele = db.Customer.Find(id);
            db.Customer.Remove(dele);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}