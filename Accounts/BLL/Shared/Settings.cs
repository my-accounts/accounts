using System.Web.Hosting;

namespace Accounts.BLL
{
    public static class Settings
    {
        public static string DefaultSortingColumn = "date";
        public static string DefaultSortingDirection = "asc";

        public static class Path
        {
            public static string AttachmentsFolder = HostingEnvironment.MapPath(string.Format("~/Files/Attachments/"));
            public static string ArchiveFolder = HostingEnvironment.MapPath(string.Format("~/Files/Archive/"));
        }

        public static class CSV
        {
            public static string MimeType = "text/csv";
            public static string FileDownloadName = "CustomData.csv";
        }

        public static class VirtualPath
        {
            public static string AttachmentsFolder = "~/Files/Attachments/";
            public static string ArchiveFolder = "~/Files/Archive/";
        }


        public static class StoredProcedures
        {
            public static string RecordsGet = "Accounts_RecordsGet";
            public static string RegexAdd = "Accounts_RegexAdd";
            public static string RecordsGetById = "Accounts_RecordsGetById";
            public static string RecordAdd = "Accounts_RecordAdd";
            public static string RecordUpdate = "Accounts_RecordUpdate";
            public static string CompaniesGet = "Accounts_CompaniesGet";
            public static string TypesGet = "Accounts_TypesGet";
            public static string SubtypesGet = "Accounts_SubtypesGet";
            public static string RegexGet = "Accounts_RegexGet";
            public static string TypeDelete = "Accounts_TypeDelete";
            public static string SubtypeDelete = "Accounts_SubtypeDelete";
            public static string RegexUpdate = "Accounts_RegexUpdate";
            public static string RegexDelete = "Accounts_RegexDelete";

            public static string UploadsAdd = "Accounts_UploadsAdd";
            public static string UploadsGet = "Accounts_UploadsGet";
            public static string ChangeCompany = "Accounts_ChangeCompany";
            public static string UploadFileDelete = "Accounts_UploadFileDelete";

            public static string CompanyAdd = "Accounts_CompanyAdd";
            public static string CompanyRename = "Accounts_CompanyRename";
            public static string CompanyDel = "Accounts_CompanyDel";

            
            public static string TypeAdd = "Accounts_TypeAdd";
            public static string TypeUpdate = "Accounts_TypeUpdate";

            public static string SubtypeAdd = "Accounts_SubtypeAdd";
            public static string SubtypeUpdate = "Accounts_SubtypeUpdate";

            public static string YearStartDateSet = "Accounts_YearStartDateSet";
            public static string YearsGet = "Accounts_YearsGet";

            
            public static string RecordDelete = "Accounts_RecordDelete";
            public static string InitTest = "Accounts_InitTest";
        }
    }
}