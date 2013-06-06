using System.Diagnostics;
using System.Linq;
using Accounts.BLL;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace Accounts.Test
{
    [TestClass]
    public class StaticDataTests
    {
        // Is called for each time for each test method
        public StaticDataTests()
        {
        }

        // Is called for each time for each test method
        [TestInitialize]
        public void Setup()
        {
            StaticData.Init();
        }

        [TestMethod]
        public void Static_Collection_Are_Initially_Null()
        {
            const string shouldBeNullError = Messages.Settings.ShouldBeNull;
            Assert.IsNull(StaticData.Companies, shouldBeNullError);
            Assert.IsNull(StaticData.Years, shouldBeNullError);
            Assert.IsNull(StaticData.RecordTypes, shouldBeNullError);
            Assert.IsNull(StaticData.RecordSubtypes, shouldBeNullError);
            Assert.IsNull(StaticData.RecordRegex, shouldBeNullError);
        }

        [TestMethod]
        public void Static_Collection_Are_Not_Null_After_Load()
        {
            StaticData.Load();

            Assert.IsNotNull(StaticData.Companies, Messages.Settings.ShouldNotBeNull);
            Assert.IsNotNull(StaticData.Years, Messages.Settings.ShouldNotBeNull);
            Assert.IsNotNull(StaticData.RecordTypes, Messages.Settings.ShouldNotBeNull);
            Assert.IsNotNull(StaticData.RecordSubtypes, Messages.Settings.ShouldNotBeNull);
            Assert.IsNotNull(StaticData.RecordRegex, Messages.Settings.ShouldNotBeNull);
        }

        [TestMethod]
        public void Static_Collection_Items_Are_Not_Empty()
        {
            StaticData.Load();

            // Please note that we do not test Years, as their count depends on the records

            Assert.AreNotEqual(StaticData.Companies.Count(), 0, Messages.Settings.ShouldNotBeEmpty);
            Assert.AreNotEqual(StaticData.RecordTypes.Count(), 0, Messages.Settings.ShouldNotBeEmpty);
            Assert.AreNotEqual(StaticData.RecordSubtypes.Count(), 0, Messages.Settings.ShouldNotBeEmpty);
            Assert.AreNotEqual(StaticData.RecordRegex.Count(), 0, Messages.Settings.ShouldNotBeEmpty);
        }

        [TestMethod]
        public void Static_Collection_Regex_Test()
        {
            StaticData.LoadRegex();

            Assert.AreNotEqual(StaticData.RecordRegex.Count(), 0, Messages.Settings.ShouldNotBeEmpty);
        }
    }
}
