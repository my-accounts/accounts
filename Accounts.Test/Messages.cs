namespace Accounts.Test
{
    public static class Messages
    {
        public static class Settings
        {
            public const string ShouldBeNull = "Should be null";
            public const string ShouldNotBeNull = "Should NOT be null";
            public const string ShouldNotBeEmpty = "Collection should contain items";

            public const string ShouldContainViewModel = "Should contain view model";

            public const string ShouldBeTrueWhenSuccess = "Should be true when successful";
            public const string ShouldBeFalseWhenErrorOccured = "Should be false when error occured";

            public const string ShouldExist = "Should exist";
            public const string ShouldNotExist = "Should not exist with such a name";
            public const string ShouldExistForDuplicateTest = "Should already exist to perform duplicate values test";

            public const string ShouldBeChanged = "Should be changed";
            public const string ShouldNotBeChanged = "Should NOT be changed";

            public const string ShouldBe4 = "Should be 4 by default";
            public const string ShouldBe6 = "Should be 6 by default";

            public const string ShouldBeOfTypeProcedureIdentityResult = "Should be of type ProcedureIdentityResult when insert failed";
            public const string ShouldBeZeroWhenInsertFailed = "Should be 0 when insert failed";
            public const string ShouldReturnErrorMessage = "Should return an error message";

            public const string CountShouldBeOneMore = "Count should become one more after ation complete";
            public const string ShouldRemainSameAmount = "Should remain the same amount";
            public const string CountShouldBeOneLess = "Count should become one less after ation complete";

            public const string ShouldBePartialView = "When everything is OK we return PartialViewResult";
            public const string ShouldBeJson = "When error occures we return JsonViewResult";
            public const string ShouldBeRedirect = "Should return RedirectResult";
        }
    }
}
