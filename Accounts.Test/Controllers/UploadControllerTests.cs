using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using Accounts.BLL;
using Accounts.Controllers;
using Accounts.Models.ViewModels.Home;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using ORM;

namespace Accounts.Test.Controllers
{
    [TestClass]
    public class UploadControllerTest : BaseControllerTest
    {
        UploadController controller;

        [TestInitialize]
        public void Setup()
        {
            // Specify temporary path for Attachments and Archive folders
            OverrideSettingPath();

            controller = new UploadController();

            // Reset the database and reload static data
            Database.StoredProcedure(Settings.StoredProcedures.InitTest);
            StaticData.Load();
        }

        #region Successfull

        [TestMethod]
        public void Index_Returns_Correct_Model()
        {
            var result = controller.Index();
            Assert.IsNotNull(result.ViewData.Model, Messages.Settings.ShouldContainViewModel);

            Assert.IsInstanceOfType(result.ViewData.Model, typeof (IEnumerable<UploadItemViewModel>),
                                    "UploadController.Index view model should be of type IEnumerable<UploadItemViewModel>");
            Assert.IsNotNull(result.ViewData.Model, "Should not be null");
        }

        [TestMethod]
        public void Upload_Successfull()
        {
            const int companyId = 1;
            HttpPostedFileBase fileMock = AttachmentFile("Test.csv", AttachmentFileContent);

            var result = controller.Upload(new[] {fileMock}, companyId);
            IsRedirect(result);

            //Assert.IsNotNull(result.ViewData.Model, Messages.Settings.ShouldContainViewModel);

            //Assert.IsInstanceOfType(result.ViewData.Model, typeof(IEnumerable<UploadItemViewModel>), "UploadController.Index view model should be of type IEnumerable<UploadItemViewModel>");
            //Assert.IsNotNull(result.ViewData.Model, "Should not be null");
        }

        [TestMethod]
        public void DragDropUpload_Successfull()
        {
            const int companyId = 1;
            HttpPostedFileBase fileMock = AttachmentFile("Test.csv", AttachmentFileContent);

            var result = controller.DragDropUpload(fileMock, companyId);
            IsRedirect(result);

            //Assert.IsNotNull(result.ViewData.Model, Messages.Settings.ShouldContainViewModel);

            //Assert.IsInstanceOfType(result.ViewData.Model, typeof(IEnumerable<UploadItemViewModel>), "UploadController.Index view model should be of type IEnumerable<UploadItemViewModel>");
            //Assert.IsNotNull(result.ViewData.Model, "Should not be null");
        }

        [TestMethod]
        public void UploadChangeCompany_Successfull()
        {
            const int companyId = 2;
            const int uploadFileId = 1;

            var result = controller.UploadChangeCompany(uploadFileId, companyId);
            Assert.IsTrue((bool) result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);

            var uploadFile = UploadManager.Uploads.First(i => i.UploadFileId == uploadFileId);
            Assert.AreEqual(uploadFile.CompanyId, companyId, Messages.Settings.ShouldBeChanged);

            //Assert.IsNotNull(result.ViewData.Model, Messages.Settings.ShouldContainViewModel);

            //Assert.IsInstanceOfType(result.ViewData.Model, typeof(IEnumerable<UploadItemViewModel>), "UploadController.Index view model should be of type IEnumerable<UploadItemViewModel>");
            //Assert.IsNotNull(result.ViewData.Model, "Should not be null");
        }


        [TestMethod]
        public void UploadFileDelete_Successfull()
        {
            const int uploadFileId = 1;

            // Create a file in order to make sure it will be deleted as well
            var path = Settings.Path.ArchiveFolder + "TestFile.csv";
            var streamWriter = File.CreateText(path);
            streamWriter.Close();

            var result = controller.UploadFileDelete(uploadFileId);
            Assert.IsTrue((bool) result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);
        }

        #endregion

        [TestMethod]
        public void UploadFileDelete_File_Doesnt_Exist()
        {
            const int uploadFileId = 1;

            var result = controller.UploadFileDelete(uploadFileId);
            Assert.IsFalse((bool)result.Data, Messages.Settings.ShouldBeTrueWhenSuccess);
        }

        #region Helping Methods

        private string AttachmentFileContent
        {
            get
            {
                return  @"Date,Type,Description,Paid out,Paid in,Balance
                            ""17 Jul 2012"",BP,""Miles M PERSONAL INVESTMNT "", ,""5000.00"",""5000.00""
                            ";
            }
        }

        #endregion
    }
}
