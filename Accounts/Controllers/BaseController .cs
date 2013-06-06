using System;
using System.Web.Mvc;

namespace Accounts.Controllers
{
    public abstract class BaseController : Controller
    {
        [HttpGet]
        // This is a generic Controller's action method called for evey unknow view. 
        // It behaves as by default - return correspondent view to current action.
        protected override void HandleUnknownAction(string actionName)
        {
            try
            {
                View(actionName).ExecuteResult(ControllerContext);
            }
            catch (Exception e)
            {
                Response.Redirect("~/PageNotFound");
            }
        }
    }
}