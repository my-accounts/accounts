using Accounts.BLL;
using Accounts.ViewModels;
using Accounts.ViewModels.Shared;
using ORM;

namespace Accounts.Models.Entities
{
    public class RecordType: BaseModel, IFieldsetItem
    {
        [Field("TypeId")]
        public int TypeId { get; set; }

        [Field("Flow")]
        public bool Flow { get; set; }

        [Field("Name")]
        public string Name { get; set; }

        public int Id
        {
            get { return TypeId; }
        }
        public override string ToString()
        {
            return Name;
        }

        public RecordType()
        {
        }

        public RecordType(TypeViewModel viewModel)
        {
            TypeId = viewModel.TypeId;
            Flow = viewModel.Flow;
            Name = viewModel.Name;
        }
    }
}