IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'TUTORIAL')
CREATE USER [TUTORIAL] FOR LOGIN [TUTORIAL] WITH DEFAULT_SCHEMA=[dbo]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[STORE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[STORE](
	[STOREID] [nvarchar](6) COLLATE Japanese_XJIS_100_CI_AS_SC NOT NULL,
	[STORE_NAME] [nvarchar](100) COLLATE Japanese_XJIS_100_CI_AS_SC NULL,
	[STORE_ADDRESS] [nvarchar](500) COLLATE Japanese_XJIS_100_CI_AS_SC NULL,
 CONSTRAINT [PK_STORE] PRIMARY KEY CLUSTERED 
(
	[STOREID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ORGANIZATION]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ORGANIZATION](
	[ORGANIZATIONID] [nvarchar](10) COLLATE Japanese_XJIS_100_CI_AS_SC NOT NULL,
	[ORGANIZATION_NAME] [nvarchar](80) COLLATE Japanese_XJIS_100_CI_AS_SC NULL,
 CONSTRAINT [PK_ORGANIZATION] PRIMARY KEY CLUSTERED 
(
	[ORGANIZATIONID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ORGANIZATION', N'COLUMN',N'ORGANIZATIONID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織ID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION', @level2type=N'COLUMN',@level2name=N'ORGANIZATIONID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ORGANIZATION', N'COLUMN',N'ORGANIZATION_NAME'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION', @level2type=N'COLUMN',@level2name=N'ORGANIZATION_NAME'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'ORGANIZATION', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'組織' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'ORGANIZATION'
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[EMPLOYEE](
	[EMPLOYEEID] [nvarchar](10) COLLATE Japanese_XJIS_100_CI_AS_SC NOT NULL,
	[LOGINID] [nvarchar](50) COLLATE Japanese_XJIS_100_CI_AS_SC NULL,
	[PASSWORD] [nvarchar](20) COLLATE Japanese_XJIS_100_CI_AS_SC NULL,
	[EMPLOYEE_NAME] [nvarchar](80) COLLATE Japanese_XJIS_100_CI_AS_SC NULL,
	[ORGANIZATIONID] [nvarchar](10) COLLATE Japanese_XJIS_100_CI_AS_SC NOT NULL,
 CONSTRAINT [PK_EMPLOYEE] PRIMARY KEY CLUSTERED 
(
	[EMPLOYEEID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EMPLOYEE', N'COLUMN',N'EMPLOYEEID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'社員コード' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMPLOYEE', @level2type=N'COLUMN',@level2name=N'EMPLOYEEID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EMPLOYEE', N'COLUMN',N'LOGINID'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ログインID' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMPLOYEE', @level2type=N'COLUMN',@level2name=N'LOGINID'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EMPLOYEE', N'COLUMN',N'PASSWORD'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'パスワード' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMPLOYEE', @level2type=N'COLUMN',@level2name=N'PASSWORD'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EMPLOYEE', N'COLUMN',N'EMPLOYEE_NAME'))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'氏名' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMPLOYEE', @level2type=N'COLUMN',@level2name=N'EMPLOYEE_NAME'
GO
IF NOT EXISTS (SELECT * FROM ::fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'EMPLOYEE', NULL,NULL))
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'社員' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'EMPLOYEE'
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_EMPLOYEE_ORGANIZATION]') AND parent_object_id = OBJECT_ID(N'[dbo].[EMPLOYEE]'))
ALTER TABLE [dbo].[EMPLOYEE]  WITH CHECK ADD  CONSTRAINT [FK_EMPLOYEE_ORGANIZATION] FOREIGN KEY([ORGANIZATIONID])
REFERENCES [dbo].[ORGANIZATION] ([ORGANIZATIONID])
GO
ALTER TABLE [dbo].[EMPLOYEE] CHECK CONSTRAINT [FK_EMPLOYEE_ORGANIZATION]
GO