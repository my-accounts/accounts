using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using Accounts.BLL;
using Accounts.Models.Entities;
using Accounts.Models.ViewModels.Home;
using Accounts.Models.ViewModels.Shared;
using System.Web.Mvc;
using Accounts.Controllers;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ORM;

namespace Accounts.Test.Controllers
{
    [TestClass]
    public class HomeControllerTest : BaseControllerTest
    {
        HomeController controller;

        [TestInitialize]
        public void Setup()
        {
            // Specify temporary path for Attachments and Archive folders
            OverrideSettingPath();

            controller = new HomeController();

            // Reset the database and reload static data
            Database.StoredProcedure(Settings.StoredProcedures.InitTest);
            StaticData.Load();
        }

        #region Controller Actions Tests

        [TestMethod]
        public void Index_Returns_Correct_Model()
        {
            var result = controller.Index();

            Assert.IsInstanceOfType(result, typeof(ViewResult), "Should be of ViewResult type");
            Assert.IsNull(result.ViewData.Model, "Should not have view model");
        }

        #region CSV

        [TestMethod]
        public void Csv_Successfull()
        {
            var fileResult = controller.Csv(RefreshDataThatReturnsEverything);

            Assert.AreEqual(fileResult.ContentType, "text/csv", "Wrong output ContentType");
            Assert.AreEqual(fileResult.FileDownloadName, "CustomData.csv", "Wrong output filename");
        }

        #endregion

        #region Record Management

        #region Successfull

        [TestMethod]
        public void RefreshData_Successfull()
        {
            var result = controller.RefreshData(RefreshDataThatReturnsEverything);

            Assert.IsInstanceOfType(result, typeof (PartialViewResult), "Should be of PartialViewResult type");
            Assert.IsNotNull(result.ViewData.Model, "Should not be null");
        }

        [TestMethod]
        public void UpdateRecord_Successfull()
        {
            const int recordId = 1;
            const string testComment = "Test Comment";

            var viewModel = new RecordViewModel {RecordId = recordId, SubtypeId = 1, Comment = testComment};

            var fileResult = controller.UpdateRecord(viewModel);

            var typeName = fileResult.Data as string;
            Assert.IsFalse(string.IsNullOrEmpty(typeName), "Should return correct type name");


            // Now verify the data has been changed
            var result = controller.RefreshData(RefreshDataThatReturnsEverything);
            IsPartial(result);

            Assert.IsNotNull(result.Model, "Should not be null");
            Assert.IsInstanceOfType(result.Model, typeof (IEnumerable<Record>), "Should be IEnumerable<Record>");

            var records = result.Model as IEnumerable<Record>;
            var record = records.First(i => i.RecordId == recordId);

            Assert.AreEqual(record.SubtypeId, 1, "Subtype should be updated");
            Assert.AreEqual(record.Comment, "Test Comment", "Comment should be updated");
        }

        [TestMethod]
        public void NewRegexForRecord_Successfull()
        {
            // 0. Init
            const int recordId = 2;
            const int subtypeId = 10;
            const string regex = "unknown";
            var ids = new[] {recordId, 3};


            // 1. First ensure we have 2 records to be processed
            var record2 = GetRecord(ids[0]);
            Assert.AreEqual(record2.SubtypeId, 0);

            var record3 = GetRecord(ids[1]);
            Assert.AreEqual(record3.SubtypeId, 0);


            //regex exists

            // 2. Call controller action
            var viewModel = new RegexViewModel {RegexId = recordId, SubtypeId = subtypeId, Name = regex};
            var result = controller.NewRegexForRecord(viewModel, ids);

            // Assert result
            var res = result.Data as AjaxResult;
            Assert.IsNotNull(res);
            Assert.IsTrue(res.Result, "Should return true when everything is OK");


            // 3. Now verify the data has been changed
            record2 = GetRecord(ids[0]);
            Assert.AreEqual(record2.SubtypeId, subtypeId);

            record3 = GetRecord(ids[1]);
            Assert.AreEqual(record3.SubtypeId, subtypeId);

            // TODO: Also verify regex count has incremented and new regex exists
        }

        #endregion

        #endregion

        #region Attachments Actions

        [TestMethod]
        public void AttachmentAdd_Successfull()
        {
            var fileResult = controller.AttachmentAdd(1, AttachmentFile("Test.csv", AttachmentFileContent));
            IsPartial(fileResult);
        }

        [TestMethod]
        public void AttachmentDel_Successfull()
        {
            AttachmentAdd_Successfull();

            var delResult = controller.AttachmentDel(1);
            Assert.IsTrue((bool) delResult.Data);
        }

        #endregion

        #endregion

        #region Helping Methods / Properties

        private string AttachmentFileContent
        {
            get { return "123"; }
        }

        private void Stop()
        {
            Debugger.Break();
        }

        private RefreshDataParameters RefreshDataThatReturnsEverything
        {
            get
            {
                return new RefreshDataParameters
                {
                    Companies = StaticData.Companies.Select(c => c.CompanyId),
                    Subtypes = StaticData.RecordSubtypes.Select(s => s.SubtypeId),
                    Years = StaticData.Years.Select(year => year.Id),
                    SortingColumn = "date",
                    SortingDirection = "desc",
                };
            }
        }

        #region Record(s) Retrieve

        private IEnumerable<Record> AllRecords
        {
            get
            {
                var data = controller.RefreshData(RefreshDataThatReturnsEverything);
                IsPartial(data);

                Assert.IsNotNull(data.Model, "Should not be null");
                Assert.IsInstanceOfType(data.Model, typeof(IEnumerable<Record>), "Should be IEnumerable<Record>");

                var records = data.Model as IEnumerable<Record>;
                Assert.IsNotNull(records);

                return records;
            }
        }

        private Record GetRecord(int id)
        {
            var record = AllRecords.FirstOrDefault(i => i.RecordId == id);
            Assert.IsNotNull(record, "Record with this ID doesn't exist");

            return record;
        }

        #endregion

        #endregion
    }
}
