using System.Collections.Generic;
using System.Linq;

namespace Accounts.Models.ViewModels.Shared
{
    public class AjaxResult
    {
        public AjaxResult(System.Web.Mvc.ModelStateDictionary modelState, int id, string customErrorMessage)
        {
            Result = false;

            CustomErrorMessage = customErrorMessage;
            ErrorId = id;
            Errors = modelState.Where(kvp => kvp.Value.Errors.Count > 0).ToDictionary(kvp => kvp.Key, kvp => kvp.Value.Errors.Select(e => e.ErrorMessage).ToArray()).ToArray();

        }
        public AjaxResult(System.Web.Mvc.ModelStateDictionary modelState, int id)
        {
            Result = modelState.IsValid;

            ErrorId = id;
            Errors = modelState.Where(kvp => kvp.Value.Errors.Count > 0).ToDictionary(kvp => kvp.Key, kvp => kvp.Value.Errors.Select(e => e.ErrorMessage).ToArray()).ToArray();
        }

        public bool Result { get; private set; }

        public string CustomErrorMessage { get; private set; }
        public int ErrorId { get; private set; }
        public KeyValuePair<string, string[]>[] Errors { get; private set; }
    }
}