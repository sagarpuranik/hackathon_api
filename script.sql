USE [master]
GO
/****** Object:  Database [JDCTSDB]    Script Date: 29-04-2020 22:49:28 ******/
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
/****** Object:  Table [dbo].[AssociateBilingDetails]    Script Date: 29-04-2020 22:49:28 ******/
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
/****** Object:  Table [dbo].[MasterDataTable]    Script Date: 29-04-2020 22:49:28 ******/
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
	[Rate] [money] NULL,
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
/****** Object:  Table [dbo].[ProjectManagerDetails]    Script Date: 29-04-2020 22:49:29 ******/
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
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 1, 1)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 2, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 3, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 4, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 1, 5, 45)
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
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 16, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 17, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 4, 18, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 23, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 24, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 25, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 26, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 6, 27, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 5, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 6, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 7, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 8, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 2, 9, 45)
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
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 1, 44)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 2, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 1, 44)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 2, 30)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 3, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 4, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'416377', 1, 5, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 5, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 6, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 7, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 8, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 2, 9, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 18, 1)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 19, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 20, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 21, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 22, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'765311', 5, 23, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 4, 14, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 4, 15, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 4, 16, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 4, 17, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 4, 18, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 5, 18, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 5, 19, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 5, 20, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 5, 21, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 5, 22, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 5, 23, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 3, 10, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 3, 11, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 6, 23, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 6, 24, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 6, 25, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 6, 26, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 6, 27, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 10, 40, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 10, 41, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 10, 42, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 10, 43, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 10, 44, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 7, 27, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 7, 28, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 3, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 4, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 1, 5, 45)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 3, 12, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 3, 13, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 3, 14, 0)
GO
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 3, 10, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 3, 11, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 3, 12, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 3, 13, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 3, 14, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 4, 14, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 4, 15, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 4, 16, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 4, 17, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 4, 18, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 5, 18, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 5, 19, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 5, 20, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 5, 21, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 5, 22, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 5, 23, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 8, 31, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 8, 32, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 8, 33, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 8, 34, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 8, 35, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 8, 36, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 10, 40, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 10, 41, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 10, 42, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 10, 43, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 10, 44, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 7, 29, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 7, 30, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'789013', 7, 31, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 12, 49, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 12, 50, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 12, 51, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 12, 52, 0)
INSERT [dbo].[AssociateBilingDetails] ([AssociateID], [BillingMonth], [BillingWeek], [NumberHours]) VALUES (N'784319', 12, 53, 0)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'416377', N'Vishal Pathak', N'ee5pq19', N'Rashmi Chitriv', N'100', N'User', 100.0000, N'333', N'45', 1)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'765311', N'Rashi Nanwani', N'sw9l7rh', N'Prashant Prakash', N'100', N'User', 50.0000, N'34', N'500', 1)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'784319', N'Sagar Puranik', N'', N'Rashmi Chitriv', N'100', N'User', 100.0000, N'333', N'45', 1)
INSERT [dbo].[MasterDataTable] ([AssociateID], [AssociateName], [RacfID], [ProjectManager], [CostCentre], [UserRole], [Rate], [PoNo], [InvoiceNo], [AssociateStatus]) VALUES (N'789013', N'Prashant Prakash', N'', N'Rashmi Chitriv', N'450', N'PMOUser', 456.0000, N'333', N'848', 1)
INSERT [dbo].[ProjectManagerDetails] ([ID], [NAME], [CostCentre]) VALUES (N'789013', N'Prashant Prakash', N'Book 21')
INSERT [dbo].[ProjectManagerDetails] ([ID], [NAME], [CostCentre]) VALUES (N'176517', N'Rashmi Chitriv', N'Book 21')
ALTER TABLE [dbo].[AssociateBilingDetails]  WITH CHECK ADD FOREIGN KEY([AssociateID])
REFERENCES [dbo].[MasterDataTable] ([AssociateID])
GO
ALTER TABLE [dbo].[MasterDataTable]  WITH CHECK ADD FOREIGN KEY([ProjectManager])
REFERENCES [dbo].[ProjectManagerDetails] ([NAME])
GO
/****** Object:  StoredProcedure [dbo].[SP_FetchData]    Script Date: 29-04-2020 22:49:29 ******/
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
/****** Object:  StoredProcedure [dbo].[SP_InsertAssociateBilling]    Script Date: 29-04-2020 22:49:29 ******/
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
	if((select count(*) from MasterDataTable where AssociateID=@userid) = 1)
	begin
	if((Select count(*) from AssociateBilingDetails where BillingMonth=@month and AssociateID=@userid) = 0)
	begin
	while(@weekno < @newweekcnt)
	begin
	insert into [dbo].[AssociateBilingDetails]
           ([AssociateID]
           ,[BillingMonth]
           ,[BillingWeek]
           ,[NumberHours]) 
	values(@userid,@month,@weekno,0)
	set @weekno = @weekno +1
	end
	end
	end
	--select * from AssociateBilingDetails where AssociateID = @userid and BillingMonth = @month order by BillingWeek
	exec SP_PMOUserOrNot @userid,@month
