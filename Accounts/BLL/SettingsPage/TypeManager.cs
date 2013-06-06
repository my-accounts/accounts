using System.Data;
using System.Data.SqlClient;
using ORM;
using Accounts.Models;
using ORM.Results;

namespace Accounts.BLL.SettingsPage
{
    public class TypeManager
    {
        private readonly int typeId;
        public TypeManager(int typeId)
        {
            this.typeId = typeId;
        }

        public static ProcedureIdentityResult CreateNew(string newTypeName)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.TypeAdd, new[]
                {
                    new SqlParameter("@Flow", false), // Now it is hardcoded because we cannot create 'IN'-flows as it is reserved just one.
                    new SqlParameter("@Name", newTypeName),
                    new SqlParameter("@Result", -1) {Direction = ParameterDirection.Output}
                }, "@Result") as ProcedureIdentityResult;

            if (result.Status == Status.Success)
            {
                StaticData.LoadTypes();
            }

            return result;
        }

        public bool Rename(string newTypeName)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.TypeUpdate, new[]
                {
                    new SqlParameter("@TypeId", typeId),
                    new SqlParameter("@Flow", false), // Now it is hardcoded because we cannot create 'IN'-flows as it is reserved just one.
                    new SqlParameter("@Name", newTypeName)
                });

            if (result.Status == Status.Success)
            {
                StaticData.LoadTypes();
                return true;
            }

            return false;
        }

        public ProcedureResult Delete()
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.TypeDelete, new[] { new SqlParameter("@TypeId", typeId) });

            if (result.Status == Status.Success)
            {
                StaticData.LoadTypes();
            }

            return result;
        }
    }
}