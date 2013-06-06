using System.ComponentModel.DataAnnotations;
using Accounts.Models.ViewModels;
using Accounts.Models.ViewModels.Shared;

namespace Accounts.ViewModels.Shared
{
    public class SubtypeViewModel : BaseViewModel
    {
        public int SubtypeId { get; set; }

        public int TypeId { get; set; }

        [Required(ErrorMessage = "Please enter the name", AllowEmptyStrings = false)]
        [RegularExpression(@"^[a-zA-Z0-9 ]{1,50}$", ErrorMessage = "No special chars allowed")]
        public string Name { get; set; }

        // BaseViewModel implementation
        internal override int Id
        {
            get { return SubtypeId;  }
        }
    }
}