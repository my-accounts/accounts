using Accounts.BLL;
using Accounts.Models.ViewModels.Home;
using ORM;

namespace Accounts.Models.Entities
{
    public class RecordRegex : BaseModel, IFieldsetItem
    {
        [Field("RegexId")]
        public int RegexId { get; set; }

        [Field("SubtypeId")]
        public int SubtypeId { get; set; }

        [Field("Regex")]
        public string Name { get; set; }


        public int Id
        {
            get { return RegexId; }
        }
       
        public override string ToString()
        {
            return Name;
        }

        public RecordRegex()
        {
        }

        public RecordRegex(RegexViewModel viewModel)
        {
            RegexId = viewModel.RegexId;
            SubtypeId = viewModel.SubtypeId;
            Name = viewModel.Name;
        }
    }
}