using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class SportController : Controller
    {
        ScorepediaEntities entities = new ScorepediaEntities();

        //
        // GET: /Sport/

        public ActionResult Index()
        {
            //var sports = entities.Sports.ToList();
            //var sportModel = (from sport in entities.Sports
            //                  select new
            //                  {
            //                      sport.SportName,
            //                      TeamCount = sport.Teams.Count()
            //                  }
            //                 ).OrderByDescending(x => x.TeamCount);
            //return View(sportModel);
            var sportModel =
                (from sport in entities.Sports
                 select new SportAggregate
                 {
                     SportName = sport.SportName,
                     SportId = sport.SportId,
                     TeamCount = sport.Teams.Count()
                 }).OrderByDescending(s => s.TeamCount);
            //var sportModel =
            //    from sport in entities.Sports
            //    from team in
            //        (
            //          from t in entities.Teams
            //          where t.SportId == sport.SportId
            //          group t by t.TeamId into tg
            //          select tg.Count()
            //        ).DefaultIfEmpty()
            //    group new { sport, team } by sport into sg
            //    select new SportAggregate
            //    {
            //        SportId = sg.Key.SportId,
            //        SportName = sg.Key.SportName,
            //        TeamCount = sg.Sum(tc => tc.team)
            //    };


            return View(sportModel);
        }

        //
        // GET: /Sport/Details/5

        public ActionResult Details(int id)
        {
            var sportModel = entities.Sports.Include("Teams").Single(s => s.SportId == id);
            return View(sportModel);
        }

        //
        // GET: /Sport/Create

        public ActionResult Create()
        {
            var sport = new Sport();
            return View(sport);
        }

        //
        // POST: /Sport/Create

        [HttpPost]
        public ActionResult Create(Sport sport)
        {
            if (ModelState.IsValid)
            {
                entities.Sports.AddObject(sport);
                entities.SaveChanges();

                return RedirectToAction("Index");
            }

            //Invalid - redisplay with errors
            return View(sport);
        }

        //
        // GET: /Sport/Edit/5

        //public ActionResult Edit(int id)
        //{
        //    return View();
        //}

        //
        // POST: /Sport/Edit/5

        //[HttpPost]
        //public ActionResult Edit(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add update logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}

        //
        // GET: /Sport/Delete/5

        //public ActionResult Delete(int id)
        //{
        //    return View();
        //}

        //
        // POST: /Sport/Delete/5

        //[HttpPost]
        //public ActionResult Delete(int id, FormCollection collection)
        //{
        //    try
        //    {
        //        // TODO: Add delete logic here

        //        return RedirectToAction("Index");
        //    }
        //    catch
        //    {
        //        return View();
        //    }
        //}
    }
}
