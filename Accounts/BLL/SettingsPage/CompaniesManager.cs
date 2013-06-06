using System.Data;
using System.Data.SqlClient;
using Accounts.Models;
using ORM;
using ORM.Results;

namespace Accounts.BLL.SettingsPage
{

    public class CompaniesManager
    {
        private readonly int companyId;

        public CompaniesManager(int companyId)
        {
            this.companyId = companyId;
        }

        public static ProcedureIdentityResult CreateNew(string companyName)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.CompanyAdd, new[]
                {
                    new SqlParameter("@CompanyName", companyName),
                    new SqlParameter("@Result", -1) {Direction = ParameterDirection.Output}
                }, "@Result") as ProcedureIdentityResult;

            if (result.Status == Status.Success)
            {
                StaticData.LoadCompanies();
            }

            return result;
        }

        public bool Rename(string companyName)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.CompanyRename, new[]
                {
                    new SqlParameter("@CompanyId", companyId),
                    new SqlParameter("@CompanyName", companyName)
                });

            if (result.Status == Status.Success)
            {
                StaticData.LoadCompanies();
                return true;
            }

            return false;
        }

        public ProcedureResult Delete()
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.CompanyDel, new[] { new SqlParameter("@CompanyId", companyId) });

            if (result.Status == Status.Success)
            {
                StaticData.LoadCompanies();
            }

            return result;
        }
    }
}