using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using Accounts.BLL;
using Accounts.Controllers;
using Accounts.Models.Entities;
using Accounts.Models.ViewModels.Settings;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ORM;
using ORM.Results;

namespace Accounts.Test.Controllers
{
    [TestClass]
    public class SettingsControllerTest : BaseControllerTest
    {
        SettingsController controller;

        [TestInitialize]
        public void Setup()
        {
            controller = new SettingsController();

            // Reset the database and reload static data
            Database.StoredProcedure(Settings.StoredProcedures.InitTest);
            StaticData.Load();
        }

        #region Page Views

        [TestMethod]
        public void General_Returns_Correct_Model()
        {
            var result = controller.General();
            Assert.IsNotNull(result.ViewData.Model, "Should contain view model");

            Assert.IsInstanceOfType(result.ViewData.Model, typeof (GeneralSettingsViewModel),
                                    "SettingsController.General view model should be of type GeneralSettingsViewModel");

            var viewModel = result.ViewData.Model as GeneralSettingsViewModel;
            Assert.IsNotNull(viewModel.Companies, "Should not be null");
            Assert.IsNotNull(viewModel.YearStartDates, "Should not be null");
            Assert.IsTrue(viewModel.SelectedYearStartDate > 0, "Should be natural value");
        }

        [TestMethod]
        public void TypesAndSubtypes_Returns_Correct_Model()
        {
            var result = controller.TypesAndSubtypes();
            Assert.IsNotNull(result.ViewData.Model, "Should contain view model");

            Assert.IsInstanceOfType(result.ViewData.Model, typeof (TypesSubtypesViewModel),
                                    "SettingsController.TypesAndSubtypes view model should be of type TypesSubtypesViewModel");

            var viewModel = result.ViewData.Model as TypesSubtypesViewModel;
            Assert.IsNotNull(viewModel.Types, "Should not be null");
            Assert.IsNotNull(viewModel.Subtypes, "Should not be null");
        }

        [TestMethod]
        public void Regex_Returns_Correct_Model()
        {
            var result = controller.Regex();
            Assert.IsNotNull(result.ViewData.Model, "Should contain view model");
            Assert.IsInstanceOfType(result.ViewData.Model, typeof (IEnumerable<RecordRegex>),
                                    "SettingsController.Regex view model should be of type IEnumerable<RecordRegex>");
        }

        #endregion

        #region General Settings Page

        #region Successful

        [TestMethod]
        public void YearStartDateChange_Successful()
        {
            // 1. First ensure in default values
            Assert.AreEqual(StaticData.Companies.First().StartMonth, 4, Messages.Settings.ShouldBe4);
            Assert.AreEqual(StaticData.Companies.First().StartDay, 6, Messages.Settings.ShouldBe6);

            // 2. Perform the cahange
            var result = controller.YearStartDateChange(3);
            Assert.IsTrue((bool)result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.Companies.First().StartMonth, 5, Messages.Settings.ShouldBeChanged);
            Assert.AreEqual(StaticData.Companies.First().StartDay, 1, Messages.Settings.ShouldBeChanged);
        }

