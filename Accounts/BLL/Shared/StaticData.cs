using System.Collections.Generic;
using Accounts.Models.Entities;
using ORM;

namespace Accounts.BLL
{
    public class StaticData
    {
        public static IEnumerable<Company> Companies { get; private set; }
        public static IEnumerable<RecordType> RecordTypes { get; private set; }
        public static IEnumerable<RecordRegex> RecordRegex { get; private set; }
        public static IEnumerable<Year> Years { get; private set; }
        public static IEnumerable<RecordSubtype> RecordSubtypes { get; private set; }
        public static IEnumerable<YearStartDate> YearStartDates
        {
            get
            {
                return new List<YearStartDate>
                    {
                        new YearStartDate {Id = 1, Month = 1, Day = 1, Name = "1 January"},
                        new YearStartDate {Id = 2, Month = 4, Day = 6, Name = "6 April"},
                        new YearStartDate {Id = 3, Month = 5, Day = 1, Name = "1 May"}
                    };
            }
        } 

        public static void Init()
        {
            Companies = null;
            Years = null;
            RecordTypes = null;
            RecordSubtypes = null;
            RecordRegex = null;
        }
        public static void Load()
        {
            LoadCompanies();
            LoadYears();
            LoadTypes();
            LoadSubtypes();
            LoadRegex();
        }

        public static void LoadCompanies()
        {
            Companies = DataBase<Company>.GetModel<Company>(Settings.StoredProcedures.CompaniesGet).Values;
        }
        public static void LoadYears()
        {
            Years = DataBase<Year>.GetModel<Year>(Settings.StoredProcedures.YearsGet).Values;
        }
        public static void LoadTypes()
        {
            RecordTypes = DataBase<RecordType>.GetModel<RecordType>(Settings.StoredProcedures.TypesGet).Values;
        }
        public static void LoadSubtypes()
        {
            RecordSubtypes = DataBase<RecordSubtype>.GetModel<RecordSubtype>(Settings.StoredProcedures.SubtypesGet).Values;
        }
        public static void LoadRegex()
        {
            RecordRegex = DataBase<RecordRegex>.GetModel<RecordRegex>(Settings.StoredProcedures.RegexGet).Values;
        }
    }
}