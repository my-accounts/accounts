/****** Object:  ForeignKey [FK_Accounts_Records_Accounts_Companies]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records] DROP CONSTRAINT [FK_Accounts_Records_Accounts_Companies]
GO
/****** Object:  ForeignKey [FK_Accounts_Records_Accounts_Subtypes]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_Subtypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records] DROP CONSTRAINT [FK_Accounts_Records_Accounts_Subtypes]
GO
/****** Object:  ForeignKey [FK_Accounts_Records_Accounts_UploadFiles]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_UploadFiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records] DROP CONSTRAINT [FK_Accounts_Records_Accounts_UploadFiles]
GO
/****** Object:  ForeignKey [FK_Accounts_Regex_Accounts_Subtypes]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Regex_Accounts_Subtypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Regex]'))
ALTER TABLE [dbo].[Accounts_Regex] DROP CONSTRAINT [FK_Accounts_Regex_Accounts_Subtypes]
GO
/****** Object:  ForeignKey [FK_Accounts_Subtypes_Accounts_Types]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Subtypes_Accounts_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Subtypes]'))
ALTER TABLE [dbo].[Accounts_Subtypes] DROP CONSTRAINT [FK_Accounts_Subtypes_Accounts_Types]
GO
/****** Object:  ForeignKey [FK_Accounts_UploadFiles_Accounts_Companies]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_UploadFiles_Accounts_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]'))
ALTER TABLE [dbo].[Accounts_UploadFiles] DROP CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Companies]
GO
/****** Object:  ForeignKey [FK_Accounts_UploadFiles_Accounts_Uploads]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_UploadFiles_Accounts_Uploads]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]'))
ALTER TABLE [dbo].[Accounts_UploadFiles] DROP CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Uploads]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_ChangeCompany]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_ChangeCompany]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_ChangeCompany]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Init]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Init]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_Init]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_InitTest]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_InitTest]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_InitTest]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordAdd]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordAdd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RecordAdd]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordDelete]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RecordDelete]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RecordGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompanyDel]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompanyDel]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_CompanyDel]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordUpdate]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RecordUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexAdd]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexAdd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RegexAdd]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexDelete]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RegexDelete]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RegexGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexUpdate]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RegexUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypeDelete]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypeDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_SubtypeDelete]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UploadFileDelete]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFileDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_UploadFileDelete]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypeDelete]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypeDelete]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_TypeDelete]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UploadsAdd]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadsAdd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_UploadsAdd]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_YearsGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_YearsGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_YearsGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UploadsGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadsGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_UploadsGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypesGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypesGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_SubtypesGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypeUpdate]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypeUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_SubtypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypeAdd]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypeAdd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_SubtypeAdd]
GO
/****** Object:  Table [dbo].[Accounts_Regex]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Regex]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_Regex]
GO
/****** Object:  Table [dbo].[Accounts_Records]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Records]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_Records]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordsGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordsGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RecordsGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompanyRename]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompanyRename]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_CompanyRename]
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_DetermineFinancialYear]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_DetermineFinancialYear]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Accounts_DetermineFinancialYear]
GO
/****** Object:  Table [dbo].[Accounts_Subtypes]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Subtypes]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_Subtypes]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompaniesGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompaniesGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_CompaniesGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompanyAdd]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompanyAdd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_CompanyAdd]
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_RecordsGetYearsCondition]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordsGetYearsCondition]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Accounts_RecordsGetYearsCondition]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypeAdd]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypeAdd]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_TypeAdd]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypesGet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypesGet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_TypesGet]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypeUpdate]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypeUpdate]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_TypeUpdate]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_YearStartDateSet]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_YearStartDateSet]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_YearStartDateSet]
GO
/****** Object:  Table [dbo].[Accounts_UploadFiles]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_UploadFiles]
GO
/****** Object:  Table [dbo].[Accounts_Uploads]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Uploads]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_Uploads]
GO
/****** Object:  Table [dbo].[Accounts_Types]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Types]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_Types]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SetConstraints]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SetConstraints]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_SetConstraints]
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_IncrementTextValue]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_IncrementTextValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Accounts_IncrementTextValue]
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_CSVToList]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CSVToList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[Accounts_CSVToList]
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordsGetById]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordsGetById]') AND type in (N'P', N'PC'))
DROP PROCEDURE [dbo].[Accounts_RecordsGetById]
GO
/****** Object:  Table [dbo].[Accounts_Codes]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Codes]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_Codes]
GO
/****** Object:  Table [dbo].[Accounts_Companies]    Script Date: 06/15/2013 23:14:56 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Companies]') AND type in (N'U'))
DROP TABLE [dbo].[Accounts_Companies]
GO
/****** Object:  Role [martin]    Script Date: 06/15/2013 23:14:56 ******/
DECLARE @RoleName sysname
set @RoleName = N'martin'
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = @RoleName AND type = 'R')
Begin
	DECLARE @RoleMemberName sysname
	DECLARE Member_Cursor CURSOR FOR
	select [name]
	from sys.database_principals 
	where principal_id in ( 
		select member_principal_id 
		from sys.database_role_members 
		where role_principal_id in (
			select principal_id
			FROM sys.database_principals where [name] = @RoleName  AND type = 'R' ))

	OPEN Member_Cursor;

	FETCH NEXT FROM Member_Cursor
	into @RoleMemberName

	WHILE @@FETCH_STATUS = 0
	BEGIN

		exec sp_droprolemember @rolename=@RoleName, @membername= @RoleMemberName

		FETCH NEXT FROM Member_Cursor
		into @RoleMemberName
	END;

	CLOSE Member_Cursor;
	DEALLOCATE Member_Cursor;
