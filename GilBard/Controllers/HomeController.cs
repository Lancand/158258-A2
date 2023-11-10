using GilBard.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace GilBard.Controllers
{
    public class HomeController : Controller
    {
        //使用数据库上下文对象操作
        private GameMallEntities db = new GameMallEntities();

        //首页
        public ActionResult Index()
        {
            //特色游戏
            ViewBag.list1 = db.shopping.Where(p => p.state == 1).OrderByDescending(p => p.id).Take(6).ToList();
            //新游戏
            ViewBag.list2 = db.shopping.Where(p => p.state == 2).OrderByDescending(p => p.id).Take(12).ToList();
            //推荐游戏
            ViewBag.list3 = db.shopping.Where(p => p.state == 3).OrderByDescending(p => p.id).Take(6).ToList();
            //回顾游戏
            ViewBag.list4 = db.shopping.Where(p => p.state == 4).OrderByDescending(p => p.id).Take(3).ToList();

            //游戏视频
            ViewBag.list5 = db.video.OrderByDescending(p => p.id).Take(8).ToList();
            return View();
        }

        //游戏
        public ActionResult Games(string keyword = "", int page = 1,string order="desc")
        {
            int pageSize = 12; //10个数据一页
            var u = db.shopping.Where(p => p.title.Contains(keyword));
            if (order.Equals("asc"))
            { //升序
                u = u.OrderBy(p => p.id);
            }
            else
            { //倒序
                u = u.OrderByDescending(p => p.id); 
            }
            int recordCount = u.Count();
            u = u.Skip((page - 1) * pageSize).Take(pageSize);
            //(3)获取当前可以分多少页的页码数回去
            ViewBag.pageNum = Math.Ceiling((Convert.ToDecimal(recordCount)) / (Convert.ToDecimal(pageSize)));
            ViewBag.cid = db.category.ToList();
            return View(u);
        }

        //游戏详情
        public ActionResult GameDetail(int? id)
        {
            var detail = db.shopping.Where(p => p.id == id).FirstOrDefault();
            //推荐游戏
            ViewBag.list1 = db.shopping.Where(p => p.state == 3).OrderByDescending(p => p.id).Take(3).ToList();
            //新游戏
            ViewBag.list2 = db.shopping.Where(p => p.state == 2).OrderByDescending(p => p.id).Take(6).ToList();
            return View(detail);
        }
    }
}