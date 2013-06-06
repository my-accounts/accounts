using Accounts.BLL;
using ORM;

namespace Accounts.Models.Entities
{
    public class Company : BaseModel, IFieldsetItem
    {
        [Field("CompanyId")]
        public int CompanyId { get; set; }

        [Field("Name")]
        public string Name { get; set; }

        [Field("StartMonth")]
        public int StartMonth { get; set; }

        [Field("StartDay")]
        public int StartDay { get; set; }
        
        public int Id
        {
            get { return CompanyId; }
        }
        public override string ToString()
        {
            return Name;
        }
    }
}