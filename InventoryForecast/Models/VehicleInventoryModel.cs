using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryForecast.Models
{
    public class VehicleForecastModel
    {
        public string VehicleMake { get; set; }
        public string VehicleModel { get; set; }

        public int Sold { get; set; }
        public int Inventory { get; set; }
        public int OrderQuantity { get; set; }
        public int DaySupply { get; set; }

    }
}