        [TestMethod]
        public void CompanyAdd_Successful()
        {
            const string newCompanyName = "New Company";

            // 1. Pre-checks
            int count = StaticData.Companies.Count();
            Assert.IsFalse(StaticData.Companies.Any(i => i.Name == newCompanyName), Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.CompanyAdd(newCompanyName);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.Companies.Count(), count + 1, Messages.Settings.CountShouldBeOneMore);
            Assert.IsTrue(StaticData.Companies.Any(i => i.Name == newCompanyName), Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void CompanyRename_Successful()
        {
            const int companyId = 2;
            const string newCompanyName = "Second Changed";

            // 1. Pre-checks
            int count = StaticData.Companies.Count();
            Assert.IsFalse(StaticData.Companies.Any(i => i.Name == newCompanyName), Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.CompanyRename(companyId, newCompanyName);
            Assert.IsTrue((bool) result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.Companies.Count(), count, Messages.Settings.ShouldRemainSameAmount);
            Assert.AreEqual(StaticData.Companies.First(i => i.Name == newCompanyName).Name, newCompanyName, Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void CompanyDel_Successful()
        {
            const int companyId = 2;

            // 1. Pre-checks
            int count = StaticData.Companies.Count();

            // 2. Perform the insert
            var result = controller.CompanyDel(companyId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.Companies.Count(), count - 1,  Messages.Settings.CountShouldBeOneLess);
        }

        #endregion

        #region Errors

        [TestMethod]
        public void YearStartDateChange_Invalid_Parameter()
        {
            // 1. First ensure in default values
            Assert.AreEqual(StaticData.Companies.First().StartMonth, 4, Messages.Settings.ShouldBe4);
            Assert.AreEqual(StaticData.Companies.First().StartDay, 6, Messages.Settings.ShouldBe6);

            // 2. Perform the cahange
            var result = controller.YearStartDateChange(5);
            Assert.IsFalse((bool)result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.Companies.First().StartMonth, 4, Messages.Settings.ShouldNotBeChanged);
            Assert.AreEqual(StaticData.Companies.First().StartDay, 6, Messages.Settings.ShouldNotBeChanged);
        }

        [TestMethod]
        public void CompanyAdd_Name_Already_Exists()
        {
            const string newCompanyName = "Second";

            // 1. Pre-checks
            int count = StaticData.Companies.Count();
            Assert.IsTrue(StaticData.Companies.Any(i => i.Name == newCompanyName), Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the insert
            var result = controller.CompanyAdd(newCompanyName);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof (ProcedureIdentityResult), Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.Companies.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void CompanyAdd_Name_Is_Empty()
        {
            const string newCompanyName = "";

            // 1. Pre-checks
            int count = StaticData.Companies.Count();

            // 2. Perform the insert
            var result = controller.CompanyAdd(newCompanyName);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof(ProcedureIdentityResult), Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.Companies.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void CompanyRename_Name_Already_Exists()
        {
            const int companyId = 2;
            const string newCompanyName = "Third";

            // 1. Pre-checks
            int count = StaticData.Companies.Count();
            Assert.IsTrue(StaticData.Companies.Any(i => i.Name == newCompanyName), Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the rename
            var result = controller.CompanyRename(companyId, newCompanyName);
            Assert.IsFalse((bool) result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.Companies.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void CompanyRename_Name_Is_Empty()
        {
            const int companyId = 2;
            const string newCompanyName = "";

            // 1. Pre-checks
            int count = StaticData.Companies.Count();

            // 2. Perform the rename
            var result = controller.CompanyRename(companyId, newCompanyName);
            Assert.IsFalse((bool)result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.Companies.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void CompanyDel_Record_Does_Not_Exist()
        {
            const int companyId = 5;

            // 1. Pre-checks
            int count = StaticData.Companies.Count();

            // 2. Perform the delete
            var result = controller.CompanyDel(companyId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.Companies.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void CompanyDel_There_Are_Records_That_Prevent_From_Deleting()
        {
            const int companyId = 1;

            // 1. Pre-checks
            int count = StaticData.Companies.Count();

            // 2. Perform the insert
            var result = controller.CompanyDel(companyId);
            IsJson(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.Companies.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        #endregion

        #endregion

        #region Types

        #region Successful

        [TestMethod]
        public void TypeAdd_Successful()
        {
            const string newTypeName = "New Type";

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();
            Assert.IsFalse(StaticData.RecordTypes.Any(i => i.Name == newTypeName), Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.TypeAdd(newTypeName);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count + 1, Messages.Settings.CountShouldBeOneMore);
            Assert.IsTrue(StaticData.RecordTypes.Any(i => i.Name == newTypeName), Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void TypeRename_Successful()
        {
            const int typeId = 2;
            const string newTypeName = "Type Changed";

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();
            Assert.IsFalse(StaticData.RecordTypes.Any(i => i.Name == newTypeName), Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.TypeRename(typeId, newTypeName);
            Assert.IsTrue((bool) result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
            Assert.IsTrue(StaticData.RecordTypes.Any(i => i.Name == newTypeName), Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void TypeDelete_Successful()
        {
            const int typeId = 1;

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();

            // 2. Perform the insert
            var result = controller.TypeDelete(typeId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count - 1, Messages.Settings.CountShouldBeOneLess);
        }

        #endregion

        #region Error

        [TestMethod]
        public void TypeAdd_Name_Already_Exists()
        {
            const string newTypeName = "Other";

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();
            Assert.IsTrue(StaticData.RecordTypes.Any(i => i.Name == newTypeName),
                          Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the insert
            var result = controller.TypeAdd(newTypeName);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof (ProcedureIdentityResult),
                                    Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void TypeAdd_Name_Is_Empty()
        {
            const string newTypeName = "";

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();

            // 2. Perform the insert
            var result = controller.TypeAdd(newTypeName);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof (ProcedureIdentityResult),
                                    Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void TypeRename_Name_Already_Exists()
        {
            const int typeId = 2;
            const string newTypeName = "Other";

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();
            Assert.IsTrue(StaticData.RecordTypes.Any(i => i.Name == newTypeName),
                          Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the rename
            var result = controller.TypeRename(typeId, newTypeName);
            Assert.IsFalse((bool) result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void TypeRename_Name_Is_Empty()
        {
            const int typeId = 2;
            const string newTypeName = "";

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();

            // 2. Perform the rename
            var result = controller.TypeRename(typeId, newTypeName);
            Assert.IsFalse((bool) result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void TypeDelete_Does_Not_Exist()
        {
            const int typeId = 5;

            // 1. Pre-checks
            int count = StaticData.RecordTypes.Count();

            // 2. Perform the delete
            var result = controller.TypeDelete(typeId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordTypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        #endregion

        #endregion

        #region Subtypes

        #region Successfull

        [TestMethod]
        public void SubtypeAdd_Successful()
        {
            const string newSubtypeName = "New Subtype";
            const int typeId = 1;

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();
            Assert.IsFalse(StaticData.RecordSubtypes.Any(i => i.Name == newSubtypeName && i.TypeId == typeId),
                           Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.SubtypeAdd(typeId, newSubtypeName);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count + 1, Messages.Settings.CountShouldBeOneMore);
            Assert.IsTrue(StaticData.RecordSubtypes.Any(i => i.Name == newSubtypeName), Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void SubtypeUpdate_Successful()
        {
            const int typeId = 3;
            const int subtypeId = 10;
            const string newTypeName = "Subtype Changed";

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();
            Assert.IsFalse(StaticData.RecordSubtypes.Any(i => i.Name == newTypeName), Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.SubtypeUpdate(subtypeId, typeId, newTypeName);
            Assert.IsTrue((bool) result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
            Assert.IsTrue(StaticData.RecordSubtypes.Any(i => i.Name == newTypeName), Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void SubtypeDelete_Successful()
        {
            const int subtypeId = 1;

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();

            // 2. Perform the insert
            var result = controller.SubtypeDelete(subtypeId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count - 1, Messages.Settings.CountShouldBeOneLess);
        }

        #endregion

        #region Error

        [TestMethod]
        public void SubtypeAdd_Name_Already_Exists()
        {
            const string newSubtypeName = "Other";
            const int typeId = 3;

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();
            Assert.IsTrue(StaticData.RecordSubtypes.Any(i => i.Name == newSubtypeName),
                          Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the insert
            var result = controller.SubtypeAdd(typeId, newSubtypeName);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof (ProcedureIdentityResult),
                                    Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void SubtypeAdd_Name_Is_Empty()
        {
            const int typeId = 3;
            const string newSubtypeName = "";

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();

            // 2. Perform the insert
            var result = controller.SubtypeAdd(typeId, newSubtypeName);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof (ProcedureIdentityResult),
                                    Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void SubtypeUpdate_Name_Already_Exists()
        {
            const int subtypeId = 1;
            const int typeId = 3;
            const string newSubtypeName = "Other";

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();
            Assert.IsTrue(StaticData.RecordSubtypes.Any(i => i.Name == newSubtypeName),
                          Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the rename
            var result = controller.SubtypeUpdate(subtypeId, typeId, newSubtypeName);
            Assert.IsFalse((bool) result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void SubtypeUpdate_Name_Is_Empty()
        {
            const int typeId = 3;
            const int subtypeId = 10;
            const string newTypeName = "";

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();

            // 2. Perform the rename
            var result = controller.SubtypeUpdate(subtypeId, typeId, newTypeName);
            Assert.IsFalse((bool) result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void SubtypeDelete_Does_Not_Exist()
        {
            const int subtypeId = 15;

            // 1. Pre-checks
            int count = StaticData.RecordSubtypes.Count();

            // 2. Perform the delete
            var result = controller.SubtypeDelete(subtypeId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordSubtypes.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        #endregion

        #endregion

        #region Regex

        #region Successful

        [TestMethod]
        public void RegexAdd_Successful()
        {
            const int subtypeId = 10;
            const string regex = "New Type";

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();
            Assert.IsFalse(StaticData.RecordRegex.Any(i => i.Name == regex), Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.RegexAdd(regex, subtypeId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count + 1, Messages.Settings.CountShouldBeOneMore);
            Assert.IsTrue(StaticData.RecordRegex.Any(i => i.Name == regex), Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void RegexRename_Successful()
        {
            const int subtypeId = 10;
            const int regexId = 1;
            const string regex = "Type Changed";

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();
            Assert.IsFalse(StaticData.RecordRegex.Any(i => i.Name == regex), Messages.Settings.ShouldNotExist);

            // 2. Perform the insert
            var result = controller.RegexRename(regexId, subtypeId, regex);
            Assert.IsTrue((bool) result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count, Messages.Settings.ShouldRemainSameAmount);
            Assert.IsTrue(StaticData.RecordRegex.Any(i => i.Name == regex), Messages.Settings.ShouldExist);
        }

        [TestMethod]
        public void RegexDelete_Successful()
        {
            const int regexId = 1;

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();

            // 2. Perform the insert
            var result = controller.RegexDelete(regexId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count - 1, Messages.Settings.CountShouldBeOneLess);
        }

        #endregion

        #region Error

        [TestMethod]
        public void RegexAdd_Name_Already_Exists()
        {
            const int subtypeId = 10;
            const string regex = "^TEST";

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();
            Assert.IsTrue(StaticData.RecordRegex.Any(i => i.Name == regex), Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the insert
            var result = controller.RegexAdd(regex, subtypeId);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof(ProcedureIdentityResult), Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void RegexAdd_Name_Is_Empty()
        {
            const int subtypeId = 1;
            const string regex = "";

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();

            // 2. Perform the insert
            var result = controller.RegexAdd(regex, subtypeId);
            IsJson(result);

            Assert.IsNotNull((result as JsonResult).Data);
            Assert.IsInstanceOfType((result as JsonResult).Data, typeof(ProcedureIdentityResult), Messages.Settings.ShouldBeOfTypeProcedureIdentityResult);

            var resultObject = (result as JsonResult).Data as ProcedureIdentityResult;
            Assert.AreEqual(resultObject.Identity, 0, Messages.Settings.ShouldBeZeroWhenInsertFailed);
            Assert.IsFalse(string.IsNullOrEmpty(resultObject.ErrorMessage), Messages.Settings.ShouldReturnErrorMessage);


            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void RegexRename_Name_Already_Exists()
        {
            const int regexId = 1;
            const int subtypeId = 10;
            const string regex = "^TEST";

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();
            Assert.IsTrue(StaticData.RecordRegex.Any(i => i.Name == regex), Messages.Settings.ShouldExistForDuplicateTest);

            // 2. Perform the rename
            var result = controller.RegexRename(regexId, subtypeId, regex);
            Assert.IsFalse((bool)result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void RegexRename_Name_Is_Empty()
        {
            const int regexId = 1;
            const int subtypeId = 1;
            const string regex = "";

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();

            // 2. Perform the rename
            var result = controller.RegexRename(regexId, subtypeId, regex);
            Assert.IsFalse((bool)result.Data, Messages.Settings.ShouldBeFalseWhenErrorOccured);

            // 3. Ensure changes are NOT done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        [TestMethod]
        public void RegexDelete_Does_Not_Exist()
        {
            const int typeId = 5;

            // 1. Pre-checks
            int count = StaticData.RecordRegex.Count();

            // 2. Perform the delete
            var result = controller.RegexDelete(typeId);
            IsPartial(result);

            // 3. Ensure changes are done
            Assert.AreEqual(StaticData.RecordRegex.Count(), count, Messages.Settings.ShouldRemainSameAmount);
        }

        #endregion

        #endregion
    }
}
