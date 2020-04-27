USE [master]
GO
/****** Object:  Database [JDCTSDB]    Script Date: 27-04-2020 17:20:23 ******/
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
/****** Object:  Table [dbo].[AssociateBilingDetails]    Script Date: 27-04-2020 17:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AssociateBilingDetails](
	[AssociateID] [varchar](10) NOT NULL,
	[BillingMonth] [int] NULL,
	[BillingWeek] [int] NULL,
	[NumberHours] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MasterDataTable]    Script Date: 27-04-2020 17:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MasterDataTable](
	[AssociateID] [varchar](10) NOT NULL,
	[AssociateName] [varchar](100) NOT NULL,
	[RacfID] [varchar](15) NOT NULL,
	[ProjectManager] [varchar](100) NULL,
	[CostCentre] [varchar](20) NULL,
	[UserRole] [varchar](20) NULL,
	[TotalHours] [int] NULL,
	[Rate] [money] NULL,
	[TotalAmount]  AS ([TotalHours]*[Rate]),
	[PoNo] [varchar](20) NULL,
	[InvoiceNo] [varchar](20) NULL,
	[AssociateStatus] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AssociateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectManagerDetails]    Script Date: 27-04-2020 17:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectManagerDetails](
	[ID] [varchar](10) NOT NULL,
	[NAME] [varchar](100) NOT NULL,
	[CostCentre] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[NAME] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 1, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 2, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 3, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 4, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 5, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 7, 27, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 7, 28, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 7, 29, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 7, 30, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 7, 31, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 8, 31, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 8, 32, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 8, 33, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 8, 34, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 8, 35, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 8, 36, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 9, 36, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 9, 37, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 9, 38, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 9, 39, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 9, 40, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 10, 40, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 10, 41, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 10, 42, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 10, 43, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 10, 44, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 14, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 15, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 16, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 17, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 18, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 23, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 24, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 25, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 26, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 27, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 5, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 6, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 7, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 8, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 9, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 1, 1, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 1, 2, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 1, 3, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 1, 4, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 1, 5, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 3, 10, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 3, 11, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 3, 12, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 3, 13, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 3, 14, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 1, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 2, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 1, 30)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 2, 30)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 3, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 4, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 5, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 5, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 6, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 7, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 8, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 9, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 18, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 19, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 20, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 21, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 22, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 23, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 3, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 4, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 5, 45)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [TotalHours], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'416377', N'Vishal Pathak', N'ee5pq19', N'Prashant Prakash', N'Book21', N'User', 45, 20.0000, N'54321', N'12345', 1)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [TotalHours], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'765311', N'Rashi Nanwani', N'sw9l7rh', N'Prashant Prakash', N'8383', N'User', 35, 34.0000, N'4848', N'64747', 1)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [TotalHours], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'784319', N'Sagar Puranik', N'', N'Prashant Prakash', N'Book21', N'User', 45, 20.0000, N'54321', N'12345', 1)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [TotalHours], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'789013', N'Prashant Prakash', N'', N'Rashmi Chitriv', N'Book21', N'PMOUser', 45, 20.0000, N'54321', N'12345', 1)
INSERT [dbo].[ProjectManagerDetails] ([ID], [NAME], [CostCentre]) VALUES (N'789013', N'Prashant Prakash', N'Book 21')
INSERT [dbo].[ProjectManagerDetails] ([ID], [NAME], [CostCentre]) VALUES (N'176517', N'Rashmi Chitriv', N'Book 21')
ALTER TABLE [dbo].[AssociateBilingDetails]  WITH CHECK ADD FOREIGN KEY([AssociateID])
REFERENCES [dbo].[MasterDataTable] ([AssociateID])
GO
ALTER TABLE [dbo].[MasterDataTable]  WITH CHECK ADD FOREIGN KEY([ProjectManager])
REFERENCES [dbo].[ProjectManagerDetails] ([NAME])
GO
/****** Object:  StoredProcedure [dbo].[SP_FetchData]    Script Date: 27-04-2020 17:20:23 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_InsertAssociateBilling]    Script Date: 27-04-2020 17:20:23 ******/
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
	DECLARE @mscount int
	DECLARE @count int
	DECLARE @monthno int
	DECLARE @weekno int
	DECLARE @wkcnt int
	Declare @firstday int
	Declare @lastday int
	Declare @weeks int
	DECLARE @newweekcnt int
	DECLARE @FirstWeekNo table(monthno int,strtweek int)

	set @mscount = 0
	set @count = 0
	set @monthno = 1
	
	while(@monthno<=12)
	begin
	set @weekno = DATEPART(week,'2020/'+CAST(@monthno AS varchar)+'/01')
	--print @weekno
	insert into @FirstWeekNo values(@monthno,@weekno)
	set @monthno=@monthno+1
	end
	--select * from @FirstWeekNo

	select @wkcnt = strtweek from @FirstWeekNo where monthno = @month
	--print @wkcnt
	set @firstday = DATEDIFF(DAY,-1,DATEADD(MONTH,((2020 -1900)*12)+@month-1, 0))/7
	--print @firstday
	set @lastday = DATEDIFF(DAY,-1,DATEADD(MONTH,((2020 -1900)*12)+@month-1, 30))/7
	--print @lastday
	set @weeks =@lastday-@firstday+1
	--print @weeks
	set @newweekcnt = @wkcnt + @weeks
	

    -- Insert statements for procedure here
	--Insert into @temp1 Select BillingWeek,NumberHours from AssociateBilingDetails where BillingMonth=2 and AssociateID=416377
	Select @mscount = count(*) where exists (select * from MasterDataTable where AssociateID=@userid)
	if(@mscount = 1)
	begin
	Select @count= count(*) where exists (select * from AssociateBilingDetails where BillingMonth=@month and AssociateID=@userid)
	if(@count = 0)
	begin
	while(@wkcnt < @newweekcnt)
	begin
	Insert into AssociateBilingDetails values(@userid,@month,@wkcnt,0)
	set @wkcnt = @wkcnt +1
	end
	end
	set @count =1
	end
	--select * from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month order by BillingWeek
	--if(@count =1)
	exec SP_PMOUserOrNot @userid,@month
