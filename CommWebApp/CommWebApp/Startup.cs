using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CommWebApp.Startup))]
namespace CommWebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
