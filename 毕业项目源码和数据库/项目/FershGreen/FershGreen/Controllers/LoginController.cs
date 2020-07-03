using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace FershGreen.Controllers
{
    public class LoginController : Controller
    {
        PrivateClinicEntities db = new PrivateClinicEntities();
        // GET: Login
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(string UserLogin,string UserPwd, string Yzm)
        {
           
            //选验证验证码
            if (Yzm.ToLower() == Session["vilidateCode"].ToString().ToLower())
            {
                var login = db.UserInfo.Where(p => p.UserLogin == UserLogin).FirstOrDefault();
                if (login == null)
                {
                    ViewBag.Yzm = "";
                    return Content("<script>alert('账号不存在，请重新输入');history.go(-1);</script>");
                }
                else if (login.UserPwd == UserPwd)
                {
                    Session["login"] = login;
                    ViewBag.Yzm = "";
                    Session["Name"] = login.UserName;
                    Session["Role"] = login.UserRole;
                    Session["Pic"] = login.UserPicture;
                    Session["ID"] = login.UserID;
                    return RedirectToAction("Index", "Customer");
                }
                else
                {
                    ViewBag.Yzm = "";
                    return Content("<script>alert('密码不正确，请重新输入');history.go(-1);</script>");
                }

            }
            else
            {
                ///ViewBag.Yzm = "验证码输入错误，请重新输入验证码！";
                return Content("<script>alert('验证码输入错误，请重新输入验证码！');history.go(-1);</script>");
            }

        }
        //退出系统
        public ActionResult logout()
        {
            Session["login"] = "";
            return RedirectToAction("Index");
        }
    }
}