using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLib
{
    public class VehicleForecastRepository
    {
        public IEnumerable<VehicleForecastModel> GetData()
        {
            using (SqlConnection conn = new SqlConnection("Server=localhost;Database=LoopLocal_00;Integrated Security=SSPI;"))
            {
                conn.Open();
                string query = Properties.Resources.Query;
                return Dapper.SqlMapper.Query<VehicleForecastModel>(conn, query, null);
            }
        }
    }
}
