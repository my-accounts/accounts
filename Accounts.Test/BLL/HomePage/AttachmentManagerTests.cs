using Accounts.BLL;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ORM;

namespace Accounts.Test.BLL.HomePage
{
    [TestClass]
    public class AttachmentManagerTests : BaseTest
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
        public void Add_Id_Doesnt_Exist()
        {
            const string AttachmentFileContent = "123";
            var file = AttachmentFile("Test.csv", AttachmentFileContent);

            var attachmentManager = new AttachmentManager(100);
            string fileName = attachmentManager.Add(file);
            
            Assert.IsTrue(fileName.Length > 0);
        }

        [TestMethod]
        public void Delete_Id_Doesnt_Exist()
        {
            var attachmentManager = new AttachmentManager(100);
            bool delete = attachmentManager.Delete();
            Assert.IsTrue(delete);
        }

        [TestMethod]
        public void GetAttachments_Empty()
        {
            var attachments = AttachmentManager.GetAttachments();
            Assert.IsNotNull(attachments);
        }
    }
}
