using System.Collections.Generic;
using Accounts.Models.Entities;

namespace Accounts.Models.ViewModels.Settings
{
    public class GeneralSettingsViewModel
    {
        public IEnumerable<Company> Companies { get; set; }
        public IEnumerable<YearStartDate> YearStartDates { get; set; }
        public int SelectedYearStartDate { get; set; }
    }
}