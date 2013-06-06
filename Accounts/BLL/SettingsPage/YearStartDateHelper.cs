using System.Data.SqlClient;
using System.Linq;
using ORM;
using ORM.Results;

namespace Accounts.BLL.SettingsPage
{
    public class YearStartDateHelper
    {
        public static int GetCurrentStartDateId()
        {
            if (StaticData.Companies.Any())
            {
                return StaticData.YearStartDates.First(i => i.Month == StaticData.Companies.First().StartMonth && i.Day == StaticData.Companies.First().StartDay).Id;
            }

            return -1;
        }

        public static bool ChangeYearStartDate(int id)
        {
            var yearStartDate = StaticData.YearStartDates.FirstOrDefault(i => i.Id == id);

            if (yearStartDate == null)
            {
                return false;
            }

            var res = Database.StoredProcedure(Settings.StoredProcedures.YearStartDateSet,
                                                    new[] { new SqlParameter("@StartMonth", yearStartDate.Month), new SqlParameter("@StartDay", yearStartDate.Day) });
            StaticData.LoadCompanies();
            StaticData.LoadYears();
            return res.Status == Status.Success;
        }
    }
}