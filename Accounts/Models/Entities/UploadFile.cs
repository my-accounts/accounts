using System;
using ORM;

namespace Accounts.Models.Entities
{
    public class UploadFile : BaseModel
    {
        [Field("UploadId")]
        public int UploadId { get; set; }

        [Field("UploadFileId")]
        public int UploadFileId { get; set; }

        [Field("Filename")]
        public string Filename { get; set; }

        [Field("CompanyId")]
        public int CompanyId { get; set; }

        [Field("Performed")]
        public DateTime Performed { get; set; }
    }
}