END

GO
/****** Object:  StoredProcedure [dbo].[SP_PMOUserOrNot]    Script Date: 29-04-2020 22:49:29 ******/
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

	set @weekno = DATEPART(week,cast(YEAR(GETDATE()) AS varchar)+'/'+CAST(@month AS varchar)+'/01')
	select @usrRole = UserRole from MasterDataTable where AssociateId = @userid
	set @params ='@userid varchar(10),@month varchar(10)'
    -- Insert statements for procedure here
	--base dataset
	SET @QUERY = 'select mt.AssociateID,mt.AssociateName,mt.CostCentre,mt.InvoiceNo,mt.PoNo,mt.ProjectManager, mt.RacfID,mt.Rate,mt.UserRole,
	ct.BillingMonth,ct.['+CONVERT(VARCHAR,@weekno)+'] as Week1,ct.['+CONVERT(VARCHAR,@weekno + 1) +'] as Week2,ct.['+CONVERT(VARCHAR,@weekno + 2)+'] as Week3, ct.['+CONVERT(VARCHAR,@weekno + 3) +'] as Week4,ct.['+CONVERT(VARCHAR,@weekno + 4) +'] as Week5 
	from MasterDataTable mt inner join 

	--temporary result
	(Select * from 
	(Select AssociateID,BillingMonth,BillingWeek,NumberHours from AssociateBilingDetails where BillingMonth = '+@month+' and AssociateID IN
 
	(SELECT AssociateID from MasterDataTable WHERE AssociateID = '+@userid+'or ProjectManager in (Select name from ProjectManagerDetails where ID ='+@userid+')))t 
	
	--pivot operator
	PIVOT(sum(NumberHours)
	for BillingWeek IN ( ['+CONVERT(VARCHAR,@weekno)+'],['+CONVERT(VARCHAR,@weekno + 1) +'],['+CONVERT(VARCHAR,@weekno + 2)+'],['+CONVERT(VARCHAR,@weekno + 3) +'],['+CONVERT(VARCHAR,@weekno + 4) +']))as pvt)ct on mt.AssociateID = ct.AssociateID'

	exec sp_executesql @QUERY,@params,@userid='+@userid+',@month='+@month+'
	end


GO
/****** Object:  StoredProcedure [dbo].[SP_UpdateBilling]    Script Date: 29-04-2020 22:49:29 ******/
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
	@week5 int,
	@week6 int,
	@manager varchar(20),
	@cost varchar(10),
	@rate money,
	@pono varchar(10),
	@invoice varchar(10),
	@status bit
   
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @sql nvarchar (1000)
	--declare @table1 table(AssociateID int,BillingMonth int, week1 int, week2 int, week3 int, week4 int, week5 int) 
	Declare @weekno int 
	set @weekno = DATEPART(week,cast(YEAR(GETDATE()) AS varchar)+'/'+CAST(@month AS varchar)+'/01')
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
	update AssociateBilingDetails
	SET NumberHours = @week6 where [BillingWeek] = @weekno + 5 and [AssociateID] = @userid and [BillingMonth] = @month

	update MasterDataTable
	SET [ProjectManager] = @manager, [CostCentre] = @cost, [Rate] = @rate, [PoNo] = @pono, [InvoiceNo] = @invoice, [AssociateStatus] = @status
    where [AssociateID] = @userid
END
exec SP_PMOUserOrNot @userid, @month

GO
USE [master]
GO
ALTER DATABASE [JDCTSDB] SET  READ_WRITE 
GO
