using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;

namespace Accounts.Models.ViewModels.Home
{
    public class RefreshDataParameters
    {
        public IEnumerable<int> Companies { get; set; }
        public IEnumerable<int> Subtypes { get; set; }
        public IEnumerable<int> Years { get; set; }
        public string SortingColumn { get; set; }
        public string SortingDirection { get; set; }
        public string SearchFilter { get; set; }

        public SqlParameter[] SqlParameters
        {
            get
            {
                var parameters = new List<SqlParameter>
                    {
                        new SqlParameter("@SortingColumn", SortingColumn),
                        new SqlParameter("@SortingDirection", SortingDirection),
                        new SqlParameter("@CompanyIds", Companies != null && Companies.Any() ? string.Join(",", Companies) : "-1"),
                        new SqlParameter("@SubtypeIds", Subtypes != null && Subtypes.Any() ? string.Join(",", Subtypes) : "-1"),
                        new SqlParameter("@YearsCSV", Years != null && Years.Any() ? string.Join(",", Years) : "1990")
                    };

                if (!string.IsNullOrEmpty(SearchFilter))
                {
                    parameters.Add(new SqlParameter("@SearchFilter", SearchFilter));
                }

                return parameters.ToArray();
            }
        }
    }
}