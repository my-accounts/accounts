using System;
using System.Collections.Generic;
using System.Linq;
using Accounts.BLL;
using Accounts.Models.Entities;
using Accounts.Models.ViewModels.Home;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ORM;

namespace Accounts.Test.BLL.HomePage
{
    [TestClass]
    public class RecordManagerTests : BaseTest
    {
        [TestInitialize]
        public void Setup()
        {
            // Specify temporary path for Attachments and Archive folders
            OverrideSettingPath();

            // Reset the database and reload static data
            Database.StoredProcedure(Settings.StoredProcedures.InitTest);
            StaticData.Load();
        }

        [TestMethod]
        public void Default_Test()
        {
            var recordManager = new RecordManager();
            var records = recordManager.GetData(DefaultParameters);

            Assert.AreEqual(records.Count() - 1, 3, "Records count does not match");
        }

        [TestMethod]
        public void Search_Filter_Test()
        {
            const string searchPattern = "test";

            var searchParameters = DefaultParameters;
            searchParameters.SearchFilter = searchPattern;

            var recordManager = new RecordManager();
            var records = recordManager.GetData(searchParameters);

            Assert.AreEqual(records.Count() - 1, 2, "Records count does not match");
        }

        [TestMethod]
        public void Sorting_Test()
        {
            const string searchPattern = "test";

            // Get initial records with default desc sorting
            var recordsDesc = GetRecordsWithoutServiceline(DefaultParameters);

            var descFirstDate = recordsDesc.First().Date;
            var descLasDate = recordsDesc.Last().Date;

            Assert.IsTrue(descFirstDate > descLasDate, "Last record's date should be earlier than first record's");

            // Change direction
            var parameters = DefaultParameters;
            parameters.SortingDirection = "asc";

            //
            var recordsAsc = GetRecordsWithoutServiceline(parameters);
            Assert.IsTrue(recordsAsc.First().Date < recordsAsc.Last().Date, "Last record's date should be later than first record's");

            Assert.IsTrue(recordsDesc.First().Date > recordsAsc.First().Date, "Last record's date should be earlier than first record's");
        }

        #region Private Helpers

        private RefreshDataParameters DefaultParameters
        {
            get
            {
                return new RefreshDataParameters
                {
                    Companies = StaticData.Companies.Select(i => i.CompanyId),
                    Subtypes = StaticData.RecordSubtypes.Select(i => i.SubtypeId),
                    Years = StaticData.Years.Select(i => i.Id),
                    SortingColumn = "date",
                    SortingDirection = "desc",
                    SearchFilter = String.Empty
                };
            }
        }
        private IEnumerable<Record> GetRecordsWithoutServiceline(RefreshDataParameters parameters)
        {
            var recordManager = new RecordManager();
            var records = recordManager.GetData(parameters);
            return records.Where(i => i.RecordId < records.Max(j => j.RecordId));
        }

        #endregion
    }
}
