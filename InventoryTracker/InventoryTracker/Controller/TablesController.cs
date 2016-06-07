using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Web;
using System.Web.Mvc;

namespace Inspinia_MVC5.Controllers
{
    public class TablesController : Controller
    {
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public ActionResult DataTables()
        {
            return View();
        }

        public HttpClient GetHttpClient()
        {
            var client = new HttpClient();
            client.BaseAddress = new Uri("http://localhost:56627/");
            client.DefaultRequestHeaders.Accept.Clear();
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
            return client;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public async System.Threading.Tasks.Task<ContentResult> tableJsonData()
        {
            //var chartData = new[] {
            //        new {Indicator="", VehicleMake = "Volkswagen", VehicleModel = "GOLF WAGON", Sold = 11, Inventory = 15, OrderQuantity=0, DaysToSupply=90 },
            //        new {Indicator="", VehicleMake = "Volkswagen", VehicleModel = "GTI A6", Sold = 2, Inventory = 1, OrderQuantity=0, DaysToSupply=180 },
            //        new {Indicator="", VehicleMake = "Volkswagen", VehicleModel = "GTI A7", Sold = 3, Inventory = 2, OrderQuantity=1, DaysToSupply=45 }
            //    };

            using (var client = GetHttpClient())
            {
                HttpResponseMessage response = await client.GetAsync("api/default/");
                if (response.IsSuccessStatusCode)
                {

                    var data = response.Content.ReadAsStringAsync().Result;
                    return new ContentResult { Content = data, ContentType = "application/json" };
                }
                return new ContentResult { Content = "", ContentType = "application/json" };
            }
        }
    }
}