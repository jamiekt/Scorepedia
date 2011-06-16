using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class PlayerController : Controller
    {
        ScorepediaEntities db = new ScorepediaEntities();
        //
        // GET: /Player/

        public ActionResult Index()
        {
            var players = db.Players.ToList();
            return View(players);
        }

        public ActionResult Details(int id) 
        {
            var player = db.Players.Single(p => p.PlayerId == id);
            return View(player);
        }
    }
}
