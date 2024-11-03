USE [master]
GO
/****** Object:  Database [prj2_ngohoangminh]    Script Date: 11/3/2024 9:52:39 PM ******/
CREATE DATABASE [prj2_ngohoangminh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'prj2_ngohoangminh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\prj2_ngohoangminh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'prj2_ngohoangminh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\prj2_ngohoangminh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [prj2_ngohoangminh] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [prj2_ngohoangminh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [prj2_ngohoangminh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET ARITHABORT OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [prj2_ngohoangminh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [prj2_ngohoangminh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET  ENABLE_BROKER 
GO
ALTER DATABASE [prj2_ngohoangminh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [prj2_ngohoangminh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET RECOVERY FULL 
GO
ALTER DATABASE [prj2_ngohoangminh] SET  MULTI_USER 
GO
ALTER DATABASE [prj2_ngohoangminh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [prj2_ngohoangminh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [prj2_ngohoangminh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [prj2_ngohoangminh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [prj2_ngohoangminh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [prj2_ngohoangminh] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'prj2_ngohoangminh', N'ON'
GO
ALTER DATABASE [prj2_ngohoangminh] SET QUERY_STORE = ON
GO
ALTER DATABASE [prj2_ngohoangminh] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [prj2_ngohoangminh]
GO
/****** Object:  Table [dbo].[chi_tiet_don_hang]    Script Date: 11/3/2024 9:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chi_tiet_don_hang](
	[ctdh_id] [int] IDENTITY(1,1) NOT NULL,
	[dh_id] [int] NULL,
	[sk_id] [int] NULL,
	[soluong] [int] NOT NULL,
	[thanh_tien] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ctdh_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[don_hang]    Script Date: 11/3/2024 9:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[don_hang](
	[dh_id] [int] IDENTITY(1,1) NOT NULL,
	[kh_id] [int] NULL,
	[ngaylap] [date] NULL,
	[tongtien] [decimal](10, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[dh_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[khach_hang]    Script Date: 11/3/2024 9:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[khach_hang](
	[kh_id] [int] IDENTITY(1,1) NOT NULL,
	[ten] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NULL,
	[sodienthoai] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[kh_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[skin]    Script Date: 11/3/2024 9:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[skin](
	[sk_id] [int] IDENTITY(1,1) NOT NULL,
	[tenskin] [nvarchar](100) NOT NULL,
	[mota] [nvarchar](500) NULL,
	[gia] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[sk_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[thanh_toan]    Script Date: 11/3/2024 9:52:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[thanh_toan](
	[tt_id] [int] IDENTITY(1,1) NOT NULL,
	[dh_id] [int] NULL,
	[ngaythanhtoan] [date] NULL,
	[sotienthanhtoan] [decimal](10, 2) NOT NULL,
	[trangthai] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[tt_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[don_hang] ADD  DEFAULT (getdate()) FOR [ngaylap]
GO
ALTER TABLE [dbo].[thanh_toan] ADD  DEFAULT (getdate()) FOR [ngaythanhtoan]
GO
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD FOREIGN KEY([dh_id])
REFERENCES [dbo].[don_hang] ([dh_id])
GO
ALTER TABLE [dbo].[chi_tiet_don_hang]  WITH CHECK ADD FOREIGN KEY([sk_id])
REFERENCES [dbo].[skin] ([sk_id])
GO
ALTER TABLE [dbo].[don_hang]  WITH CHECK ADD FOREIGN KEY([kh_id])
REFERENCES [dbo].[khach_hang] ([kh_id])
GO
ALTER TABLE [dbo].[thanh_toan]  WITH CHECK ADD FOREIGN KEY([dh_id])
REFERENCES [dbo].[don_hang] ([dh_id])
GO
USE [master]
GO
ALTER DATABASE [prj2_ngohoangminh] SET  READ_WRITE 
GO
