using System.Collections.Generic;
using Accounts.Models.Entities;

namespace Accounts.Models.ViewModels.Settings
{
    public class TypesSubtypesViewModel
    {
        public IEnumerable<RecordType> Types { get; set; }
        public IEnumerable<RecordSubtype> Subtypes { get; set; }
    }
}