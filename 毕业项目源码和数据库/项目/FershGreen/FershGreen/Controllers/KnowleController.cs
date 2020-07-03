using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;

namespace FershGreen.Controllers
{
    public class KnowleController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: Knowle
        /// <summary>
        /// 知识库界面
        /// </summary>
        /// <param name="pageIndex"></param>
        /// <param name="pageCount"></param>
        /// <param name="Name"></param>
        /// <returns></returns>
        public ActionResult Index(int pageIndex = 1, int pageCount =4, string Name = "")
        {
            //return View(db.KnowledgeBase.ToList());
            int totalCount = db.KnowledgeBase.OrderBy(p => p.KnowID).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<KnowledgeBase> use = db.KnowledgeBase.OrderBy(p => p.KnowID).Where(p => Name == "" || p.KnowCommon.Contains(Name))
                 .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;
            return View(use);
        }

        //删除
        public ActionResult Delete(int? id)
        {
            var dele = db.KnowledgeBase.Find(id);
            db.KnowledgeBase.Remove(dele);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        //添加
        [HttpPost]
        public ActionResult Create(KnowledgeBase Kno)
        {
            db.KnowledgeBase.Add(Kno);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}