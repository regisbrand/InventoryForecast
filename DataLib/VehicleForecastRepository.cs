using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLib
{
    public class Repository
    {
        const string CONNECTION_STRING = "Server=localhost;Database=LoopLocal_00;Integrated Security=SSPI;";
        public IEnumerable<VehicleForecastModel> GetForecastData()
        {
            using (SqlConnection conn = new SqlConnection(CONNECTION_STRING))
            {
                conn.Open();
                string query = Properties.Resources.ForecastQuery;
                return Dapper.SqlMapper.Query<VehicleForecastModel>(conn, query, null);
            }
        }

        public IEnumerable<SalesHistoryModel> GetSalesHistoryData(string make, string model)
        {
            using (SqlConnection conn = new SqlConnection(CONNECTION_STRING))
            {
                conn.Open();
                string query = Properties.Resources.SalesHistoryQuery;
                return Dapper.SqlMapper.Query<SalesHistoryModel>(conn, query, 
                    new { VehicleMake = make, VehicleModel = model });
            }
        }
    }
}
