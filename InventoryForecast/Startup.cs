using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(InventoryForecast.Startup))]
namespace InventoryForecast
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
