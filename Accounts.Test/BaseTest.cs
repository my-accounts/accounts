using System;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Accounts.BLL;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Moq;

namespace Accounts.Test
{
    public class BaseTest
    {
        protected static void OverrideSettingPath()
        {
            var di = new DirectoryInfo(Environment.CurrentDirectory);
            Settings.Path.AttachmentsFolder = di.Parent.Parent + "\\Files\\Attachments\\";
            Settings.Path.ArchiveFolder = di.Parent.Parent + "\\Files\\Archive\\";

            if (Directory.Exists(Settings.Path.AttachmentsFolder))
            {
                Directory.Delete(Settings.Path.AttachmentsFolder);
            }
            if (Directory.Exists(Settings.Path.ArchiveFolder))
            {
                Directory.Delete(Settings.Path.ArchiveFolder);
            }

            Directory.CreateDirectory(Settings.Path.AttachmentsFolder);
            Directory.CreateDirectory(Settings.Path.ArchiveFolder);
        }

        protected HttpPostedFileBase AttachmentFile(string fileName, string fileContent)
        {
            var file1Mock = new Mock<HttpPostedFileBase>();
            file1Mock.Setup(x => x.FileName).Returns(fileName);
            file1Mock.Setup(x => x.InputStream).Returns(StringToStream(fileContent));
            file1Mock.Setup(x => x.ContentLength).Returns(1);

            return file1Mock.Object;
        }

        protected static Stream StringToStream(string s)
        {
            var stream = new MemoryStream();
            var writer = new StreamWriter(stream);
            writer.Write(s);
            writer.Flush();
            stream.Position = 0;
            return stream;
        }

        protected string GenerateRandomString(int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

            var random = new Random();
            return new string(Enumerable.Repeat(chars, length).Select(s => s[random.Next(s.Length)]).ToArray());
        }
    }
}
