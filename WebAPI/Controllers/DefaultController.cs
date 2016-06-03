using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace WebAPI.Controllers
{
    public class DefaultController : ApiController
    {
        public IEnumerable<DataLib.VehicleForecastModel> Get()
        {
            var repo = new DataLib.VehicleForecastRepository();
            return repo.GetData();
        }
    }
}
