using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Accounts.BLL;
using Accounts.BLL.HomePage;
using Accounts.Models.ViewModels.Home;
using Accounts.Models.ViewModels.Shared;

namespace Accounts.Controllers
{
    [Authorize]
    public class HomeController : BaseController
    {
        public ViewResult Index()
        {
            return View();
        }

        #region Records

        [HttpPost]
        public PartialViewResult RefreshData(RefreshDataParameters parameters)
        {
            // Checks for null and if yes - replaces with the defaults
            parameters.SortingColumn = parameters.SortingColumn ?? Settings.DefaultSortingColumn;
            parameters.SortingDirection = parameters.SortingDirection ?? Settings.DefaultSortingDirection;

            // Pull the records from database
            var recordManager = new RecordManager();
            var rec = recordManager.GetData(parameters);
            
            // Get list of available attachments and mofy a corresponding Record with it
            Dictionary<int, string> attchments = AttachmentManager.GetAttachments();

            foreach (var record in rec)
            {
                record.Attachment = attchments.ContainsKey(record.RecordId) ? attchments[record.RecordId] : String.Empty;
            }

            // Set total amount message and erturn a aprtial view
            ViewBag.Amount = string.Format("Total {0} records.", rec.Count() - 1);

            // Add sorting column and direction to viewbag in orger to indicate the column by displaying appropriate arrow right hand side from its name
            ViewBag.SortingColumn = parameters.SortingColumn.ToLower().Trim();
            ViewBag.SortingDirection = parameters.SortingDirection;

            return PartialView("_Data", rec);
        }

        [HttpPost]
        public JsonResult UpdateRecord(RecordViewModel viewModel)
        {
            var recordManager = new RecordManager();
            string typeName = recordManager.UpdateRecord(viewModel);
            return Json(typeName);
        }

        /// <summary>
        /// Is called from a popup window right hand side from a record with -= Unknown =- subtype.
        /// Creates new regex and associate a current record with id
        /// </summary>
        /// <param name="united">UnitedRegexRefresh class is joint of RegexViewModel and RefreshDataParameters</param>
        [HttpPost]
        public JsonResult NewRegexForRecord(RegexViewModel regex, int[] Ids)
        {
            var recordManager = new RecordManager();
            AjaxResult result = recordManager.NewRegexForRecord(regex, Ids, ModelState);
            return Json(result);
        }

        #endregion

        #region Attachments Actions

        [HttpPost]
        public ActionResult AttachmentAdd(int id, HttpPostedFileBase file)
        {
            var attachment = new AttachmentManager(id);
            string fileName = attachment.Add(file);

            if (!string.IsNullOrEmpty(fileName))
            {
                return PartialView("_Attachment", fileName);
            }

            return Json(String.Empty);
        }

        [HttpPost]
        public JsonResult AttachmentDel(int id)
        {
            var attachment = new AttachmentManager(id);
            return Json(attachment.Delete());
        }

        #endregion

        #region CSV

        [HttpPost]
        public FileContentResult Csv(RefreshDataParameters parameters)
        {
            var csv = new CSV(parameters);
            return File(csv.GetBytes(), Settings.CSV.MimeType, Settings.CSV.FileDownloadName);
        }

        #endregion
    }
}
