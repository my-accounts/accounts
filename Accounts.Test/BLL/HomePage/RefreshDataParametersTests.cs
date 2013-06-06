using System;
using System.Linq;
using Accounts.BLL;
using Accounts.Models.ViewModels.Home;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ORM;

namespace Accounts.Test.BLL.HomePage
{
    [TestClass]
    public class RefreshDataParametersTests : BaseTest
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
        public void Returns_Correct_Values()
        {
            // Get SqlParameter[] from default parameters object
            var param = DefaultParameters.SqlParameters;
            Assert.AreEqual(param.Length, 5);

            var companyIds = param.FirstOrDefault(i => i.ParameterName == "@CompanyIds");
            Assert.IsNotNull(companyIds);
            Assert.AreEqual(companyIds.Value, string.Join(",", StaticData.Companies.Select(i=>i.Id)));

            var subtypeIds = param.FirstOrDefault(i => i.ParameterName == "@SubtypeIds");
            Assert.IsNotNull(subtypeIds);
            Assert.AreEqual(subtypeIds.Value, string.Join(",", StaticData.RecordSubtypes.Select(i => i.Id)));

            var yearsIds = param.FirstOrDefault(i => i.ParameterName == "@YearsCSV");
            Assert.IsNotNull(yearsIds);

            var sortingColumn = param.FirstOrDefault(i => i.ParameterName == "@SortingColumn");
            Assert.IsNotNull(sortingColumn);
            Assert.AreEqual(sortingColumn.Value, "date");

            var sortingDirection = param.FirstOrDefault(i => i.ParameterName == "@SortingDirection");
            Assert.IsNotNull(sortingDirection);
            Assert.AreEqual(sortingDirection.Value, "desc");
        }



        [TestMethod]
        public void Missing_Or_Empty_Values()
        {

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

        #endregion
    }
}
