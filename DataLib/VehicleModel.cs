using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLib
{
    public class SalesHistoryModel
    {
        public int Month { get; set; }
        public int Quantity { get; set; }

    }

    public class VehicleForecastModel
    {
        public string VehicleMake { get; set; }
        public string VehicleModel { get; set; }

        public int Sold { get; set; }
        public int Inventory { get; set; }
        public int OrderQuantity { get; set; }
        public int DaySupply { get; set; }
        public int Interests { get; set; }
        public byte Indicator { get; set; }
        public string Status
        {
            get
            {
                switch(Indicator)
                {
                    case 1:
                        return "Stock Available";
                    case 2:
                        return "Attention";
                    default:
                        return " Out of Stock ";
                }
            }
        }
        public string StatusLabel
        {
            get
            {
                switch (Indicator)
                {
                    case 1:
                        return "label-primary";
                    case 2:
                        return "label-warning";
                    default:
                        return "label-danger";
                }
            }
        }
        public IEnumerable<int> SalesHistory { get; set; }

    }


    public class SalesHistoryModelGrouped
    {
        public int Month { get; set; }
        public int Quantity { get; set; }

    }

    public class TotalVehiclesInStock
    {

        public int TotalInStock { get; set; }

    }


    public class TotalValueOfVehiclesInStock
    {

        public int TotalValueOfVehicles { get; set; }

    }


    public class TotalStockDaysLasting
    {

        public int StockDaysLasting { get; set; }

    }
    public class TotalVehicleAverageValue
    {

        public int VehicleAverageValue { get; set; }

    }
    
}
