using Accounts.BLL;
using Accounts.ViewModels;
using Accounts.ViewModels.Shared;
using ORM;

namespace Accounts.Models.Entities
{
    public class RecordSubtype : BaseModel, IFieldsetItem, IFieldsetMultilevelItem
    {
        [Field("SubtypeId")]
        public int SubtypeId { get; set; }

       [Field("TypeId")]
        public int TypeId { get; set; }

       [Field("Name")]
       public string Name { get; set; }

       public int Id
       {
           get { return SubtypeId; }
       }
       public int ParentId
       {
           get { return TypeId; }
       }
       public override string ToString()
       {
           return Name;
       }

        public RecordSubtype()
        {
        }

        public RecordSubtype(SubtypeViewModel viewModel)
        {
            SubtypeId = viewModel.SubtypeId;
            TypeId = viewModel.TypeId;
            Name = viewModel.Name;
        }
    }
}