End
GO
IF  EXISTS (SELECT * FROM sys.database_principals WHERE name = N'martin' AND type = 'R')
DROP ROLE [martin]
GO
/****** Object:  Role [martin]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'martin')
BEGIN
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'martin' AND type = 'R')
CREATE ROLE [martin] AUTHORIZATION [dbo]

END
GO
/****** Object:  Table [dbo].[Accounts_Companies]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Companies]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_Companies](
	[CompanyId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[RegisteredNumber] [int] NOT NULL,
	[StartMonth] [int] NOT NULL,
	[StartDay] [int] NOT NULL,
 CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Accounts_Codes]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Codes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_Codes](
	[Code] [char](3) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[CodeName] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Codes] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordsGetById]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordsGetById]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RecordsGetById]

	@RecordIds VARCHAR(255)
	/*
		EXEC [Accounts_GetRecordsById] ''1,2,3''
	*/
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Sql NVARCHAR(MAX)
		SET @Sql = ''SELECT * FROM Accounts_Records WHERE RecordId IN ('' + @RecordIds + '')''
		
	EXEC sp_executeSql @Sql;
		
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_CSVToList]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CSVToList]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Accounts_CSVToList] 
(
	@CSV varchar(MAX),
	@Separator CHAR
)
RETURNS @Result TABLE (Value varchar(MAX))
AS
/*
	Usage: 
			SELECT * FROM CSVToList(''123|456|789'',''|'')
*/
BEGIN
	DECLARE @List TABLE (Value VARCHAR(MAX))

	DECLARE @Value VARCHAR(MAX), @Pos INT

	SET @CSV = LTRIM(RTRIM(@CSV))+ @Separator
	SET @Pos = CHARINDEX(@Separator, @CSV, 1)

	IF REPLACE(@CSV, @Separator, '''') <> ''''
	BEGIN
		WHILE @Pos > 0
		BEGIN

			SET @Value = LTRIM(RTRIM(LEFT(@CSV, @Pos - 1)))

			IF @Value <> ''''
				INSERT INTO @List (Value) VALUES (@Value)

			SET @CSV = RIGHT(@CSV, LEN(@CSV) - @Pos)
			SET @Pos = CHARINDEX(@Separator, @CSV, 1)
		END
	END

	INSERT @Result 
		SELECT Value FROM @List

	RETURN
END

' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_IncrementTextValue]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_IncrementTextValue]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Accounts_IncrementTextValue]
(
	@Value VARCHAR(50),
	@Amount INT
)
RETURNS VARCHAR(50)
AS
BEGIN
	RETURN (SELECT CAST( (CAST(@Value AS INT) + @Amount) AS VARCHAR))
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SetConstraints]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SetConstraints]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_SetConstraints]

	@Off BIT
/*
	Helps to determine contraint names:	
		
		SELECT * FROM sys.objects WHERE type_desc LIKE ''%CONSTRAINT'' and parent_object_id in (85575343, 853578079)
		SELECT * FROM sys.objects WHERE type_desc = ''USER_TABLE''
*/	
AS
BEGIN
	IF @Off = 1
	BEGIN
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Subtypes]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] DROP CONSTRAINT [FK_Accounts_Records_Accounts_Subtypes]
	
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_UploadFiles_Accounts_Uploads]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_UploadFiles]''))
		ALTER TABLE [dbo].[Accounts_UploadFiles] DROP CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Uploads]
		
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_UploadFiles_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_UploadFiles]''))
		ALTER TABLE [dbo].[Accounts_UploadFiles] DROP CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Companies]
		
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_UploadFiles]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] DROP CONSTRAINT [FK_Accounts_Records_Accounts_UploadFiles]
		
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] DROP CONSTRAINT [FK_Accounts_Records_Accounts_Companies]

		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Subtypes_Accounts_Types]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Subtypes]''))
		ALTER TABLE [dbo].[Accounts_Subtypes] DROP CONSTRAINT [FK_Accounts_Subtypes_Accounts_Types]

		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Regex_Accounts_Subtypes]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Regex]''))
		ALTER TABLE [dbo].[Accounts_Regex] DROP CONSTRAINT [FK_Accounts_Regex_Accounts_Subtypes]

		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Subtypes]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] DROP CONSTRAINT [FK_Accounts_Records_Accounts_Subtypes]
	END
	ELSE BEGIN
		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Records_Accounts_Companies] FOREIGN KEY([CompanyId])
		REFERENCES [dbo].[Accounts_Companies] ([CompanyId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] CHECK CONSTRAINT [FK_Accounts_Records_Accounts_Companies]	
	
		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_UploadFiles_Accounts_Uploads]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_UploadFiles]''))
		ALTER TABLE [dbo].[Accounts_UploadFiles]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Uploads] FOREIGN KEY([UploadId])
		REFERENCES [dbo].[Accounts_Uploads] ([UploadId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_UploadFiles_Accounts_Uploads]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_UploadFiles]''))
		ALTER TABLE [dbo].[Accounts_UploadFiles] CHECK CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Uploads]

			
		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_UploadFiles_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_UploadFiles]''))
		ALTER TABLE [dbo].[Accounts_UploadFiles]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Companies] FOREIGN KEY([CompanyId])
		REFERENCES [dbo].[Accounts_Companies] ([CompanyId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_UploadFiles_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_UploadFiles]''))
		ALTER TABLE [dbo].[Accounts_UploadFiles] CHECK CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Companies]


		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_UploadFiles]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Records_Accounts_UploadFiles] FOREIGN KEY([UploadFileId])
		REFERENCES [dbo].[Accounts_UploadFiles] ([UploadFileId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_UploadFiles]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] CHECK CONSTRAINT [FK_Accounts_Records_Accounts_UploadFiles]


		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Records_Accounts_Companies] FOREIGN KEY([CompanyId])
		REFERENCES [dbo].[Accounts_Companies] ([CompanyId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Companies]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] CHECK CONSTRAINT [FK_Accounts_Records_Accounts_Companies]


		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Subtypes_Accounts_Types]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Subtypes]''))
		ALTER TABLE [dbo].[Accounts_Subtypes]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Subtypes_Accounts_Types] FOREIGN KEY([TypeId])
		REFERENCES [dbo].[Accounts_Types] ([TypeId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Subtypes_Accounts_Types]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Subtypes]''))
		ALTER TABLE [dbo].[Accounts_Subtypes] CHECK CONSTRAINT [FK_Accounts_Subtypes_Accounts_Types]


		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Regex_Accounts_Subtypes]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Regex]''))
		ALTER TABLE [dbo].[Accounts_Regex]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Regex_Accounts_Subtypes] FOREIGN KEY([SubtypeId])
		REFERENCES [dbo].[Accounts_Subtypes] ([SubtypeId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Regex_Accounts_Subtypes]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Regex]''))
		ALTER TABLE [dbo].[Accounts_Regex] CHECK CONSTRAINT [FK_Accounts_Regex_Accounts_Subtypes]

		IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Subtypes]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Records_Accounts_Subtypes] FOREIGN KEY([SubtypeId])
		REFERENCES [dbo].[Accounts_Subtypes] ([SubtypeId])
		IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N''[dbo].[FK_Accounts_Records_Accounts_Subtypes]'') AND parent_object_id = OBJECT_ID(N''[dbo].[Accounts_Records]''))
		ALTER TABLE [dbo].[Accounts_Records] CHECK CONSTRAINT [FK_Accounts_Records_Accounts_Subtypes]
	END
END
' 
END
GO
/****** Object:  Table [dbo].[Accounts_Types]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Types]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_Types](
	[TypeId] [int] IDENTITY(0,1) NOT NULL,
	[Flow] [bit] NOT NULL,
	[Name] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Types] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Accounts_Uploads]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Uploads]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_Uploads](
	[UploadId] [int] IDENTITY(1,1) NOT NULL,
	[Performed] [datetime] NOT NULL,
 CONSTRAINT [PK_Accounts_Uploads] PRIMARY KEY CLUSTERED 
(
	[UploadId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Accounts_UploadFiles]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_UploadFiles](
	[UploadFileId] [int] IDENTITY(1,1) NOT NULL,
	[UploadId] [int] NOT NULL,
	[Filename] [nvarchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[CompanyId] [int] NOT NULL,
 CONSTRAINT [PK_Accounts_UploadFiles] PRIMARY KEY CLUSTERED 
(
	[UploadFileId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_YearStartDateSet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_YearStartDateSet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_YearStartDateSet]

	@StartMonth INT,
	@StartDay INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Accounts_Companies SET StartMonth = @StartMonth, StartDay = @StartDay;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypeUpdate]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypeUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_TypeUpdate]

	@TypeId INT,
	@Flow BIT,
	@Name NVARCHAR(50)	
AS
BEGIN
	SET NOCOUNT ON;

		-- First check if type is empty
		IF LEN(@Name) = 0
		BEGIN 
			RAISERROR(''Type name should not be empty'', 16, 1); RETURN;
		END	
	
		IF (SELECT COUNT(*) FROM Accounts_Types WHERE Name = @Name) = 0
		BEGIN
			UPDATE Accounts_Types
				SET Flow = @Flow, Name = @Name
					WHERE TypeId = @TypeId;
			RETURN;
		END
		
		RAISERROR(''Type with such a name already exists'', 16, 1);	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypesGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypesGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_TypesGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM Accounts_Types
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypeAdd]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypeAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_TypeAdd]

	@Flow BIT,
	@Name NVARCHAR(50),
	@Result INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

		-- First check if regex is empty
		IF LEN(@Name) = 0
		BEGIN 
			RAISERROR(''Type name should not be empty'', 16, 1); RETURN;
		END	
	
		IF (SELECT COUNT(*) FROM Accounts_Types WHERE Name = @Name) = 0
		BEGIN
			INSERT INTO Accounts_Types (Flow, Name) VALUES (@Flow, @Name);
				
			SET @Result = @@IDENTITY;
			RETURN;
		END
		
		RAISERROR(''Type with such a name already exists'', 16, 1);	
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_RecordsGetYearsCondition]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordsGetYearsCondition]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Accounts_RecordsGetYearsCondition]
(
	@YearsCSV VARCHAR(255)
)
RETURNS VARCHAR(MAX)
AS
BEGIN
	DECLARE @Result VARCHAR(MAX) SET @Result = ''''

	DECLARE @StartMonth INT SET @StartMonth = (SELECT TOP 1 StartMonth FROM Accounts_Companies)
	DECLARE @StartDay INT SET @StartDay = (SELECT TOP 1 StartDay FROM Accounts_Companies)
	DECLARE @StartDate VARCHAR(10) SET @StartDate = ''-'' + CAST(@StartMonth AS VARCHAR) + ''-'' + CAST(@StartDay AS VARCHAR) + ''''

	IF LEN (@YearsCSV) > 0
	BEGIN 
		SELECT @Result = @Result + '' (Date >= '''''' + Value + @StartDate + '''''' AND DATE < '''''' +  dbo.Accounts_IncrementTextValue(Value, 1) + @StartDate + '''''' ) OR'' 	FROM Accounts_CSVToList(@YearsCSV, '','')
		SET @Result = '' ('' + SUBSTRING(@result, 1, LEN(@result)-2) + '') AND ''
	END	
	
	RETURN @Result
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompanyAdd]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompanyAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_CompanyAdd]

	@CompanyName NVARCHAR(255),
	@Result INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	-- First check if name is empty
	IF LEN(@CompanyName) = 0
	BEGIN 
		RAISERROR(''Company name should not be empty'', 16, 1); RETURN;
	END

	IF (SELECT COUNT(*) FROM Accounts_Companies WHERE Name = @CompanyName) = 0
	BEGIN
		INSERT Accounts_Companies (Name, RegisteredNumber, [StartMonth],[StartDay])
			VALUES (@CompanyName, -1, 4, 6)
			
		SET @Result = @@IDENTITY;
		RETURN;
	END
	
	RAISERROR(''Company with such a name already exists'', 16, 1);
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompaniesGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompaniesGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_CompaniesGet]

AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Accounts_Companies
		
END
' 
END
GO
/****** Object:  Table [dbo].[Accounts_Subtypes]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Subtypes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_Subtypes](
	[SubtypeId] [int] IDENTITY(0,1) NOT NULL,
	[TypeId] [int] NOT NULL,
	[Name] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Subtypes] PRIMARY KEY CLUSTERED 
(
	[SubtypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  UserDefinedFunction [dbo].[Accounts_DetermineFinancialYear]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_DetermineFinancialYear]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[Accounts_DetermineFinancialYear]
(
	@Date DATETIME
)
RETURNS INT
AS
BEGIN
	DECLARE @StartMonth INT SET @StartMonth = (SELECT TOP 1 StartMonth FROm Accounts_Companies)
	DECLARE @StartDay INT SET @StartDay  = (SELECT TOP 1 StartDay FROm Accounts_Companies)

	RETURN CASE WHEN 
		@Date <  CAST(CAST(YEAR(@Date) AS VARCHAR(4)) + RIGHT(''0'' + CAST(@StartMonth AS VARCHAR(2)), 2) + RIGHT(''0'' + CAST(@StartDay AS VARCHAR(2)), 2) AS DATETIME)
			THEN YEAR(@Date)-1 ELSE YEAR(@Date) END
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompanyRename]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompanyRename]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_CompanyRename]

	@CompanyId INT,
	@CompanyName NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	-- First check if name is empty
	IF LEN(@CompanyName) = 0
	BEGIN 
		RAISERROR(''Company name should not be empty'', 16, 1); RETURN;
	END

	IF (SELECT COUNT(*) FROM Accounts_Companies WHERE Name = @CompanyName) = 0
	BEGIN
		UPDATE Accounts_Companies
			SET Name = @CompanyName
				WHERE CompanyId = @CompanyId;
		RETURN;
	END
	
	RAISERROR(''Company with such a name already exists'', 16, 1);
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordsGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordsGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RecordsGet]

	@CompanyIds VARCHAR(255) = '''',
	@SubtypeIds VARCHAR(255) = '''',
	@YearsCSV VARCHAR(255) = '''',
	@SortingColumn VARCHAR(50),
	@SortingDirection VARCHAR(4),
	@SearchFilter VARCHAR(50) = ''''
	/*
		EXEC [Accounts_RecordsGet] @CompanyIds = ''1,2'', @SubtypeIds=''1,2,3,4,5,6,7,8,9,10,27'', @YearsCSV=''2010,2011,2012'', @SortingColumn = ''date'', @SortingDirection =''desc'', @SearchFilter = ''Southern''
		EXEC [Accounts_RecordsGet] @YearsCSV = ''2011,2012'', @SortingColumn = ''date'', @SortingDirection =''desc''
		EXEC [Accounts_RecordsGet] @CompanyIds = ''1,2'', @SortingColumn = ''date'', @SortingDirection =''desc''
		EXEC [Accounts_RecordsGet] @SortingColumn = ''date'', @SortingDirection =''desc''
		EXEC [Accounts_RecordsGet] @SearchFilter = ''Southern'', @SortingColumn = ''date'', @SortingDirection =''desc''
	*/
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @Sql NVARCHAR(MAX)
	DECLARE @Cond NVARCHAR(MAX) SET @Cond = ''''
	
		SET @Sql = ''SELECT * FROM Accounts_Records ''
	
		IF LEN (@CompanyIds) > 0	 SET @Cond = '' CompanyId IN ('' + @CompanyIds + '') AND ''
		IF LEN (@SubtypeIds) > 0	 SET @Cond = @Cond + '' SubtypeId IN ('' + @SubtypeIds + '') AND ''
		IF LEN (@YearsCSV) > 0 SET @Cond = @Cond + dbo.Accounts_RecordsGetYearsCondition(@YearsCSV)
		IF LEN (@SearchFilter) > 0 SET @Cond = @Cond + '' Reference LIKE ''''%'' + @SearchFilter + ''%'''' AND ''
		
		IF LEN(@CompanyIds) > 0 OR LEN(@SubtypeIds) > 0 OR LEN(@YearsCSV) > 0 OR LEN(@SearchFilter) > 0
			SET @Cond = '' WHERE '' + SUBSTRING(@Cond, 0, LEN(@Cond)-3);
	
		SET @Sql = @Sql + COALESCE(@Cond, '''') + '' ORDER BY ['' + @SortingColumn + ''] '' + @SortingDirection;

		DECLARE @Table TABLE (
			[RecordId] INT, [CompanyId] INT, [Date] DATE, [Code] INT, [Reference] NVARCHAR(255),
			[Amount] MONEY, [SubtypeId] INT, [Comment] NVARCHAR(max), [UploadFileID] INT
		)

		INSERT @Table
			EXEC sp_executeSql @Sql;

		--SELECT @Sql

		DECLARE @Id INT SET @ID = (SELECT MAX(RecordId) FROM @Table) + 1
		DECLARE @Inc MONEY SET @Inc = (SELECT SUM(Amount) FROM @Table WHERE SubtypeId IN (SELECT SubtypeId FROM Accounts_Subtypes WHERE TypeId = 1))
		DECLARE @Dec MONEY SET @Dec = (SELECT SUM(Amount) FROM @Table WHERE SubtypeId NOT IN (SELECT SubtypeId FROM Accounts_Subtypes WHERE TypeId = 1))

		SELECT @Id AS RecordId, NULL AS CompanyId, NULL AS [Date], -1 AS Code, ''TOTAL'' AS Reference, COALESCE(@Dec, 0) AS Amount, COALESCE(@Inc, 0) AS SubtypeId, NULL AS Comment, NULL AS UploadFileID
		UNION ALL
		SELECT * FROM @Table
		
END
' 
END
GO
/****** Object:  Table [dbo].[Accounts_Records]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Records]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_Records](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Code] [int] NULL,
	[Reference] [nvarchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[Amount] [money] NOT NULL,
	[SubtypeId] [int] NOT NULL,
	[Comment] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
	[UploadFileId] [int] NOT NULL,
 CONSTRAINT [PK_Records] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[Accounts_Regex]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Regex]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accounts_Regex](
	[RegexId] [int] IDENTITY(1,1) NOT NULL,
	[SubtypeId] [int] NOT NULL,
	[Regex] [nvarchar](255) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK_Accounts_Regex] PRIMARY KEY CLUSTERED 
(
	[RegexId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypeAdd]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypeAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_SubtypeAdd]

	@TypeId INT,
	@Name NVARCHAR(50),
	@Result INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

		-- First check if regex is empty
		IF LEN(@Name) = 0
		BEGIN 
			RAISERROR(''Subtype name should not be empty'', 16, 1); RETURN;
		END	

		IF (SELECT COUNT(*) FROM Accounts_Subtypes WHERE Name = @Name AND TypeId = @TypeId) = 0
		BEGIN
			INSERT INTO Accounts_Subtypes (TypeId, Name) VALUES (@TypeId, @Name);
				
			SET @Result = @@IDENTITY;
			RETURN;
		END
		
		RAISERROR(''Subtype with such a name already exists'', 16, 1);		
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypeUpdate]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypeUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_SubtypeUpdate]

	@SubtypeId INT,
	@TypeId INT,
	@Name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

		-- First check if subtype is empty
		IF LEN(@Name) = 0
		BEGIN 
			RAISERROR(''Subtype name should not be empty'', 16, 1); RETURN;
		END	
	
		IF (SELECT COUNT(*) FROM Accounts_Subtypes WHERE Name = @Name AND TypeId = @TypeId) = 0
		BEGIN
			UPDATE Accounts_Subtypes
				SET TypeId = @TypeId, Name = @Name
					WHERE SubtypeId = @SubtypeId;
			RETURN;
		END
		
		RAISERROR(''Subtype with such a name already exists'', 16, 1);
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypesGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypesGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_SubtypesGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM Accounts_Subtypes
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UploadsGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadsGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_UploadsGet]
/*
	Usage:
			Accounts_UploadsGet
			Accounts_UploadsGet @UploadId=1
	
	Also:
			TRUNCATE TABLE Accounts_UploadFiles
			TRUNCATE TABLE Accounts_Uploads
*/
	@UploadId INT = NULL
AS
BEGIN

	IF @UploadId IS NULL
		SELECT Upl.UploadId, UploadFileId, [Filename], CompanyId, Performed
			FROM Accounts_Uploads AS Upl
				INNER JOIN Accounts_UploadFiles AS Upf
					ON Upl.UploadId = Upf.UploadId;
	ELSE
		SELECT Upl.UploadId, UploadFileId, [Filename], CompanyId, Performed
			FROM Accounts_Uploads AS Upl
				INNER JOIN Accounts_UploadFiles AS Upf
					ON Upl.UploadId = Upf.UploadId
						WHERE Upl.UploadId = @UploadId;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_YearsGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_YearsGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_YearsGet]
AS
BEGIN
	DECLARE @Years TABLE (Id INT, Name VARCHAR(50));
	INSERT @Years
		SELECT DISTINCT dbo.Accounts_DetermineFinancialYear([Date]) as Id, '''' as Name 
			FROM Accounts_Records
			
	SELECT Id, CAST(Id as VARCHAR(4)) + '' - '' + CAST((Id+1) as VARCHAR(4)) AS Name FROM @Years
END' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UploadsAdd]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadsAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_UploadsAdd]

	@CompanyId INT,
	@Filenames VARCHAR(MAX)
/*
	Usage:
			Accounts_UploadsAdd ''1'', ''file1.ext|file2.ext|file3.ext''
*/	
AS
BEGIN
	IF (SELECT COUNT(*) FROM Accounts_Companies WHERE CompanyId = @CompanyId) > 0
	BEGIN
		INSERT Accounts_Uploads (Performed) VALUES (GETDATE());
		DECLARE @UploadId INT SET @UploadId = @@IDENTITY;
		
		INSERT Accounts_UploadFiles
			SELECT @UploadId AS UploadId, Value AS [Filename], @CompanyId AS CompanyId FROM Accounts_CSVToList(@Filenames,''|'')
			
		EXEC Accounts_UploadsGet @UploadId = @UploadId;
			
		--SELECT * FROM Accounts_UploadFiles WHERE UploadId = @UploadId
	END			
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_TypeDelete]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_TypeDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_TypeDelete]
	
	@TypeId INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordsAmount INT 
		SET @RecordsAmount = (SELECT COUNT(*) FROM Accounts_Records WHERE SubtypeId IN (SELECT SubtypeId FROM Accounts_Subtypes WHERE TypeId = @TypeId));
	
	DECLARE @RegexAmount INT
		SET @RegexAmount = (SELECT COUNT(*) FROM Accounts_Regex WHERE SubtypeId IN (SELECT SubtypeId FROM Accounts_Subtypes WHERE TypeId = @TypeId));
	
	IF @RecordsAmount = 0 AND @RegexAmount = 0	
	BEGIN
		BEGIN TRAN
		
			DECLARE @ERRORNUM INT, @LOCALROWCOUNT INT, @RETURNVALUE INT, @ERRORMESSAGETXT NVARCHAR(MAX)

				-- Do all operations
				DELETE Accounts_Subtypes WHERE TypeId = @TypeId;
				DELETE Accounts_Types WHERE TypeId = @TypeId;
			
			
			SELECT @ERRORNUM = @@error, @LOCALROWCOUNT = @@ROWCOUNT
			IF (@ERRORNUM = 0 /*AND @LOCALROWCOUNT >= 1*/)
			BEGIN
				COMMIT TRAN
				SELECT @RETURNVALUE = 0
			END 
			ELSE 
				BEGIN
					ROLLBACK TRAN

						SELECT @ERRORMESSAGETXT = DESCRIPTION FROM [master].[dbo].[sysmessages] WHERE error = @@ERROR
						RAISERROR (''Error: '', 16, 1, @ERRORMESSAGETXT)

						SELECT @RETURNVALUE = 1
				END
			
			RETURN @RETURNVALUE;
	END ELSE
		RAISERROR(''Current type contain dependants'', 16, 1);
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_UploadFileDelete]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFileDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE  PROCEDURE [dbo].[Accounts_UploadFileDelete]

	@UploadFileId INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @UploadId INT SET @UploadId = (SELECT UploadId FROM Accounts_UploadFiles WHERE UploadFileId = @UploadFileId);
	
	DELETE Accounts_Records WHERE UploadFileId = @UploadFileId;
	DELETE Accounts_UploadFiles WHERE UploadFileId = @UploadFileId;
	
	IF (SELECT COUNT(*) FROM Accounts_UploadFiles WHERE UploadId = @UploadId) = 0
		DELETE Accounts_Uploads
			WHERE UploadId = @UploadId;
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_SubtypeDelete]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_SubtypeDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_SubtypeDelete]
	
	@SubtypeId INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @RecordsAmount INT 
		SET @RecordsAmount = (SELECT COUNT(*) FROM Accounts_Records WHERE SubtypeId = @SubtypeId);
		
	DECLARE @RegexAmount INT 
		SET @RegexAmount = (SELECT COUNT(*) FROM Accounts_Regex WHERE SubtypeId = @SubtypeId);
	
	IF @RecordsAmount = 0 AND @RegexAmount = 0
		DELETE Accounts_Subtypes 
			WHERE SubtypeId = @SubtypeId;
	ELSE
		RAISERROR(''Current subtype contain dependants'', 16, 1);
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexUpdate]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RegexUpdate]

	@RegexId INT,
	@SubtypeId INT,
	@Regex NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;
	
		-- First check if regex is empty
		IF LEN(@Regex) = 0
		BEGIN 
			RAISERROR(''Filter value should not be empty'', 16, 1); RETURN;
		END		
	
		-- Then do existance check, and not only
		IF ((SELECT COUNT(*) FROM Accounts_Regex WHERE Regex = @Regex) = 0) OR
		((SELECT SubtypeId FROM Accounts_Regex WHERE RegexId = @RegexId) <> @SubtypeId)
		BEGIN
			UPDATE Accounts_Regex
				SET SubtypeId = @SubtypeId, Regex = @Regex
					WHERE RegexId = @RegexId;
			RETURN;
		END
		
		RAISERROR(''Filter (regex) with such a name already exists'', 16, 1);	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RegexGet]
	
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT * FROM Accounts_Regex
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexDelete]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RegexDelete]
	
	@RegexId INT
