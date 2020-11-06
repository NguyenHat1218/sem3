USE [master]
GO
/****** Object:  Database [Online]    Script Date: 11/5/2020 11:38:22 PM ******/
CREATE DATABASE [Online]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Online', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Online_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Online_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Online] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Online].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Online] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Online] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Online] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Online] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Online] SET ARITHABORT OFF 
GO
ALTER DATABASE [Online] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Online] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Online] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Online] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Online] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Online] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Online] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Online] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Online] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Online] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Online] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Online] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Online] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Online] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Online] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Online] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Online] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Online] SET RECOVERY FULL 
GO
ALTER DATABASE [Online] SET  MULTI_USER 
GO
ALTER DATABASE [Online] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Online] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Online] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Online] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Online] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Online', N'ON'
GO
ALTER DATABASE [Online] SET QUERY_STORE = OFF
GO
USE [Online]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 11/5/2020 11:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Cus_ID] [int] IDENTITY(1,1) NOT NULL,
	[CusFirstName] [nvarchar](50) NULL,
	[CusLastName] [nvarchar](50) NULL,
	[CusPhone] [nvarchar](12) NULL,
	[CusAddress] [nvarchar](150) NULL,
	[CusEmail] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Cus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 11/5/2020 11:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Emp_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ho] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](150) NULL,
	[ChucVu] [nvarchar](150) NULL,
	[TrinhDo] [nvarchar](150) NULL,
	[MaLCB] [int] NULL,
	[MaHSL] [int] NULL,
	[MaPhong] [int] NULL,
	[MaPC] [int] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Emp_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 11/5/2020 11:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoiceID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
	[Status] [int] NULL,
	[BarCode] [nvarchar](max) NULL,
	[Payment1] [float] NULL,
	[Payment2] [float] NULL,
	[Receive] [date] NULL,
	[Returns] [date] NULL,
	[Cus_ID] [int] NULL,
	[Emp_ID] [int] NULL,
	[invoiceTypeID] [int] NULL,
 CONSTRAINT [PK_Invoice] PRIMARY KEY CLUSTERED 
(
	[invoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InvoiceType]    Script Date: 11/5/2020 11:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceType](
	[invoiceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](50) NULL,
 CONSTRAINT [PK_InvoiceType] PRIMARY KEY CLUSTERED 
(
	[invoiceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 11/5/2020 11:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Subject] [nvarchar](150) NULL,
	[Content] [nvarchar](250) NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PriceList]    Script Date: 11/5/2020 11:38:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PriceList](
	[invoiceTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_PriceList] PRIMARY KEY CLUSTERED 
(
	[invoiceTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Customer] FOREIGN KEY([Cus_ID])
REFERENCES [dbo].[Customer] ([Cus_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Customer]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Employee] FOREIGN KEY([Emp_ID])
REFERENCES [dbo].[Employee] ([Emp_ID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_Employee]
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_InvoiceType] FOREIGN KEY([invoiceTypeID])
REFERENCES [dbo].[InvoiceType] ([invoiceTypeID])
GO
ALTER TABLE [dbo].[Invoice] CHECK CONSTRAINT [FK_Invoice_InvoiceType]
GO
ALTER TABLE [dbo].[PriceList]  WITH CHECK ADD  CONSTRAINT [FK_PriceList_InvoiceType] FOREIGN KEY([invoiceTypeID])
REFERENCES [dbo].[InvoiceType] ([invoiceTypeID])
GO
ALTER TABLE [dbo].[PriceList] CHECK CONSTRAINT [FK_PriceList_InvoiceType]
GO
USE [master]
GO
ALTER DATABASE [Online] SET  READ_WRITE 
GO
