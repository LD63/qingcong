using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;
using System.IO;

namespace FershGreen.Controllers
{
    public class UserController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: User
        public ActionResult Index(int?id)
        {
            
            return View(db.UserInfo.Find(id));
        }
        [HttpPost]
        public ActionResult Index( UserInfo user, HttpPostedFileBase file)
        {
            //先处理图片
            //1、获取上传的文件名
            if (file != null)
            {
                string fileName = Path.GetFileName(file.FileName);
                string e = Path.GetExtension(fileName);//截取出来的会带点
                if (e == ".jpg" || e == ".png" || e == ".gif" || e == ".bmp")
                {
                    file.SaveAs(Server.MapPath("~/images/" + fileName));
                    user.UserPicture = fileName;
                    Session["Pic"] = user.UserPicture;
                }
                else
                {
                    ViewBag.Message = "图片格式上传不正确!!";
                }
            }
            Session["Name"] = user.UserName;
            db.Entry(user).State = System.Data.Entity.EntityState.Modified;
            db.SaveChanges();
            return RedirectToAction("Index","Customer");
        }

        //修改密码
        public ActionResult Edit(int? id)
        {
            return View(db.UserInfo.Find(id));
        }
        [HttpPost]
        public ActionResult Edit(UserInfo user1,string UserPwd1)
        {
            UserInfo Info = db.UserInfo.Find(user1.UserID);
            if (Info.UserPwd== UserPwd1)
            {
                Info.UserID = user1.UserID;
                Info.UserLogin = user1.UserLogin;
                Info.UserName = user1.UserName;
                Info.UserPicture = user1.UserPicture;
                Info.UserQua = user1.UserQua;
                Info.UserSex = user1.UserSex;
                Info.UserRole = user1.UserRole;
                Info.UserPwd = user1.UserPwd;
                db.Configuration.ValidateOnSaveEnabled = false;
                db.SaveChanges();
                db.Configuration.ValidateOnSaveEnabled = true;
                return Content("<script>alert('密码修改成功,请重新登录！');window.location='/Login/Index'</script>");
            }
            else
            {
                return Content("<script>alert('旧密码不正确，请重新输入');history.go(-1);</script>");
            }

        }
        //查询
        public ActionResult List(int pageIndex = 1, int pageCount = 4, string Name = "")
        {
            //return View(db.UserInfo.ToList());
            int totalCount = db.UserInfo.OrderBy(p => p.UserID).Count();
            //总页数
            double totalPage = Math.Ceiling((double)totalCount / pageCount);
            //获得用户集合 , 分页查询Skip（）跳过指定数量的集合 Take() 从过滤后返回的集合中再从第一行取出指定的行数
            List<UserInfo> use = db.UserInfo.OrderBy(p => p.UserID).Where(p => Name == "" || p.UserName.Contains(Name))
                 .Skip((pageIndex - 1) * pageCount).Take(pageCount).ToList();
            ViewBag.pageIndex = pageIndex;
            ViewBag.pageCount = pageCount;
            ViewBag.totalCount = totalCount;
            ViewBag.totalPage = totalPage;
            ViewBag.Name = Name;
            return View(use);
        }

        //详情
        public ActionResult Details(int? id)
        {
            return View(db.UserInfo.Find(id));
        }
        //删除
        public ActionResult Delete(int? id)
        {
            var dele = db.UserInfo.Find(id);
            db.UserInfo.Remove(dele);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}