using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Accounts.Models;
using Accounts.Models.Entities;
using Accounts.Models.ViewModels.Home;
using ORM;

namespace Accounts.BLL.HomePage
{
    public class CSV
    {
        private readonly RefreshDataParameters parameters;
        public CSV(RefreshDataParameters parameters)
        {
            this.parameters = parameters;
        }

        public byte[] GetBytes()
        {
            var rec = DataBase<Record>.GetModel<Record>(Settings.StoredProcedures.RecordsGet, parameters.SqlParameters);

            return CreateCSV(rec.Values);
        }

        private static byte[] CreateCSV(IEnumerable<Record> records)
        {
            var str = new StringBuilder();

            foreach (var rec in records)
            {
                string line = String.Empty;
                if (rec.Reference.Trim().ToLower() == "total")
                {
                    line = "Company,Date," + rec.Reference + ",Out,In\n";
                    line += ",,," + rec.Amount + "," + rec.SubtypeId + "\n";
                    line += ",,,,\n";
                }
                else
                {
                    string company = StaticData.Companies.First(i => i.CompanyId == rec.CompanyId).Name;

                    int typeId = StaticData.RecordSubtypes.First(i => i.SubtypeId == rec.SubtypeId).TypeId;
                    bool flow = StaticData.RecordTypes.First(i => i.TypeId == typeId).Flow;

                    line = string.Format("{0},{1},{2},{3},{4}\n", 
                        company, 
                        rec.Date.ToShortDateString(), 
                        rec.Reference, 
                        (flow ? String.Empty : rec.Amount.ToString()), 
                        (flow ? rec.Amount.ToString() : String.Empty));
                }

                str.Append(line);
            }

            return Encoding.UTF8.GetBytes(str.ToString());
        }
    }
}