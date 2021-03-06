/****** Object:  ForeignKey [fk_RoleId]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] DROP CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] DROP CONSTRAINT [fk_UserId]
GO
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]') AND type in (N'U'))
DROP TABLE [dbo].[webpages_UsersInRoles]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND type in (N'U'))
DROP TABLE [dbo].[UserProfile]
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Membership]') AND type in (N'U'))
DROP TABLE [dbo].[webpages_Membership]
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_OAuthMembership]') AND type in (N'U'))
DROP TABLE [dbo].[webpages_OAuthMembership]
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Roles]') AND type in (N'U'))
DROP TABLE [dbo].[webpages_Roles]
GO
/****** Object:  Default [DF__webpages___IsCon__08EA5793]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__webpages___IsCon__08EA5793]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_Membership]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__webpages___IsCon__08EA5793]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] DROP CONSTRAINT [DF__webpages___IsCon__08EA5793]
END


End
GO
/****** Object:  Default [DF__webpages___Passw__09DE7BCC]    Script Date: 06/16/2013 01:03:23 ******/
IF  EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__webpages___Passw__09DE7BCC]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_Membership]'))
Begin
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__webpages___Passw__09DE7BCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] DROP CONSTRAINT [DF__webpages___Passw__09DE7BCC]
END


End
GO
/****** Object:  Table [dbo].[webpages_Roles]    Script Date: 06/16/2013 01:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Roles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) COLLATE Cyrillic_General_CI_AS NOT NULL,
 CONSTRAINT [PK__webpages__8AFACE1A0CBAE877] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON),
 CONSTRAINT [UQ__webpages__8A2B61600F975522] UNIQUE NONCLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[webpages_OAuthMembership]    Script Date: 06/16/2013 01:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_OAuthMembership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_OAuthMembership](
	[Provider] [nvarchar](30) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[ProviderUserId] [nvarchar](100) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK__webpages__F53FC0ED03317E3D] PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Table [dbo].[webpages_Membership]    Script Date: 06/16/2013 01:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_Membership]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_Membership](
	[UserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) COLLATE Cyrillic_General_CI_AS NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) COLLATE Cyrillic_General_CI_AS NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
 CONSTRAINT [PK__webpages__1788CC4C07020F21] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
INSERT [dbo].[webpages_Membership] ([UserId], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (1, CAST(0x0000A1DF000011DD AS DateTime), NULL, 1, NULL, 0, N'AIRGnvYs92tgrKoNr2YHUfcOqbTnWNYX383sEcT/qn1OABZnMba2XG/dMzhP8e19sw==', CAST(0x0000A1DF000011DD AS DateTime), N'', NULL, NULL)
/****** Object:  Table [dbo].[UserProfile]    Script Date: 06/16/2013 01:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserProfile]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) COLLATE Cyrillic_General_CI_AS NULL,
 CONSTRAINT [PK__UserProf__1788CC4C7F60ED59] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON
INSERT [dbo].[UserProfile] ([UserId], [UserName]) VALUES (1, N'user')
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
/****** Object:  Table [dbo].[webpages_UsersInRoles]    Script Date: 06/16/2013 01:03:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[webpages_UsersInRoles](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK__webpages__AF2760AD1367E606] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON)
)
END
GO
/****** Object:  Default [DF__webpages___IsCon__08EA5793]    Script Date: 06/16/2013 01:03:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__webpages___IsCon__08EA5793]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_Membership]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__webpages___IsCon__08EA5793]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] ADD  CONSTRAINT [DF__webpages___IsCon__08EA5793]  DEFAULT ((0)) FOR [IsConfirmed]
END


End
GO
/****** Object:  Default [DF__webpages___Passw__09DE7BCC]    Script Date: 06/16/2013 01:03:23 ******/
IF Not EXISTS (SELECT * FROM sys.default_constraints WHERE object_id = OBJECT_ID(N'[dbo].[DF__webpages___Passw__09DE7BCC]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_Membership]'))
Begin
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF__webpages___Passw__09DE7BCC]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[webpages_Membership] ADD  CONSTRAINT [DF__webpages___Passw__09DE7BCC]  DEFAULT ((0)) FOR [PasswordFailuresSinceLastSuccess]
END


End
GO
/****** Object:  ForeignKey [fk_RoleId]    Script Date: 06/16/2013 01:03:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[webpages_Roles] ([RoleId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_RoleId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_RoleId]
GO
/****** Object:  ForeignKey [fk_UserId]    Script Date: 06/16/2013 01:03:23 ******/
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles]  WITH CHECK ADD  CONSTRAINT [fk_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[UserProfile] ([UserId])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[fk_UserId]') AND parent_object_id = OBJECT_ID(N'[dbo].[webpages_UsersInRoles]'))
ALTER TABLE [dbo].[webpages_UsersInRoles] CHECK CONSTRAINT [fk_UserId]
GO
