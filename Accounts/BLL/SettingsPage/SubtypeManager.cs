using System.Data;
using System.Data.SqlClient;
using Accounts.Models;
using ORM;
using ORM.Results;

namespace Accounts.BLL.SettingsPage
{
    public class SubtypeManager
    {
        private readonly int subtypeId;
        public SubtypeManager(int subtypeId)
        {
            this.subtypeId = subtypeId;
        }

        public static ProcedureIdentityResult CreateNew(int typeId, string newSubtypeName)
        {
            var res = Database.StoredProcedure(Settings.StoredProcedures.SubtypeAdd, new[]
                {
                    new SqlParameter("@TypeId", typeId),
                    new SqlParameter("@Name", newSubtypeName),
                    new SqlParameter("@Result", -1) {Direction = ParameterDirection.Output}
                }, "@Result") as ProcedureIdentityResult;

            if (res.Status == Status.Success)
            {
                StaticData.LoadSubtypes();
            }

            return res;
        }

        public bool Update(int typeId, string newSubtypeName)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.SubtypeUpdate, new[]
                {
                    new SqlParameter("@SubtypeId", subtypeId),
                    new SqlParameter("@TypeId", typeId),
                    new SqlParameter("@Name", newSubtypeName)
                });

            if (result.Status == Status.Success)
            {
                StaticData.LoadSubtypes();
                return true;
            }

            return false;
        }

        public ProcedureResult Delete()
        {
            var res = Database.StoredProcedure(Settings.StoredProcedures.SubtypeDelete, new[] { new SqlParameter("@SubtypeId", subtypeId) });

            if (res.Status == Status.Success)
            {
                StaticData.LoadSubtypes();
            }

            return res;
        }
    }
}