AS
BEGIN
	SET NOCOUNT ON;
	
	DELETE Accounts_Regex WHERE RegexId = @RegexId;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RegexAdd]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RegexAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RegexAdd]

	@SubtypeId INT,
	@Regex NVARCHAR(255),
	@Result INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	
		-- First check if regex is empty
		IF LEN(@Regex) = 0
		BEGIN 
			RAISERROR(''Filter value should not be empty'', 16, 1); RETURN;
		END	
	
		-- Then check if this regex already exists
		IF (SELECT COUNT(*) FROM Accounts_Regex WHERE Regex = @Regex) = 0
		BEGIN
			INSERT INTO Accounts_Regex (SubtypeId, Regex) VALUES (@SubtypeID, @Regex);
				
			SET @Result = @@IDENTITY;
			RETURN;
		END
		
		RAISERROR(''Such a filter (regex) already exists'', 16, 1);	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordUpdate]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordUpdate]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RecordUpdate]

	@RecordId INT,
	@SubtypeId INT,
	@Comment VARCHAR(255),
	@Result int OUTPUT
AS
BEGIN
	SET NOCOUNT ON;
	
	UPDATE Accounts_Records 
		SET SubtypeId = @SubtypeId, Comment = @Comment
			WHERE RecordId = @RecordId

	SET @Result = @RecordId;
	
	
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_CompanyDel]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_CompanyDel]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_CompanyDel]

	@CompanyId INT
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @RecordsAmount INT 
		SET @RecordsAmount = (SELECT COUNT(*) FROM Accounts_Records WHERE CompanyId = @CompanyId);

	IF @RecordsAmount = 0
		DELETE Accounts_Companies WHERE CompanyId = @CompanyId;
	ELSE
		RAISERROR(''Cannot delete company as it has record'', 16, 1);
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordGet]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordGet]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RecordGet]

	@RecordId INT
	/*
		EXEC [Accounts_GetRecord] 353
	*/
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Accounts_Records WHERE RecordId = @RecordId;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordDelete]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordDelete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RecordDelete]

	@RecordId INT = 0,
	@Result int = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	IF @RecordId < 1
		TRUNCATE TABLE Accounts_Records
	ELSE
		DELETE Accounts_Records WHERE RecordId = @RecordId;

	SET @Result = @RecordId;
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_RecordAdd]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_RecordAdd]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_RecordAdd]

	@CompanyID INT,
	@Date DATETIME,
	@Code VARCHAR(3) = '''',
	@Reference NVARCHAR(255),
	@PaidIn MONEY = NULL,
	@PaidOut MONEY = NULL,
	@SubtypeId INT = 0,
	@UploadFileId INT,
	@Result INT OUTPUT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT * FROM Accounts_Codes

	-- Prevent from adding existing records
	IF (SELECT COUNT(*) FROM [dbo].[Accounts_Records] WHERE CompanyId = @CompanyID AND [Date] = @Date AND Reference = @Reference AND Amount = COALESCE(@PaidOut, @PaidIn)) > 0
	BEGIN
		SET @Result = 0;
		RETURN;
	END


	--DECLARE @SubtypeId INT
	IF @PaidIn IS NOT NULL AND @SubtypeId = 0
	BEGIN
		
		DECLARE @OtherIncomeSubtypeId INT 
			SET @OtherIncomeSubtypeId = (SELECT SubtypeId FROM Accounts_Subtypes WHERE TypeId IN (SELECT Typeid FROM Accounts_Types WHERE Flow = 1) AND Name like ''Other %'')

		SET @SubtypeId = COALESCE(@OtherIncomeSubtypeId, 0);
	END		
	--ELSE 
	--	SET @SubtypeId = 0

	--@SubtypeId > 0 AND 


	INSERT Accounts_Records (CompanyId, [Date], Code, Reference, Amount, SubtypeId, Comment, UploadFileId)
	VALUES (@CompanyID, @Date, @Code, @Reference, COALESCE(@PaidOut, @PaidIn), @SubtypeId, '''', @UploadFileId);

	SET @Result = @@IDENTITY
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_InitTest]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_InitTest]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_InitTest]
AS
BEGIN
	EXEC Accounts_SetConstraints @Off=1

	TRUNCATE TABLE Accounts_UploadFiles
	
	TRUNCATE TABLE Accounts_Uploads
	
	TRUNCATE TABLE dbo.Accounts_Companies
		INSERT Accounts_Companies (Name, RegisteredNumber, [StartMonth], [StartDay]) VALUES (N''First'', 5216446, 4, 6)
		INSERT Accounts_Companies (Name, RegisteredNumber, [StartMonth], [StartDay]) VALUES (N''Second'', 2069116, 4, 6)
		INSERT Accounts_Companies (Name, RegisteredNumber, [StartMonth], [StartDay]) VALUES (N''Third'', 7069116, 4, 6)
		
	
	TRUNCATE TABLE Accounts_Types
		SET IDENTITY_INSERT Accounts_Types ON
		INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (0, 0, N''-= Unknown =-'')
		INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (1, 1, N''Incomes'')
		INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (2, 0, N''Salary'')		
		INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (3, 0, N''Other'')
		SET IDENTITY_INSERT Accounts_Types OFF

	TRUNCATE TABLE Accounts_Subtypes
		SET IDENTITY_INSERT Accounts_Subtypes ON
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (0, 0, N''-= Unknown =-'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (1, 1, N''Gregory'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (2, 1, N''Other Income'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (3, 2, N''Director Salary'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (4, 2, N''Secretary Salary'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (5, 2, N''Expenses'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (6, 3, N''Shopping'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (7, 3, N''Service Charge'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (8, 3, N''Penalties'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (9, 3, N''Training'')
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (10,3, N''Other'')
		SET IDENTITY_INSERT [dbo].[Accounts_Subtypes] OFF

	TRUNCATE TABLE Accounts_Records
		SET IDENTITY_INSERT Accounts_Records ON
		
		INSERT Accounts_Uploads (Performed) VALUES (''2013-1-1'');
		INSERT Accounts_UploadFiles (UploadId, [Filename], CompanyId)	 VALUES (1, ''TestFile.csv'', 1)	
		
		INSERT Accounts_Records (RecordId, CompanyId, Date ,Code, Reference, Amount, SubtypeId, Comment, UploadFileId) VALUES (1, 1, ''2013-1-1'' , 0, ''JOHN SALARY'', 2000, 3, '''', 1)
		INSERT Accounts_Records (RecordId, CompanyId, Date ,Code, Reference, Amount, SubtypeId, Comment, UploadFileId) VALUES (2, 1, ''2013-1-1'' , 0, ''UNKNOWN TO TEST'', 10, 0, '''', 1)
		INSERT Accounts_Records (RecordId, CompanyId, Date ,Code, Reference, Amount, SubtypeId, Comment, UploadFileId) VALUES (3, 1, ''2013-1-1'' , 0, ''UNKNOWN TO TEST'', 15, 0, '''', 1)
		
		SET IDENTITY_INSERT Accounts_Records OFF
		
	TRUNCATE TABLE Accounts_Regex
		INSERT Accounts_Regex (SubtypeId, Regex) VALUES (10, N''^TEST'')

	EXEC Accounts_SetConstraints @Off=0
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_Init]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_Init]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_Init]
/*
	You need to run this procedure once after you have created the database and have applied install scripts against it.

	This script initially creates some required prerequisites - default types / subtypes.
	If being executed against exixsting database with aactual data - this proc will do factory reset.

	You may add additional settings you want to have alredy created after INIT. 
	So there''s no need to enter this data into the Settings page - they''ll already be there!
	It may be: 
				1)Company(ies) you operate;
				1)types; 
				2)subtypes in relation to types; 
				3)some filters/regexes known in advance

	There are my own settings commented, you may use them as a template for creating your own.
	Recommended, as it may save certaint time once you''d like to reinstall the product.
*/
AS
BEGIN
	EXEC Accounts_SetConstraints @Off=1

	TRUNCATE TABLE Accounts_Records
	
	TRUNCATE TABLE Accounts_UploadFiles
	
	TRUNCATE TABLE Accounts_Uploads

	TRUNCATE TABLE Accounts_Companies
		--INSERT Accounts_Companies (Name, RegisteredNumber, [StartMonth], [StartDay]) VALUES (N''First Mode'', 7216446, 4, 6)
		--INSERT Accounts_Companies (Name, RegisteredNumber, [StartMonth], [StartDay]) VALUES (N''Perfecta'', 8069116, 4, 6)

	
	TRUNCATE TABLE Accounts_Types
		SET IDENTITY_INSERT Accounts_Types ON
		INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (0, 0, N''-= Unknown =-'')
		INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (1, 1, N''Incomes'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (2, 0, N''Salary'')		
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (3, 0, N''Housing'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (4, 0, N''Transport'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (5, 0, N''Travel'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (6, 0, N''Invoices'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (7, 0, N''Purchases'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (8, 0, N''Banking'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (9, 0, N''Telecom'')
		--INSERT dbo.Accounts_Types (TypeId, Flow, Name) VALUES (10, 0, N''Other'')
		SET IDENTITY_INSERT Accounts_Types OFF

	TRUNCATE TABLE Accounts_Subtypes
		SET IDENTITY_INSERT Accounts_Subtypes ON
		INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (0, 0, N''-= Unknown =-'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (1, 1, N''Gregory'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (2, 1, N''Computer People'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (3, 1, N''Triad Generic'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (4, 1, N''McGregorBoyal'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (5, 1, N''Personal Loan In'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (6, 1, N''Other Income'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (7, 2, N''Martin Miles HSBC'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (8, 2, N''Alex Zolotarev'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (9, 2, N''Miles RBS'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (10, 2, N''Personal Loan Out'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (11, 3, N''11 Nicholas Lodge'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (12, 3, N''Council Tax'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (13, 4, N''Trains & Coaches'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (14, 4, N''Oyster TFL'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (15, 5, N''Aviation'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (16, 5, N''Rent a Car'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (17, 5, N''Fuel'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (18, 5, N''Hotels'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (19, 5, N''Visas'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (20, 5, N''Travel Insurance'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (21, 6, N''Software'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (22, 6, N''Individuals'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (23, 6, N''Legal Center'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (24, 6, N''Home Office'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (25, 7, N''Shopping'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (26, 8, N''Service Charge'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (27, 8, N''Commercial Card'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (32, 9, N''Mobile Phones'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (33, 9, N''BT'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (34, 9, N''Hosting'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (35, 9, N''Fitness'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (28, 10, N''HMRC Paye'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (29, 10, N''Service Fees'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (30, 10, N''Penalties'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (31, 10, N''Losses'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (36, 6, N''Training'')
		--INSERT Accounts_Subtypes (SubtypeId, TypeId, Name) VALUES (37, 5, N''Travel Other'')
		SET IDENTITY_INSERT [dbo].[Accounts_Subtypes] OFF
		
	TRUNCATE TABLE Accounts_Regex
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (13, N''SOUTHERN'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (9, N''RBS JOINT MILES PAYMENT'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''Amazon'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (5, N''PERSONAL INVEST'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (33, N''BT GROUP'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (4, N''GREGOR BOYAL'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (11, N''IPTV'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (18, N''HOTEL'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''EASYJET'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (7, N''MARTIN MILES SALARY'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (8, N''ZOLOTAREV'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (23, N''LEGAL CENTRE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''MAPLIN'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''RYANAIR'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (33, N''BT BILL PAYMENT'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (32, N''^O2'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (19, N''EMBASSY'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (13, N''FIRST CAPITAL CONN'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (13, N''NATIONAL EXPRESS'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (22, N''JOLANTA MEDNE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (22, N''PAWEL PIECHOWICZ'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (22, N''MR J F DIGBY'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (32, N''H3G'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (12, N''BRIGHTON & HOVE CC'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (34, N''WEB HOSTING'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''Belavia'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''AIRBALTIC'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (32, N''APR01'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''DIXONS ONLINE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''^APPLE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (30, N''CHARGE RECALL'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''WIZZ AIR'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''SCAN COMPUTERS'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''BROADBANDBUYER'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (19, N''US VISA'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''AGENTSTVO PEREVOZO'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''EUROSTAR'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (18, N''JC ROOMS'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (18, N''WORLD TRADE CENTER BARCELONA'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''SOLWISE LTD'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (16, N''EC VEHICLE RENTAL'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''Iceland Express'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (16, N''GEYSIRIS'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (19, N''VF SERVICES'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (23, N''LEGALCENTRE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (18, N''VIESBUTI'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (19, N''AUSTRALIAN TRAVEL'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (18, N''NOVOTEL'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (14, N''^TFL'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (4, N''HIGH DIRECTIONS'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''LOT AIRLINE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (1, N''Kazrex'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (2, N''ADECCO UK'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (1, N''REF MAX'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (35, N''FITNESS FIRST'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (3, N''TRIAD T/A GENERIC'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (15, N''SHOP "WWW.BE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (34, N''DYN.COM'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (26, N''TOTAL CHARGES TO'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (12, N''BRGH/HOVE/INTERNET HOVE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (25, N''GIGABYTE ELECTRON'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (32, N''^3-'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (27, N''COMMERCIAL CARD'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (14, N''LUL TICKET MACHINE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (29, N''COMPANIES HSE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (21, N''EVERNOTE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (36, N''CACTUSLANGUAGE'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (37, N''FLYGBUSSARNA'')
		--INSERT Accounts_Regex (SubtypeId, Regex) VALUES (37, N''METRO BARCELONA'')

	EXEC Accounts_SetConstraints @Off=0		
END
' 
END
GO
/****** Object:  StoredProcedure [dbo].[Accounts_ChangeCompany]    Script Date: 06/15/2013 23:14:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accounts_ChangeCompany]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Accounts_ChangeCompany]

	@UploadFileId INT,
	@CompanyId INT

AS
BEGIN
	SET NOCOUNT ON;

	UPDATE Accounts_Records SET CompanyId = @CompanyId
		WHERE UploadFileId = @UploadFileId;

	UPDATE Accounts_UploadFiles SET CompanyId = @CompanyId
		WHERE UploadFileId = @UploadFileId;		
END
' 
END
GO
/****** Object:  ForeignKey [FK_Accounts_Records_Accounts_Companies]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Records_Accounts_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Accounts_Companies] ([CompanyId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records] CHECK CONSTRAINT [FK_Accounts_Records_Accounts_Companies]
GO
/****** Object:  ForeignKey [FK_Accounts_Records_Accounts_Subtypes]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_Subtypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Records_Accounts_Subtypes] FOREIGN KEY([SubtypeId])
REFERENCES [dbo].[Accounts_Subtypes] ([SubtypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_Subtypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records] CHECK CONSTRAINT [FK_Accounts_Records_Accounts_Subtypes]
GO
/****** Object:  ForeignKey [FK_Accounts_Records_Accounts_UploadFiles]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_UploadFiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Records_Accounts_UploadFiles] FOREIGN KEY([UploadFileId])
REFERENCES [dbo].[Accounts_UploadFiles] ([UploadFileId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Records_Accounts_UploadFiles]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Records]'))
ALTER TABLE [dbo].[Accounts_Records] CHECK CONSTRAINT [FK_Accounts_Records_Accounts_UploadFiles]
GO
/****** Object:  ForeignKey [FK_Accounts_Regex_Accounts_Subtypes]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Regex_Accounts_Subtypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Regex]'))
ALTER TABLE [dbo].[Accounts_Regex]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Regex_Accounts_Subtypes] FOREIGN KEY([SubtypeId])
REFERENCES [dbo].[Accounts_Subtypes] ([SubtypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Regex_Accounts_Subtypes]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Regex]'))
ALTER TABLE [dbo].[Accounts_Regex] CHECK CONSTRAINT [FK_Accounts_Regex_Accounts_Subtypes]
GO
/****** Object:  ForeignKey [FK_Accounts_Subtypes_Accounts_Types]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Subtypes_Accounts_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Subtypes]'))
ALTER TABLE [dbo].[Accounts_Subtypes]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Subtypes_Accounts_Types] FOREIGN KEY([TypeId])
REFERENCES [dbo].[Accounts_Types] ([TypeId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_Subtypes_Accounts_Types]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_Subtypes]'))
ALTER TABLE [dbo].[Accounts_Subtypes] CHECK CONSTRAINT [FK_Accounts_Subtypes_Accounts_Types]
GO
/****** Object:  ForeignKey [FK_Accounts_UploadFiles_Accounts_Companies]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_UploadFiles_Accounts_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]'))
ALTER TABLE [dbo].[Accounts_UploadFiles]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Companies] FOREIGN KEY([CompanyId])
REFERENCES [dbo].[Accounts_Companies] ([CompanyId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_UploadFiles_Accounts_Companies]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]'))
ALTER TABLE [dbo].[Accounts_UploadFiles] CHECK CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Companies]
GO
/****** Object:  ForeignKey [FK_Accounts_UploadFiles_Accounts_Uploads]    Script Date: 06/15/2013 23:14:56 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_UploadFiles_Accounts_Uploads]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]'))
ALTER TABLE [dbo].[Accounts_UploadFiles]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Uploads] FOREIGN KEY([UploadId])
REFERENCES [dbo].[Accounts_Uploads] ([UploadId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Accounts_UploadFiles_Accounts_Uploads]') AND parent_object_id = OBJECT_ID(N'[dbo].[Accounts_UploadFiles]'))
ALTER TABLE [dbo].[Accounts_UploadFiles] CHECK CONSTRAINT [FK_Accounts_UploadFiles_Accounts_Uploads]
GO
