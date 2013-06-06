using System;

namespace Accounts.Models.ViewModels.Home
{
    public class UploadItemViewModel
    {
        public int UploadId { get; set; }
        public DateTime Date { get; set; }
        public UploadFileViewModel[] Files { get; set; }
    }
}