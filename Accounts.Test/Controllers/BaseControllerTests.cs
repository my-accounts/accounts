using System.Web.Mvc;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Accounts.Test.Controllers
{
    public class BaseControllerTest : BaseTest
    {
        protected static void IsPartial(ActionResult result)
        {
            Assert.IsInstanceOfType(result, typeof(PartialViewResult), Messages.Settings.ShouldBePartialView);
        }
        protected static void IsJson(ActionResult result)
        {
            Assert.IsInstanceOfType(result, typeof(JsonResult), Messages.Settings.ShouldBePartialView);
        }
        protected static void IsRedirect(ActionResult result)
        {
            Assert.IsInstanceOfType(result, typeof(RedirectToRouteResult), Messages.Settings.ShouldBeRedirect);
        }
    }
}
