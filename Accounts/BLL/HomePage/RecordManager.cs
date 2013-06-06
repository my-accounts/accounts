using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;
using Accounts.Models.Entities;
using Accounts.Models.ViewModels.Home;
using Accounts.Models.ViewModels.Shared;
using ORM;
using ORM.Results;

namespace Accounts.BLL
{
    public class RecordManager
    {
        public IEnumerable<Record> GetData(RefreshDataParameters parameters)
        {
            return DataBase<Record>.GetModel<Record>(Settings.StoredProcedures.RecordsGet, parameters.SqlParameters).Values;
        }

        public string UpdateRecord(RecordViewModel viewModel)
        {
            var parameters = new List<SqlParameter>
                {
                    new SqlParameter("@RecordId", viewModel.RecordId),
                    new SqlParameter("@SubtypeId", viewModel.SubtypeId),
                    new SqlParameter("@Comment", viewModel.Comment),
                    new SqlParameter("@Result", -1) {Direction = ParameterDirection.Output}
                };

            int result = UpdateRecord(parameters);
            string newTypeName = StaticData.RecordTypes.First(j => j.TypeId == StaticData.RecordSubtypes.First(i => i.SubtypeId == viewModel.SubtypeId).TypeId).Name;
            return result > 0 ? newTypeName : String.Empty;
        }

        private int UpdateRecord(IEnumerable<SqlParameter> parameters)
        {
            var result = Database.StoredProcedure(Settings.StoredProcedures.RecordUpdate, parameters, "@Result") as ProcedureIdentityResult;
            return result != null ? result.Identity : -1;
        }

        public AjaxResult NewRegexForRecord(RegexViewModel regex, int[] Ids, ModelStateDictionary modelState)
        {
            const int recordId = 0;

            if (modelState.IsValid)
            {
                string message = string.Empty;

                var addRegexParameters = new[] { 
                        new SqlParameter("@SubtypeId", regex.SubtypeId),
                        new SqlParameter("@Regex", regex.Name),
                        new SqlParameter("@Result", -1) {Direction = ParameterDirection.Output}
                    };

                var res = Database.StoredProcedure(Settings.StoredProcedures.RegexAdd, addRegexParameters, "@Result") as ProcedureIdentityResult;
                if (res.Status == Status.Success)
                {
                    StaticData.LoadRegex();

                    var parameter = (new List<SqlParameter> { new SqlParameter("@RecordIds", string.Join(", ", Ids)) }).ToArray();
                    IEnumerable<Record> records = DataBase<Record>.GetModel<Record>(Settings.StoredProcedures.RecordsGetById, parameter).Values;

                    // Iterate through each record found matchchig regex
                    foreach (Record record in records)
                    {
                        // Do only for those records, that match newly created mask and have 0 as SubtypeId
                        if (record.SubtypeId == 0)
                        {
                            var parameters = new List<SqlParameter>
                                {
                                    new SqlParameter("@RecordId", record.RecordId),
                                    new SqlParameter("@SubtypeId", regex.SubtypeId),
                                    new SqlParameter("@Comment", record.Comment),
                                    new SqlParameter("@Result", -1) {Direction = ParameterDirection.Output}
                                };

                            // Call to database to update parameter

                            var result = new RecordManager().UpdateRecord(parameters);
                            if (result < 1)
                            {
                                message += "Failes to update";
                            }
                        }
                    }

                    if (message.Length == 0)
                    {
                        // Return AjaxResult = OK
                        return new AjaxResult(modelState, recordId);
                    }

                    return new AjaxResult(modelState, recordId, "Error while adding new filter");
                }

                return new AjaxResult(modelState, recordId, res.ErrorMessage);
            }

            return new AjaxResult(modelState, recordId);
        }
    }
} 