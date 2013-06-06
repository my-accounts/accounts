namespace Accounts.BLL
{
    public interface IFieldsetItem
    {
        int Id { get; }
        string Name { get; set; }
    }

    public interface IFieldsetMultilevelItem
    {
        int Id { get; }
        int ParentId { get; }
        string Name { get; set; }
    }
}