using System;

namespace Accounts.Models.ViewModels.Shared
{
    /// <summary>
    /// Base Settings view model
    /// </summary>
    public class BaseViewModel
    {
        internal virtual int Id
        {
            get { throw new ApplicationException("Should be implemented in derived class"); }
        }
    }
}