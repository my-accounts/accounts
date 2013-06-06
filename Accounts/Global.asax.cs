using System;
using System.Web;
using System.Web.Mvc;
using System.Web.Routing;
using Accounts.BLL;
using WebMatrix.WebData;

namespace Accounts
{
    public class MvcApplication : HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();

            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);

            StaticData.Load();

            if (!WebSecurity.Initialized)
            {
                WebSecurity.InitializeDatabaseConnection("DefaultConnection", "UserProfile", "UserId", "UserName", autoCreateTables: false);
            }

            // Remove unwanted view engine
            ViewEngines.Engines.Clear(); 
            ViewEngines.Engines.Add(new RazorViewEngine());
        }

        private void Application_BeginRequest(Object source, EventArgs e)
        {
            // Rid of retro IE users
            if (HttpContext.Current.Request.Browser.Browser.Trim().ToUpperInvariant() == "IE" && HttpContext.Current.Request.Browser.MajorVersion <= 8)
            {
                HttpContext.Current.Response.Redirect("http://oldbrowser.martinmiles.net");
                return;
            }
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            // TODO: Add error handling support and logging
        }
    }
}