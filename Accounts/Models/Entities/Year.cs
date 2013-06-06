using Accounts.BLL;
using ORM;

namespace Accounts.Models.Entities
{
    public class Year : BaseModel, IFieldsetItem
    {
        [Field("Id")]
        public int Id { get; set; }

        [Field("Name")]
        public string Name { get; set; }

        public override string ToString()
        {
            return Name;
        }
    }
}