using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebAPI.Controllers
{
    [RoutePrefix("api/default")]
    public class DefaultController : ApiController
    {
        public IEnumerable<DataLib.VehicleForecastModel> Get()
        {
            var repo = new DataLib.Repository();
            var data = repo.GetForecastData();
            foreach(var item in data)
            {
                item.SalesHistory = this.Get(item.VehicleMake, item.VehicleModel)
                    .Select(sh => sh.Quantity);
                item.Interests = (item.Sold * 30) / 100;
            }
            return data;
        }

        [Route("{make}/{model}/")]
        public IEnumerable<DataLib.SalesHistoryModel> Get(string make, string model)
        {
            var repo = new DataLib.Repository();
            return repo.GetSalesHistoryData(make, model);
        }
    }
}
