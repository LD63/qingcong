using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FershGreen.Models;

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
        public ActionResult Index(string UserLogin, string UserPwd)
        {
            var login = db.UserInfo.Where(p => p.UserLogin == UserLogin).FirstOrDefault();
            if (login == null)
            {
                return Content("<script>alert('账号不存在，请重新输入');history.go(-1);</script>");
            }
            else if (login.UserPwd == UserPwd)
            {
                Session["login"] = login;
                return RedirectToAction("Contact1", "Home");
            }
            else
            {
                return Content("<script>alert('密码不正确，请重新输入');history.go(-1);</script>");
            }

        }
    }
}