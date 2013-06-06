using System;
using System.Collections.Generic;
using System.Linq;
using Accounts.BLL;
using ORM;

namespace Accounts.Models.Entities
{
    public class Record : BaseModel
    {
        [Field("RecordId")]
        public int RecordId { get; set; }

        [Field("CompanyId")]
        public int CompanyId { get; set; }

        [Field("Date")]
        public DateTime Date { get; set; }

        [Field("Reference")]
        public string Reference { get; set; }

        [Field("Amount")]
        public decimal Amount  { get; set; }
        
        [Field("SubtypeId")]
        public int SubtypeId { get; set; }

        [Field("Comment")]
        public string Comment { get; set; }

        public string Attachment { get; set; }

        [Field("UploadFileId")]
        public string UploadFileId { get; set; }

        public bool IsIncome
        {
            get
            {
                IEnumerable<int> outTypes = StaticData.RecordTypes.Where(i => i.Flow).Select(i => i.TypeId);
                IEnumerable<int> outSubtypes = StaticData.RecordSubtypes.Where(i => outTypes.Contains(i.TypeId)).Select(i => i.SubtypeId);
                return outSubtypes.Contains(SubtypeId);
            }
        }
        
        public override string ToString()
        {
            return string.Format("{0} - {1} - {2}", Date.ToShortDateString(), Amount, Reference);
        }
    }
}