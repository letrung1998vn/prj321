USE [master]
GO
/****** Object:  Database [Workshop1_MobileDB]    Script Date: 7/14/2018 10:21:35 PM ******/
CREATE DATABASE [Workshop1_MobileDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Workshop1_MobileDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Workshop1_MobileDB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Workshop1_MobileDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Workshop1_MobileDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Workshop1_MobileDB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Workshop1_MobileDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Workshop1_MobileDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Workshop1_MobileDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Workshop1_MobileDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Workshop1_MobileDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Workshop1_MobileDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Workshop1_MobileDB] SET  MULTI_USER 
GO
ALTER DATABASE [Workshop1_MobileDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Workshop1_MobileDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Workshop1_MobileDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Workshop1_MobileDB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Workshop1_MobileDB] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Workshop1_MobileDB]
GO
/****** Object:  Table [dbo].[tbl_Mobile]    Script Date: 7/14/2018 10:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Mobile](
	[mobileId] [varchar](10) NOT NULL,
	[description] [varchar](250) NOT NULL,
	[price] [float] NULL,
	[mobileName] [varchar](20) NOT NULL,
	[yearOfProduction] [int] NULL,
	[quantity] [int] NULL,
	[notSale] [bit] NULL,
 CONSTRAINT [PK_tbl_Mobile] PRIMARY KEY CLUSTERED 
(
	[mobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_Order]    Script Date: 7/14/2018 10:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Order](
	[orderId] [nvarchar](10) NOT NULL,
	[UserId] [varchar](20) NULL,
	[RequiredDate] [date] NULL,
	[Freight] [money] NULL,
 CONSTRAINT [PK_tbl_Order] PRIMARY KEY CLUSTERED 
(
	[orderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_OrderDetails]    Script Date: 7/14/2018 10:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_OrderDetails](
	[OrderId] [nvarchar](10) NOT NULL,
	[mobileId] [varchar](10) NOT NULL,
	[UnitPrice] [money] NULL,
	[Quantity] [smallint] NULL,
 CONSTRAINT [PK_tbl_Order Details] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[mobileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 7/14/2018 10:21:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_User](
	[userId] [varchar](20) NOT NULL,
	[password] [int] NOT NULL,
	[fullName] [varchar](50) NOT NULL,
	[role] [int] NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[userId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'A001', N'Good, Expensive,, New', 500, N'Apple', 2015, 30, 1)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'aass', N'a', 1, N'a', 1123, 10, 1)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'M002', N'Good, Security', 100, N'Motorola', 2008, 20, 1)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'N001', N'Good, Cheap', 5, N'Nokia', 2010, 14, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'S001', N'Good, new,  have sd choice', 200, N'Samsung', 2014, 44, 0)
INSERT [dbo].[tbl_Mobile] ([mobileId], [description], [price], [mobileName], [yearOfProduction], [quantity], [notSale]) VALUES (N'sss', N'bad', 22113, N'mm', 2143, 22, 1)
INSERT [dbo].[tbl_Order] ([orderId], [UserId], [RequiredDate], [Freight]) VALUES (N'1', N'minh', NULL, 205.0000)
INSERT [dbo].[tbl_Order] ([orderId], [UserId], [RequiredDate], [Freight]) VALUES (N'2', N'minh', NULL, 205.0000)
INSERT [dbo].[tbl_Order] ([orderId], [UserId], [RequiredDate], [Freight]) VALUES (N'3', N'thien', CAST(N'2018-07-14' AS Date), 205.0000)
INSERT [dbo].[tbl_Order] ([orderId], [UserId], [RequiredDate], [Freight]) VALUES (N'4', N'thien', CAST(N'2018-07-14' AS Date), 205.0000)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'1', N'N001', 5.0000, 1)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'1', N'S001', 200.0000, 1)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'2', N'N001', 5.0000, 1)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'2', N'S001', 200.0000, 1)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'3', N'N001', 5.0000, 1)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'3', N'S001', 200.0000, 1)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'4', N'N001', 5.0000, 1)
INSERT [dbo].[tbl_OrderDetails] ([OrderId], [mobileId], [UnitPrice], [Quantity]) VALUES (N'4', N'S001', 200.0000, 1)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'Khoa', 2468, N'Khoa', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'Minh', 123456789, N'Minh', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'Thien', 13579, N'Thien', 0)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'Tien', 123456, N'Tien', 2)
INSERT [dbo].[tbl_User] ([userId], [password], [fullName], [role]) VALUES (N'Trung', 123456, N'Trung', 1)
ALTER TABLE [dbo].[tbl_Order]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order_tbl_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[tbl_User] ([userId])
GO
ALTER TABLE [dbo].[tbl_Order] CHECK CONSTRAINT [FK_tbl_Order_tbl_User]
GO
ALTER TABLE [dbo].[tbl_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order Details_tbl_Mobile] FOREIGN KEY([mobileId])
REFERENCES [dbo].[tbl_Mobile] ([mobileId])
GO
ALTER TABLE [dbo].[tbl_OrderDetails] CHECK CONSTRAINT [FK_tbl_Order Details_tbl_Mobile]
GO
ALTER TABLE [dbo].[tbl_OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Order Details_tbl_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[tbl_Order] ([orderId])
GO
ALTER TABLE [dbo].[tbl_OrderDetails] CHECK CONSTRAINT [FK_tbl_Order Details_tbl_Order]
GO
USE [master]
GO
ALTER DATABASE [Workshop1_MobileDB] SET  READ_WRITE 
GO