END

GO
/****** Object:  StoredProcedure [dbo].[SP_PMOUserOrNot]    Script Date: 27-04-2020 17:20:23 ******/
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
	--exec SP_InsertAssociateBilling @userid,@month
	DECLARE @Weekwise table(ID int,monthno int, Week1 int,Week2 int, Week3 int,Week4 int,Week5 int)
	DEClARE @weekno int
	Declare @usrole varchar(10)
	DECLARE @data table(ID int)
	DECLARE @id int
	DECLARE @tabledata table(
	AssociateID varchar(10) NOT NULL,
	AssociateName varchar(100) NOT NULL,
	RacfID varchar(15) NOT NULL,
	ProjectManager varchar(100) NULL,
	CostCentre varchar(20) NULL,
	UserRole [varchar](20) NULL,
	MonthNo int,
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
	--exec SP_Weekwise @userid,@month

	set @weekno = DATEPART(week,'2020/'+CAST(@month AS varchar)+'/01')

    -- Insert statements for procedure here
	SELECT  @usrole=UserRole from [dbo].[MasterDataTable] where [AssociateID] = @userid

	IF (@usrole='User')
	begin
	Insert into @Weekwise Select 
	(Select  distinct AssociateID = @userid from AssociateBilingDetails),
	(Select distinct BillingMonth = @month from AssociateBilingDetails),  
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month and BillingWeek =@weekno),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month  and BillingWeek =@weekno + 1),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month  and BillingWeek =@weekno + 2),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month  and BillingWeek =@weekno + 3),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month and BillingWeek =@weekno + 4)

	Insert into @tabledata select md.[AssociateID],
	[AssociateName] ,
	[RacfID] ,
	[ProjectManager],
	[CostCentre],
	[UserRole],
	[monthno],
	[Week1],
	[Week2],
	[Week3],
	[Week4],
	[Week5],
	[Rate],
	[PoNo],
	[InvoiceNo],
	[AssociateStatus] from [dbo].[MasterDataTable] as md join @Weekwise as ab on md.AssociateID =@userid and monthno = @month
	select * from @tabledata
	end

	else 
	begin
	Insert into @data Select distinct AssociateID from AssociateBilingDetails
	--select * from @data
	
	while (Select count(*) from @data) > 0
	begin
	set @id = (select top 1 ID from @data )
	
	Insert into @Weekwise values(
	(Select AssociateID =  @id),
	(Select distinct BillingMonth = @month from AssociateBilingDetails),  
	(Select NumberHours from AssociateBilingDetails where AssociateID = @id and BillingMonth = @month and BillingWeek = @weekno),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @id and BillingMonth = @month  and BillingWeek = @weekno + 1),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @id and BillingMonth = @month  and BillingWeek = @weekno + 2),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @id and BillingMonth = @month  and BillingWeek = @weekno + 3),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @id and BillingMonth = @month and BillingWeek = @weekno + 4))

	insert into @tabledata
	select [AssociateID],
	[AssociateName] ,
	[RacfID] ,
	[ProjectManager],
	[CostCentre],
	[UserRole],
	(select [monthno] from @Weekwise where ID=@id),
	(select [Week1] from @Weekwise where ID=@id ),
	(select [Week2] from @Weekwise where ID=@id),
	(select [Week3] from @Weekwise where ID=@id),
	(select [Week4] from @Weekwise where ID=@id ),
	(select [Week5] from @Weekwise where ID=@id),
	[Rate],
	[PoNo],
	[InvoiceNo],
	[AssociateStatus]  from [dbo].[MasterDataTable] where AssociateID =@id
	delete from @data where ID = @id
	end
	--select * from @weekwise
	select * from @tabledata
	end
