using System.Web.Mvc;
using Accounts.BLL;
using Accounts.BLL.SettingsPage;
using Accounts.Models.ViewModels.Settings;
using ORM.Results;

namespace Accounts.Controllers
{ 
    [Authorize]
    public class SettingsController : BaseController
    {
        #region General

        public ViewResult General()
        {
            return View(new GeneralSettingsViewModel
                {
                    Companies = StaticData.Companies,
                    YearStartDates = StaticData.YearStartDates,
                    SelectedYearStartDate = YearStartDateHelper.GetCurrentStartDateId()
                });
        }

        [HttpPost]
        public JsonResult YearStartDateChange(int id)
        {
            bool result = YearStartDateHelper.ChangeYearStartDate(id);
            return Json(result);
        }

        #region Companies Actions

        [HttpPost]
        public ActionResult CompanyAdd(string companyName)
        {
            var result = CompaniesManager.CreateNew(companyName);

            if (result.Status == Status.Success)
            {
                return PartialView("_CompaniesList", StaticData.Companies);
            }

            return Json(result);
        }

        [HttpPost]
        public JsonResult CompanyRename(int companyId, string companyName)
        {
            var companiesManager = new CompaniesManager(companyId);
            bool result = companiesManager.Rename(companyName);

            return Json(result);
        }

        [HttpPost]
        public ActionResult CompanyDel(int companyId)
        {
            var companiesManager = new CompaniesManager(companyId);
            var result = companiesManager.Delete();

            if (result.Status == Status.Success)
            {
                return PartialView("_CompaniesList", StaticData.Companies);
            }

            return Json(result);
        }



        #endregion

        #endregion

        #region Types / Subtypes

        private TypesSubtypesViewModel TypesSubtypesViewModel
        {
            get
            {
                return new TypesSubtypesViewModel { Types = StaticData.RecordTypes, Subtypes = StaticData.RecordSubtypes };
            }
        }

        public ViewResult TypesAndSubtypes()
        {
            StaticData.LoadTypes();
            return View(TypesSubtypesViewModel);
        }

        #region Types

        [HttpPost]
        public ActionResult TypeAdd(string typeName)
        {
            var result = TypeManager.CreateNew(typeName);

            if (result.Status == Status.Success)
            {
                return PartialView("_TypesList", TypesSubtypesViewModel);
            }

            return Json(result);
        }

        [HttpPost]
        public JsonResult TypeRename(int typeId, string typeName)
        {
            var typeManager = new TypeManager(typeId);
            bool result = typeManager.Rename(typeName);
            return Json(result);
        }

        [HttpPost]
        public ActionResult TypeDelete(int typeId)
        {
            var typeManager = new TypeManager(typeId);
            var result = typeManager.Delete();

            if (result.Status == Status.Success)
            {
                return PartialView("_TypesList", TypesSubtypesViewModel);
            }

            return Json(result);
        }

        #endregion

        #region Subtypes

        [HttpPost]
        public ActionResult SubtypeAdd(int typeId, string subtypeName)
        {
            var result = SubtypeManager.CreateNew(typeId, subtypeName);

            if (result.Status == Status.Success)
            {
                return PartialView("_TypesList", TypesSubtypesViewModel);
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SubtypeUpdate(int subtypeId, int typeId, string subtypeName)
        {
            var subtypeManager = new SubtypeManager(subtypeId);
            bool result = subtypeManager.Update(typeId, subtypeName);
            return Json(result);
        }

        [HttpPost]
        public ActionResult SubtypeDelete(int subtypeId)
        {
            var subtypeManager = new SubtypeManager(subtypeId);
            var result = subtypeManager.Delete();

            if (result.Status == Status.Success)
            {
                return PartialView("_TypesList", TypesSubtypesViewModel);
            }
            return Json(result);
        }

        #endregion

        #endregion

        #region Regex

        public ViewResult Regex()
        {
            StaticData.LoadRegex();
            return View(StaticData.RecordRegex);
        }

        [HttpPost]
        public ActionResult RegexAdd(string regex, int subtypeId)
        {
            var result = RegexManager.CreateNew(regex, subtypeId);

            if (result.Status == Status.Success)
            {
                return PartialView("_RegexList", StaticData.RecordRegex);
            }

            return Json(result);
        }

        [HttpPost]
        public JsonResult RegexRename(int regexId, int subtypeId, string regex)
        {
            var regexManager = new RegexManager(regexId);
            bool result = regexManager.Rename(subtypeId, regex);

            return Json(result);
        }

        [HttpPost]
        public ActionResult RegexDelete(int regexId)
        {
            var regexManager = new RegexManager(regexId);
            var result = regexManager.Delete();

            if (result.Status == Status.Success)
            {
                return PartialView("_RegexList", StaticData.RecordRegex);
            }
            return Json(result);
        }

        #endregion
    }
}
