using System.ComponentModel.DataAnnotations;
using Accounts.Models.ViewModels.Shared;

namespace Accounts.Models.ViewModels.Home
{
    public class RegexViewModel : BaseViewModel
    {
        public int RegexId { get; set; }
        
        public int SubtypeId { get; set; }

        [StringLength(255, MinimumLength = 1)]
        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Name { get; set; }

        // BaseViewModel implementation
        internal override int Id
        {
            get { return RegexId; }
        }
    }
}