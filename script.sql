USE [master]
GO
/****** Object:  Database [JDCTSDB]    Script Date: 2020-05-09 13:17:22 ******/
CREATE DATABASE [JDCTSDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JDCTSDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\JDCTSDB.mdf' , SIZE = 13312KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JDCTSDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\JDCTSDB_log.ldf' , SIZE = 164672KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JDCTSDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JDCTSDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JDCTSDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JDCTSDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JDCTSDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JDCTSDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JDCTSDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [JDCTSDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JDCTSDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JDCTSDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JDCTSDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JDCTSDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JDCTSDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JDCTSDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JDCTSDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JDCTSDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JDCTSDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JDCTSDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JDCTSDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JDCTSDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JDCTSDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JDCTSDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JDCTSDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JDCTSDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JDCTSDB] SET RECOVERY FULL 
GO
ALTER DATABASE [JDCTSDB] SET  MULTI_USER 
GO
ALTER DATABASE [JDCTSDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JDCTSDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JDCTSDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JDCTSDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [JDCTSDB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JDCTSDB', N'ON'
GO
USE [JDCTSDB]
GO
/****** Object:  Table [dbo].[AssociateDetails]    Script Date: 2020-05-09 13:17:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssociateDetails](
	[AssociateID] [varchar](10) NOT NULL,
	[AssociateName] [varchar](100) NOT NULL,
	[RacfID] [varchar](15) NOT NULL,
	[ProjectManager] [varchar](100) NULL,
	[CostCentre] [varchar](20) NULL,
	[UserRole] [varchar](20) NULL,
	[Rate] [money] NULL,
	[AssociateStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssociateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BillingDetails]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BillingDetails](
	[AssociateID] [varchar](10) NOT NULL,
	[BillingWeek] [varchar](10) NULL,
	[NumberHours] [int] NULL,
	[JD/CTS] [varchar](10) NULL,
	[TsImgPath] [varchar](40) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChargeMonthMaster]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChargeMonthMaster](
	[StartWeek#] [varchar](20) NULL,
	[EndWeek#] [varchar](20) NULL,
	[ChargeMonth] [varchar](20) NULL,
	[Year] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CTSBillingLog]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CTSBillingLog](
	[Userid] [varchar](10) NOT NULL,
	[UpdateTime] [varchar](20) NULL,
	[Filename] [varchar](40) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvoiceInfo]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvoiceInfo](
	[AssociateID] [varchar](10) NOT NULL,
	[ChargeMonth] [varchar](10) NULL,
	[Invoice No] [varchar](10) NULL,
	[PO No] [varchar](10) NULL,
	[InvFilePath] [varchar](40) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AssociateDetails] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [AssociateStatus]) VALUES (N'416377', N'Vishal Pathak', N'ee5pq19', N'Prashant Prakash', N'100', N'User', 100.0000, 1)
INSERT [dbo].[AssociateDetails] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [AssociateStatus]) VALUES (N'765311', N'Rashi Nanwani', N'sw9l7rh', N'Prashant Prakash', N'1000', N'User', 100.0000, 1)
INSERT [dbo].[AssociateDetails] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [AssociateStatus]) VALUES (N'784319', N'Sagar Puranik', N'', N'Prashant Prakash', N'100', N'User', 100.0000, 1)
INSERT [dbo].[AssociateDetails] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [AssociateStatus]) VALUES (N'789013', N'Prashant Prakash', N'', N'Rashmi Chitriv', N'450', N'PMOUser', 456.0000, 1)
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'765311', N'13', 45, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'765311', N'14', 45, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'765311', N'15', 45, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'765311', N'16', 45, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'765311', N'17', 45, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'765311', N'13', 45, N'CTS', N'')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'789013', N'13', 0, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'789013', N'14', 0, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'789013', N'15', 0, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'789013', N'16', 0, N'JD', N' ')
INSERT [dbo].[BillingDetails] ([AssociateID], [BillingWeek], [NumberHours], [JD/CTS], [TsImgPath]) VALUES (N'789013', N'17', 0, N'JD', N' ')
INSERT [dbo].[ChargeMonthMaster] ([StartWeek#], [EndWeek#], [ChargeMonth], [Year]) VALUES (N'2020/03/23', N'2020/04/30', N'Apr', N'2020')
/****** Object:  StoredProcedure [dbo].[SP_AssociateBilling]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_AssociateBilling] 
	-- Add the parameters for the stored procedure here
		-- Add the parameters for the stored procedure here
	@userid varchar(10),
	@monthname varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @strtdate varchar(20)
	declare @enddate varchar(20)
	declare @weekno int
	declare @weeks int
	DECLARE @newweekcnt int
	select @strtdate = StartWeek# from ChargeMonthMaster where ChargeMonth=@monthname
	select @enddate = EndWeek# from ChargeMonthMaster where ChargeMonth=@monthname
	select @weeks = DATEDIFF(WEEK,cast(@strtdate as date),cast(@enddate as date))
	print @weeks
	set @weekno = DATEPART(week,cast(@strtdate as date))
	print @weekno
	--SELECT StartWeek#,EndWeek# from ChargeMonthMaster where ChargeMonth=@monthname
	set @newweekcnt = @weeks + @weekno
	
	-- Insert statements for procedure here
	if((select count(*) from AssociateDetails where AssociateID=@userid) = 1)
	begin
	if((Select count(*) from BillingDetails where BillingWeek = @weekno and AssociateID=@userid) = 0)
	begin
	while(@weekno < @newweekcnt)
	begin
	insert into [dbo].[BillingDetails]
           ([AssociateID]
           ,[BillingWeek]
           ,[NumberHours]
		   ,[JD/CTS]
		   ,[TsImgPath])
	values(@userid,@weekno,0,'JD',' ')
	set @weekno = @weekno +1
	end
	end
	end
	--select * from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month order by BillingWeek
	exec SP_PMOOrNot @userid,@monthname
END

GO
/****** Object:  StoredProcedure [dbo].[SP_FetchData]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_FetchData]
as
BEGIN
SELECT MDT.AssociateID, MDT.AssociateName,MDT.RacfID,MDT.ProjectManager,MDT.CostCentre, 
MDT.PoNo,MDT.InvoiceNo,
MDT.AssociateStatus, MDT.TotalHours, 
ABD.NumberHours,ABD.BillingWeek, ABD.BillingMonth

FROM MasterDataTable MDT INNER JOIN AssociateBilingDetails ABD
ON MDT.AssociateID = ABD.AssociateID

END
GO
/****** Object:  StoredProcedure [dbo].[SP_InsertAssociateBilling]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_InsertAssociateBilling] 
	-- Add the parameters for the stored procedure here
		-- Add the parameters for the stored procedure here
	@userid varchar(10),
	@month varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @usrole varchar(10)
	DECLARE @monthno int
	DECLARE @weekno int
	Declare @firstday int
	Declare @lastday int
	Declare @weeks int
	DECLARE @newweekcnt int
	DECLARE @FirstWeekNo table(monthno int,strtweek int)

	set @weekno = DATEPART(week,cast(YEAR(GETDATE()) AS varchar)+'/'+CAST(@month AS varchar)+'/01')
	set @firstday = DATEDIFF(DAY,-1,DATEADD(MONTH,((cast(YEAR(GETDATE()) AS varchar) -1900)*12)+@month-1, 0))/7
	set @lastday = DATEDIFF(DAY,-1,DATEADD(MONTH,((cast(YEAR(GETDATE()) AS varchar) -1900)*12)+@month-1, 30))/7
	set @weeks =@lastday-@firstday+1
	set @newweekcnt = @weekno + @weeks
	
	-- Insert statements for procedure here
	if((select count(*) from AssociateDetails where AssociateID=@userid) = 1)
	begin
	if((Select count(*) from BillingDetails where BillingMonth=@month and AssociateID=@userid) = 0)
	begin
	while(@weekno < @newweekcnt)
	begin
	insert into [dbo].[BillingDetails]
           ([AssociateID]
           ,[BillingMonth]
           ,[BillingWeek]
           ,[NumberHours]
		   ,[JD/CTS]
		   ,[TsImgPath])
	values(@userid,@month,@weekno,0,'JD',' ')
	set @weekno = @weekno +1
	end
	end
	end
	--select * from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month order by BillingWeek
	--exec SP_PMOUserOrNot @userid,@month
END

GO
/****** Object:  StoredProcedure [dbo].[SP_PMOOrNot]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PMOOrNot]
	-- Add the parameters for the stored procedure here
	@userid varchar(10),
	@monthname varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DEClARE @weekno int
	Declare @usrRole varchar(20)
	DECLARE @QUERY nvarchar(1000)
	Declare @params nvarchar(100)
	declare @strtdate varchar(20)
	declare @enddate varchar(20)
	Declare @weeks int
	create table #tabledata(
	AssociateID varchar(10) NOT NULL,
	AssociateName varchar(100) NOT NULL,
	RacfID varchar(15) NOT NULL,
	ProjectManager varchar(100) NULL,
	CostCentre varchar(20) NULL,
	Rate money,
	UserRole [varchar](20) NULL,
	AssociateStatus bit,
	NoOfWeeks int,
	Week1 int,
	Week2 int,
	Week3 int,
	Week4 int,
	Week5 int,
	Week6 int
	)

	select @usrRole = UserRole from AssociateDetails where AssociateID = @userid
	set @params ='@userid varchar(10),@month varchar(10)'
	select @strtdate = StartWeek# from ChargeMonthMaster where ChargeMonth=@monthname
	select @enddate = EndWeek# from ChargeMonthMaster where ChargeMonth=@monthname
	select @weeks = DATEDIFF(WEEK,cast(@strtdate as date),cast(@enddate as date))
	--print @weeks
	set @weekno = DATEPART(week,cast(@strtdate as date))
    -- Insert statements for procedure here
	--base dataset
	if(@usrRole = 'User')
	begin
	SET @QUERY = 'Insert into #tabledata(
	AssociateID,
	AssociateName,
	RacfID,
	ProjectManager,
	CostCentre,
	Rate,
	UserRole,
	AssociateStatus,
	NoOfWeeks,
	Week1,
	Week2,
	Week3,
	Week4,
	Week5,
	Week6
	)select mt.AssociateID,mt.AssociateName,mt.RacfID,mt.ProjectManager,mt.CostCentre,mt.Rate,mt.UserRole,mt.AssociateStatus,
	'+CONVERT(VARCHAR,@weeks)+' as NoOfWeeks,ct.['+CONVERT(VARCHAR,@weekno)+'] as Week1,ct.['+CONVERT(VARCHAR,@weekno + 1) +'] as Week2,ct.['+CONVERT(VARCHAR,@weekno + 2)+'] as Week3, ct.['+CONVERT(VARCHAR,@weekno + 3) +'] as Week4,ct.['+CONVERT(VARCHAR,@weekno + 4) +'] as Week5,ct.['+CONVERT(VARCHAR,@weekno + 5) +'] as Week6 
	from AssociateDetails mt inner join 

	--temporary result
	(Select * from 
	(Select * from [dbo].[BillingDetails] where  AssociateID = '+@userid+' AND [JD/CTS]=''JD'')t
	
	--pivot operator
	PIVOT(sum(NumberHours)
	for BillingWeek IN ( ['+CONVERT(VARCHAR,@weekno)+'],['+CONVERT(VARCHAR,@weekno + 1) +'],['+CONVERT(VARCHAR,@weekno + 2)+'],['+CONVERT(VARCHAR,@weekno + 3) +'],['+CONVERT(VARCHAR,@weekno + 4) +'],['+CONVERT(VARCHAR,@weekno + 5) +']))as pvt)ct on mt.AssociateID = ct.AssociateID'
	end
	else if(@usrRole = 'PMOUser')
	begin
	SET @QUERY = '
	Insert into #tabledata(
	AssociateID,
	AssociateName,
	RacfID,
	ProjectManager,
	CostCentre,
	Rate,
	UserRole,
	AssociateStatus,
	NoOfWeeks,
	Week1,
	Week2,
	Week3,
	Week4,
	Week5,
	Week6
	)select mt.AssociateID,mt.AssociateName,mt.RacfID,mt.ProjectManager,mt.CostCentre,mt.Rate,mt.UserRole,mt.AssociateStatus,
	'+CONVERT(VARCHAR,@weeks)+' as NoOfWeeks,ct.['+CONVERT(VARCHAR,@weekno)+'] as Week1,ct.['+CONVERT(VARCHAR,@weekno + 1) +'] as Week2,ct.['+CONVERT(VARCHAR,@weekno + 2)+'] as Week3, ct.['+CONVERT(VARCHAR,@weekno + 3) +'] as Week4,ct.['+CONVERT(VARCHAR,@weekno + 4) +'] as Week5,ct.['+CONVERT(VARCHAR,@weekno + 5) +'] as Week6 
	from AssociateDetails mt inner join 

	--temporary result
	(Select * from 
	(Select * from [dbo].[BillingDetails] where [JD/CTS]=''JD'')t
	--pivot operator
	PIVOT(sum(NumberHours)
	for BillingWeek IN ( ['+CONVERT(VARCHAR,@weekno)+'],['+CONVERT(VARCHAR,@weekno + 1) +'],['+CONVERT(VARCHAR,@weekno + 2)+'],['+CONVERT(VARCHAR,@weekno + 3) +'],['+CONVERT(VARCHAR,@weekno + 4) +'],['+CONVERT(VARCHAR,@weekno + 5) +']))as pvt)ct on mt.AssociateID = ct.AssociateID'
	end
	--exec(@Query)
	exec sp_executesql @QUERY,@params,@userid='+@userid+',@month='+@month+'
	Select * from #tabledata
	end


	
	
	
	
	--and AssociateID IN
 
	--(SELECT AssociateID from MasterDataTable WHERE AssociateID = '+@userid+'or ProjectManager in (Select name from ProjectManagerDetails where ID ='+@userid+')))t 

GO
/****** Object:  StoredProcedure [dbo].[SP_PMOUserOrNot]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_PMOUserOrNot]
	-- Add the parameters for the stored procedure here
	@userid varchar(10),
	@month varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DEClARE @weekno int
	Declare @usrRole varchar(20)
	DECLARE @QUERY nvarchar(1000)
	Declare @params nvarchar(100)
	Declare @firstday int
	Declare @lastday int
	Declare @weeks int
	DECLARE @tabledata table(
	AssociateID varchar(10) NOT NULL,
	AssociateName varchar(100) NOT NULL,
	RacfID varchar(15) NOT NULL,
	ProjectManager varchar(100) NULL,
	CostCentre varchar(20) NULL,
	UserRole [varchar](20) NULL,
	NoOfWeeks int,
	Week1 int,
	Week2 int,
	Week3 int,
	Week4 int,
	Week5 int,
	Rate money NULL,
	PoNo varchar(20) NULL,
	InvoiceNo varchar(20) NULL,
	AssociateStatus bit NULL
	)

	set @weekno = DATEPART(week,cast(YEAR(GETDATE()) AS varchar)+'/'+CAST(@month AS varchar)+'/01')
	select @usrRole = UserRole from AssociateDetails where AssociateID = @userid
	set @params ='@userid varchar(10),@month varchar(10)'
	set @firstday = DATEDIFF(DAY,-1,DATEADD(MONTH,((cast(YEAR(GETDATE()) AS varchar) -1900)*12)+@month-1, 0))/7
	set @lastday = DATEDIFF(DAY,-1,DATEADD(MONTH,((cast(YEAR(GETDATE()) AS varchar) -1900)*12)+@month-1, 30))/7
	set @weeks =@lastday-@firstday+1
    -- Insert statements for procedure here
	--base dataset
	if(@usrRole = 'User')
	begin
	SET @QUERY = 'select mt.AssociateID,mt.AssociateName,mt.AssociateStatus,mt.CostCentre,mt.InvoiceNo,mt.PoNo,mt.ProjectManager, mt.RacfID,mt.Rate,mt.UserRole,
	'+CONVERT(VARCHAR,@weeks)+' as NoOfWeeks,ct.['+CONVERT(VARCHAR,@weekno)+'] as Week1,ct.['+CONVERT(VARCHAR,@weekno + 1) +'] as Week2,ct.['+CONVERT(VARCHAR,@weekno + 2)+'] as Week3, ct.['+CONVERT(VARCHAR,@weekno + 3) +'] as Week4,ct.['+CONVERT(VARCHAR,@weekno + 4) +'] as Week5,ct.['+CONVERT(VARCHAR,@weekno + 5) +'] as Week6 
	from MasterDataTable mt inner join 

	--temporary result
	(Select * from 
	(Select AssociateID,BillingWeek,NumberHours from AssociateBilingDetails where BillingMonth = '+@month+' and AssociateID = '+@userid+')t
	
	--pivot operator
	PIVOT(sum(NumberHours)
	for BillingWeek IN ( ['+CONVERT(VARCHAR,@weekno)+'],['+CONVERT(VARCHAR,@weekno + 1) +'],['+CONVERT(VARCHAR,@weekno + 2)+'],['+CONVERT(VARCHAR,@weekno + 3) +'],['+CONVERT(VARCHAR,@weekno + 4) +'],['+CONVERT(VARCHAR,@weekno + 5) +']))as pvt)ct on mt.AssociateID = ct.AssociateID'
	end
	else if(@usrRole = 'PMOUser')
	begin
	SET @QUERY = 'select mt.AssociateID,mt.AssociateName,mt.AssociateStatus,mt.CostCentre,mt.InvoiceNo,mt.PoNo,mt.ProjectManager, mt.RacfID,mt.Rate,mt.UserRole,
	'+CONVERT(VARCHAR,@weeks)+' as NoOfWeeks,ct.['+CONVERT(VARCHAR,@weekno)+'] as Week1,ct.['+CONVERT(VARCHAR,@weekno + 1) +'] as Week2,ct.['+CONVERT(VARCHAR,@weekno + 2)+'] as Week3, ct.['+CONVERT(VARCHAR,@weekno + 3) +'] as Week4,ct.['+CONVERT(VARCHAR,@weekno + 4) +'] as Week5,ct.['+CONVERT(VARCHAR,@weekno + 5) +'] as Week6 
	from MasterDataTable mt inner join 

	--temporary result
	(Select * from 
	(Select AssociateID,BillingWeek,NumberHours from AssociateBilingDetails where BillingMonth = '+@month+')t
	--pivot operator
	PIVOT(sum(NumberHours)
	for BillingWeek IN ( ['+CONVERT(VARCHAR,@weekno)+'],['+CONVERT(VARCHAR,@weekno + 1) +'],['+CONVERT(VARCHAR,@weekno + 2)+'],['+CONVERT(VARCHAR,@weekno + 3) +'],['+CONVERT(VARCHAR,@weekno + 4) +'],['+CONVERT(VARCHAR,@weekno + 5) +']))as pvt)ct on mt.AssociateID = ct.AssociateID'
	end
	exec sp_executesql @QUERY,@params,@userid='+@userid+',@month='+@month+'
	end


	
	
	
	
	--and AssociateID IN
 
	--(SELECT AssociateID from MasterDataTable WHERE AssociateID = '+@userid+'or ProjectManager in (Select name from ProjectManagerDetails where ID ='+@userid+')))t 

GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBilling]    Script Date: 2020-05-09 13:17:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_UpdateBilling]
	-- Add the parameters for the stored procedure here
	@userid int,
	@monthname varchar(20),
	@week1 int,
	@week2 int,
	@week3 int,
	@week4 int,
	@week5 int,
	@week6 int,
	@manager varchar(20),
	@cost varchar(10),
	@rate money,
	@status bit
   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @sql nvarchar (1000)
	--declare @table1 table(AssociateID int,BillingMonth int, week1 int, week2 int, week3 int, week4 int, week5 int) 
	Declare @weekno int
	Declare @strtdate varchar(20)
	select @strtdate = StartWeek# from ChargeMonthMaster where ChargeMonth=@monthname 
	set @weekno = DATEPART(week,cast(@strtdate as date))
    -- Insert statements for procedure here
	
	--Insert into @table1 
	--(AssociateID,BillingMonth, week1, week2, week3, week4, week5) 
	--values(@userid,@month,@week1,@week2,@week3,@week4,@week5)
	--set @sql='select AssociateID,BillingMonth,BillingWeek,NumberHours from @table1 
	--unpivot(
	--NumberHours for BillingWeek IN (['+CONVERT(VARCHAR,@weekno)+'],['+CONVERT(VARCHAR,@weekno + 1) +'],['+CONVERT(VARCHAR,@weekno + 2)+'],['+CONVERT(VARCHAR,@weekno + 3) +'],['+CONVERT(VARCHAR,@weekno + 4) +']))
	--) as ex where BillingMonth = '+CONVERT(VARCHAR,@month)+''

	--execute (@sql)
	--select * from @table1

	update BillingDetails
	SET NumberHours = @week1 where [BillingWeek] = @weekno and [AssociateID] = @userid and [JD/CTS] = 'JD'
	update BillingDetails
	SET NumberHours = @week2 where [BillingWeek] = @weekno + 1 and [AssociateID] = @userid and [JD/CTS] = 'JD'
	update BillingDetails
	SET NumberHours = @week3 where [BillingWeek] = @weekno + 2 and [AssociateID] = @userid and [JD/CTS] = 'JD'
	update BillingDetails
	SET NumberHours = @week4 where [BillingWeek] = @weekno + 3 and [AssociateID] = @userid and [JD/CTS] = 'JD'
	update BillingDetails
	SET NumberHours = @week5 where [BillingWeek] = @weekno + 4 and [AssociateID] = @userid and [JD/CTS] = 'JD'
	update BillingDetails
	SET NumberHours = @week6 where [BillingWeek] = @weekno + 5 and [AssociateID] = @userid and [JD/CTS] = 'JD'

	update AssociateDetails
	SET [ProjectManager] = @manager, [CostCentre] = @cost, [Rate] = @rate,[AssociateStatus] = @status
    where [AssociateID] = @userid
END
--exec SP_PMOUserOrNot @userid, @month

GO
USE [master]
GO
ALTER DATABASE [JDCTSDB] SET  READ_WRITE 
GO
