using Accounts.BLL;

namespace Accounts.Models.Entities
{
    public class YearStartDate : IFieldsetItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int Month { get; set; }
        public int Day { get; set; }
    }
}