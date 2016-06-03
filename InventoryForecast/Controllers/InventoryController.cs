using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;

namespace InventoryForecast.Controllers
{
    public class InventoryController : Controller
    {
        public HttpClient GetHttpClient()
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:56627/");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            return client;
        }

        // GET: Inventory
        public async System.Threading.Tasks.Task<ActionResult> InventoryView()
        {
            using (var client = GetHttpClient())
            {
                // New code:
                HttpResponseMessage response = await client.GetAsync("api/default/");
                if (response.IsSuccessStatusCode)
                {
                    var data = await response.Content.ReadAsAsync<IEnumerable<Models.VehicleForecastModel>>();
                    return View(data);
                }

                return View();
            }
        }

        // GET: Inventory/Details/make/model
        [Route("/{make}/{model}")]

        public async System.Threading.Tasks.Task<ActionResult> Details(string make, string model)
        {
            using (var client = GetHttpClient())
            {
                // New code:
                HttpResponseMessage response = await client.GetAsync(
                    string.Format("api/default/{0}/{1}/", make, model));
                if (response.IsSuccessStatusCode)
                {
                    var data = await response.Content.ReadAsAsync<IEnumerable<Models.SalesHistoryModel>>();
                    return View(data);
                }

                return View();
            }
        }

        // GET: Inventory/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Inventory/Create
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

        // GET: Inventory/Edit/5
        public ActionResult Edit(int id)
        {
            return View();
        }

        // POST: Inventory/Edit/5
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

        // GET: Inventory/Delete/5
        public ActionResult Delete(int id)
        {
            return View();
        }

        // POST: Inventory/Delete/5
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
