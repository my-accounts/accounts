using System.ComponentModel.DataAnnotations;

namespace Accounts.Models.ViewModels.Shared
{
    public class RecordViewModel
    {
        public int RecordId { get; set; }
        
        public int TypeId { get; set; }
        
        public int SubtypeId { get; set; }

        [DisplayFormat(ConvertEmptyStringToNull = false)]
        public string Comment { get; set; }
    }
}