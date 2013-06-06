using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Accounts.BLL;
using Accounts.Models.Entities;
using Accounts.Models.ViewModels.Home;

namespace Accounts.Controllers
{
    [Authorize]
    public class UploadController : BaseController
    {
        public ViewResult Index()
        {
            return View(UploadPageViewModel);
        }

        #region Public Actions

        [HttpPost]
        public RedirectToRouteResult Upload(IEnumerable<HttpPostedFileBase> files, int company)
        {
            var uploader = new UploadManager(files, company);
            uploader.Process();

            return RedirectToAction("Index");
        }

        [HttpPost]
        public RedirectToRouteResult DragDropUpload(HttpPostedFileBase myfile, int company)
        {
            var uploader = new UploadManager(Enumerable.Repeat(myfile, 1), company);
            uploader.Process();

            return RedirectToAction("Index");
        }

        // PartilView used to update history only after drag'n'drop
        public PartialViewResult UploadItems()
        {
            return PartialView("_UploadItems", UploadPageViewModel);
        }

        [HttpPost]
        public JsonResult UploadChangeCompany(int uploadFileId, int companyId)
        {
            bool result = UploadManager.ChangeCompany(uploadFileId, companyId);
            return Json(result);
        }

        [HttpPost]
        public JsonResult UploadFileDelete(int uploadFileId)
        {
            return Json(UploadManager.DeleteUploadFile(uploadFileId));
        }

        #endregion

        private static IEnumerable<UploadItemViewModel> UploadPageViewModel
        {
            get
            {
                var viewModels = UploadManager.Uploads.Select(i => i.UploadId).Distinct()
                                    .Select(uploadItemId => UploadManager.Uploads.First(i => i.UploadId == uploadItemId))
                                    .Select(ui => new UploadItemViewModel { UploadId = ui.UploadId, Date = ui.Performed })
                                    .ToList();

                foreach (UploadItemViewModel uploadItem in viewModels)
                {
                    IEnumerable<UploadFile> uploadFiles = UploadManager.Uploads.Where(i => i.UploadId == uploadItem.UploadId);
                    uploadItem.Files =
                        uploadFiles.Select(
                            uf =>
                            new UploadFileViewModel
                            {
                                UploadFileId = uf.UploadFileId,
                                Filename = uf.Filename,
                                CompanyId = uf.CompanyId
                            }).ToArray();
                }
                return viewModels;
            }
        }
    }
}
