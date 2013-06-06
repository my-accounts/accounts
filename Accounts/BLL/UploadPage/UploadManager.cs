using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using Accounts.Models.Entities;
using ORM;
using ORM.Results;

namespace Accounts.BLL
{
    public class UploadManager
    {
        private readonly int companyId;
        private readonly IEnumerable<HttpPostedFileBase> files;

        #region Constructor overloads

        public UploadManager(IEnumerable<HttpPostedFileBase> files, int companyId)
        {
            this.companyId = companyId;
            this.files = files;
        }

        #endregion

        #region Public Members

        public void Process()
        {
            // 1. Get filenames with CSV content and prepare for parsing
            Dictionary<string, string> csv = GetContentAndSaveToArchive();

            // 2. Register all filenames to history (Key - filename, Value - csv)
            var allFilenames = csv.Select(f => f.Key);
            IEnumerable<UploadFile> uploadFiles = SaveHistoryUpload(allFilenames);


            // 3. Whole content from whole wiles is saved into the database
            SaveToDatabase(csv, uploadFiles);

            // 4. Update years and companies collection
            StaticData.LoadCompanies();
            StaticData.LoadYears();

            // TODO: Inform caller about the result
        }

        public static bool ChangeCompany(int uploadFileId, int companyId)
        {
            var res = Database.StoredProcedure(Settings.StoredProcedures.ChangeCompany,
                    new[] { new SqlParameter("@UploadFileId", uploadFileId), new SqlParameter("@CompanyId", companyId) });
            
            return res.Status == Status.Success;
        }

        public static bool DeleteUploadFile(int uploadFileId)
        {
            if (Uploads.Any(i => i.UploadFileId == uploadFileId))
            {
                var uploadFilename = Uploads.First(i => i.UploadFileId == uploadFileId).Filename;
                string fullPath = Settings.Path.ArchiveFolder + uploadFilename;

                if (File.Exists(fullPath))
                {
                    File.Delete(fullPath);

                    var res = Database.StoredProcedure(Settings.StoredProcedures.UploadFileDelete, new[] {new SqlParameter("@UploadFileId", uploadFileId)});

                    if (res.Status == Status.Success)
                    {
                        StaticData.LoadCompanies();
                        StaticData.LoadYears();
                        return true;
                    }
                }
            }

            return false;
        }

        // gets all the uploads from the database
        public static IEnumerable<UploadFile> Uploads
        {
            get { return DataBase<UploadFile>.GetModel<UploadFile>(Settings.StoredProcedures.UploadsGet).Values; }
        }

        #endregion

        #region Private Methods

        private Dictionary<string, string> GetContentAndSaveToArchive()
        {
            var dict = new Dictionary<string, string>();

            foreach (HttpPostedFileBase file in files)
            {
                if (file != null && file.ContentLength > 0)
                {
                    // Save file into archive folder
                    string savedFilename = SaveFiles(file);

                    // Get CSV data representation without service rows
                    string lines = ParseFilesContent(file);

                    // Add to Dictionary in order to return out
                    dict.Add(savedFilename, lines);
                }
            }

            return dict;
        }

        private string SaveFiles(HttpPostedFileBase file)
        {
            string extension = Path.GetExtension(file.FileName);
            string filename = Path.GetFileNameWithoutExtension(file.FileName);

            int counter = 1;
            while (File.Exists(string.Format("{0}{1}({2}){3}", Settings.Path.ArchiveFolder, filename, counter, extension)))
            {
                counter++;
            }

            filename = string.Format("{0}({1}){2}", filename, counter, extension);
            file.SaveAs(Settings.Path.ArchiveFolder + filename);

            return filename;
        }

        private string ParseFilesContent(HttpPostedFileBase file)
        {
            var reader = new StreamReader(file.InputStream);
            string lines = reader.ReadToEnd();
            if (lines.StartsWith("Date,Type,Description,Paid out,Paid in,Balance"))
            {
                lines = DeleteLines(lines, 1);
            }
            return lines;
        }

        private void SaveToDatabase(Dictionary<string, string> csv, IEnumerable<UploadFile> uploadFiles)
        {
            // For each of uploaded files
            foreach (var item in csv)
            {
                var linesArray = item.Value.Split((char)0xA);

                // For each line in the currently processed uploaded file
                foreach (string str in linesArray)
                {
                    if (str.Trim().Length == 0)
                    {
                        continue;
                    }

                    if (!string.IsNullOrEmpty(str))
                    {
                        var p = str.Split(',');

                        // Validate array
                        var a = new List<string>();
                        for (int i = 0; i < p.Length; i++)
                        {
                            var t = p[i].Trim();

                            if (!string.IsNullOrEmpty(t))
                            {
                                if ((t.StartsWith("\"") && !t.EndsWith("\"")) || (!t.StartsWith("\"") && t.EndsWith("\"")))
                                {
                                    t = t + p[i + 1].Trim();
                                    i++;
                                }
                                a.Add(t.Trim('"'));
                            }
                        }

                        var q = a.ToArray();

                        var arr = new List<SqlParameter> {
                                      new SqlParameter("@CompanyID", companyId),
                                      new SqlParameter("@Date", Convert.ToDateTime(q[0])),
                                      new SqlParameter("@Reference",q[2].Trim()),
                                      new SqlParameter("@UploadFileId", uploadFiles.First(i => i.Filename == item.Key).UploadFileId),
                                      new SqlParameter("@Result", 0) {Direction = ParameterDirection.Output}
                                    };

                        if (!string.IsNullOrEmpty(p[3].Trim()))
                        {
                            arr.Add(new SqlParameter("@PaidOut", Convert.ToDecimal(q[3])));
                        }
                        if (!string.IsNullOrEmpty(p[4].Trim()))
                        {
                            arr.Add(new SqlParameter("@PaidIn", Convert.ToDecimal(q[3])));
                        }

                        arr.Add(new SqlParameter("@SubtypeId", AutoDetermineSubtype(q[2].Trim())));

                        var result = Database.StoredProcedure(Settings.StoredProcedures.RecordAdd, arr);
                        if (result.Status == Status.Error)
                        {
                            throw new ApplicationException(result.ErrorMessage);
                        }
                    }
                }
            }
        }

        private IEnumerable<UploadFile> SaveHistoryUpload(IEnumerable<string> allFilenames)
        {
            string csv = string.Join("|", allFilenames.Select(i => i));

            var parameters = new [] { new SqlParameter("@CompanyId", companyId), new SqlParameter("@Filenames", csv) };
            return DataBase<UploadFile>.GetModel<UploadFile>(Settings.StoredProcedures.UploadsAdd, parameters).Values; /*as ProcedureIdentityResult*/;

            //var res = Database.StoredProcedure(Settings.StoredProcedures.UploadsAdd, parameters)  as ProcedureIdentityResult;
        }

        #endregion

        #region Helpers

        private string DeleteLines(string input, int lines)
        {
            var result = input;
            for (var i = 0; i < lines; i++)
            {
                var idx = result.IndexOf('\n');
                if (idx < 0)
                {
                    // do what you want when there are less than the required lines
                    return string.Empty;
                }
                result = result.Substring(idx + 1);
            }
            return result;
        }

        /// <summary>
        /// Returns SubtypeId of first regex match or -1 if nothing found
        /// </summary>
        internal int AutoDetermineSubtype(string reference)
        {
            //First match will be used
            foreach (var regex in StaticData.RecordRegex)
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(reference, regex.Name, System.Text.RegularExpressions.RegexOptions.IgnoreCase))
                {
                    return regex.SubtypeId;
                }
            }

            return 0;
        }


        #endregion
    }
}