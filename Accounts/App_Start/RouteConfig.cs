using System.Web.Mvc;
using System.Web.Routing;

namespace Accounts
{
    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.IgnoreRoute("{resource}.axd/{*pathInfo}");

            // TODO: This route should be replaced with <customErrors mode="On" redirectMode="ResponseRewrite" ><error statusCode="404" redirect="/PageNotFound/" />
            routes.MapRoute(
                name: "PageNotFound", url: "PageNotFound/",
                defaults: new { controller = "Home", action = "PageNotFound", id = UrlParameter.Optional }
            );

            routes.MapRoute(
                name: "Default", url: "{controller}/{action}/{id}",
                defaults: new { controller = "Home", action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}