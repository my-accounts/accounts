using System;
using System.Collections.Generic;
using System.IO;
using System.Web;

namespace Accounts.BLL
{
    /// <summary>
    /// Adds and removes attachments
    /// </summary>
    public class AttachmentManager
    {
        private readonly int id;
        public AttachmentManager(int id)
        {
            this.id = id;
        }

        /// <summary>
        /// Saves attachment to specified folder
        /// </summary>
        public string Add(HttpPostedFileBase file)
        {
            string fileName = id + Path.GetExtension(file.FileName);
            string filePath = string.Format("{0}{1}", Settings.Path.AttachmentsFolder, fileName);

            if (!File.Exists(filePath))
            {
                try
                {
                    file.SaveAs(filePath);
                    return fileName;
                }
                catch { }
            }

            return String.Empty;
        }


        /// <summary>
        /// Deletes attchment
        /// </summary>
        public bool Delete()
        {
            try
            {
                foreach (FileInfo f in new DirectoryInfo(Settings.Path.AttachmentsFolder).GetFiles(id + "*.*"))
                {
                    f.Delete();
                }
                return true;
            }
            catch { }

            return false;
        }

        /// <summary>
        /// Returns dictionary of all the attachments for all records in key value pair format id - file
        /// </summary>
        public static Dictionary<int, string> GetAttachments()
        {
            var attchments = new Dictionary<int, string>();

            if (!Directory.Exists(Settings.Path.AttachmentsFolder))
            {
                throw new ApplicationException(string.Format("Attachments directory not found: {0}", Settings.Path.AttachmentsFolder));
            }

            foreach (var fp in Directory.GetFiles(Settings.Path.AttachmentsFolder))
            {
                var fn = fp.Substring(fp.LastIndexOf('\\') + 1);
                var f = fp.Substring(fp.LastIndexOf('\\') + 1, fp.LastIndexOf('.') - fp.LastIndexOf('\\') - 1);

                int id = 0;
                if (int.TryParse(f, out id))
                {
                    attchments.Add(id, fn);
                }
            }
            return attchments;
        }
    }
}