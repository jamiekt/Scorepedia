using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class TeamController : Controller
    {
        ScorepediaEntities entities = new ScorepediaEntities();
        //
        // GET: /Team/

        public ActionResult Index(int id)
        {
            var teamsModel = (from team in entities.Teams
                             join sport in entities.Sports on team.Sport equals sport
                             where sport.SportId == id
                             select team);
            return View(teamsModel);
        }

        //
        // GET: /Team/Details/5

        public ActionResult Details(int id)
        {
            var teamModel = entities.Teams.Single(t => t.TeamId == id);
            return View(teamModel);
        }

        //
        // GET: /Team/Create

        public ActionResult Create()
        {
            var team = new Team();
            return View(team);
        }

        //
        // POST: /Team/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Team/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Team/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Team/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Team/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
