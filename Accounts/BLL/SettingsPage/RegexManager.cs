using System.Data;
using System.Data.SqlClient;
using ORM;
using ORM.Results;
using Accounts.Models;

namespace Accounts.BLL.SettingsPage
{
    public class RegexManager
    {
        private readonly int regexId;

        public RegexManager(int regexId)
        {
            this.regexId = regexId;
        }

        public static ProcedureIdentityResult CreateNew(string regex, int subtypeId)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.RegexAdd, new[]
                {
                    new SqlParameter("@SubtypeId", subtypeId),
                    new SqlParameter("@Regex", regex),
                    new SqlParameter("@Result", -1) {Direction = ParameterDirection.Output}
                }, "@Result") as ProcedureIdentityResult;

            if (result.Status == Status.Success)
            {
                StaticData.LoadRegex();
            }

            return result;
        }

        public bool Rename(int subtypeId, string regex)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.RegexUpdate, new[]
                {
                    new SqlParameter("@RegexId", regexId),
                    new SqlParameter("@SubtypeId", subtypeId),
                    new SqlParameter("@Regex", regex)
                });

            if (result.Status == Status.Success)
            {
                StaticData.LoadRegex();
                return true;
            }

            return false;
        }

        public ProcedureResult Delete()
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.RegexDelete, new[] { new SqlParameter("@RegexId", regexId) });

            if (result.Status == Status.Success)
            {
                StaticData.LoadRegex();
            }

            return result;
        }
    }
}