END
GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBilling]    Script Date: 27-04-2020 17:20:23 ******/
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
	@month int,
	@week1 int,
	@week2 int,
	@week3 int,
	@week4 int,
	@week5 int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @weekno int 
	set @weekno = DATEPART(week,'2020/'+CAST(@month AS varchar)+'/01')
    -- Insert statements for procedure here
	update AssociateBilingDetails
	SET NumberHours = @week1 where [BillingWeek] = @weekno and [AssociateID] = @userid and [BillingMonth] = @month
	update AssociateBilingDetails
	SET NumberHours = @week2 where [BillingWeek] = @weekno + 1 and [AssociateID] = @userid and [BillingMonth] = @month
	update AssociateBilingDetails
	SET NumberHours = @week3 where [BillingWeek] = @weekno + 2 and [AssociateID] = @userid and [BillingMonth] = @month
	update AssociateBilingDetails
	SET NumberHours = @week4 where [BillingWeek] = @weekno + 3 and [AssociateID] = @userid and [BillingMonth] = @month
	update AssociateBilingDetails
	SET NumberHours = @week5 where [BillingWeek] = @weekno + 4 and [AssociateID] = @userid and [BillingMonth] = @month
	
 --  case 
 --  WHEN BillingWeek = @weekno then  @week1
 --  WHEN BillingWeek = @weekno + 1 then  @week2
 --  WHEN BillingWeek = @weekno + 2 then  @week3
 --  WHEN BillingWeek = @weekno + 3 then  @week4
 --  WHEN BillingWeek = @weekno + 4 then  @week5
 --  END as [NumberHours]
 --  from AssociateBilingDetails
   
END
exec SP_PMOUserOrNot @userid, @month

GO
/****** Object:  StoredProcedure [dbo].[SP_Weekwise]    Script Date: 27-04-2020 17:20:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SP_Weekwise]
	-- Add the parameters for the stored procedure here
	@userid varchar(10),
	@month varchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @Weekwise table(ID int,month int, Week1 int,Week2 int, Week3 int,Week4 int,Week5 int)
	DEClARE @weekno int

	set @weekno = DATEPART(week,'2020/'+CAST(@month AS varchar)+'/01')

    -- Insert statements for procedure here
	Insert into @Weekwise Select 
	(Select  distinct AssociateID = @userid from AssociateBilingDetails),
	(Select distinct BillingMonth = @month from AssociateBilingDetails),  
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month and BillingWeek =@weekno),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month  and BillingWeek =@weekno + 1),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month  and BillingWeek =@weekno + 2),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month  and BillingWeek =@weekno + 3),
	(Select NumberHours from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month and BillingWeek =@weekno + 4)


	Select * from @Weekwise

	select md.[AssociateID],
	[AssociateName] ,
	[RacfID] ,
	[ProjectManager],
	[CostCentre],
	[Week1],
	[Week2],
	[Week3],
	[Week4],
	[Week5],
	[Rate],
	[PoNo],
	[InvoiceNo],
	[AssociateStatus]  from [dbo].[MasterDataTable] as md join @Weekwise as ab on Month = @month
END

GO
USE [master]
GO
ALTER DATABASE [JDCTSDB] SET  READ_WRITE 
GO
