USE [master]
GO
/****** Object:  Database [UserManagement]    Script Date: 1/8/2024 6:19:11 PM ******/
CREATE DATABASE [UserManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\UserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [UserManagement] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UserManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UserManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UserManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UserManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UserManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UserManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UserManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UserManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UserManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UserManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UserManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UserManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UserManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UserManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UserManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UserManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UserManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UserManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UserManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UserManagement] SET  MULTI_USER 
GO
ALTER DATABASE [UserManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UserManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UserManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UserManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UserManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UserManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'UserManagement', N'ON'
GO
ALTER DATABASE [UserManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [UserManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UserManagement]
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[MiddleName] [varchar](50) NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](14) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[CreatedAt] [datetime2](4) NULL,
	[UpdatedAt] [datetime2](4) NULL,
 CONSTRAINT [PK_ContactDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactOrganization]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactOrganization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactId] [int] NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[CreatedAt] [datetime2](4) NULL,
 CONSTRAINT [PK_ContactOrganization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoginUser]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoginUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[IsActive] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CreatedAt] [datetime2](4) NULL,
	[UpdatedAt] [datetime2](4) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolePermission]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolePermission](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[Permission] [varchar](1000) NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_RolePermission] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](250) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[PhoneNumber] [varchar](14) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[ImageURL] [varchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[CreatedAt] [datetime2](4) NOT NULL,
	[UpdatedAt] [datetime2](4) NULL,
	[RefreshToken] [varchar](5000) NULL,
	[RefreshTokenTime] [datetime2](4) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ContactDetails] ON 

INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1, N'John', N'M', N'Doe', N'1234567890', N'john.doe@example.com', NULL, NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2, N'milan', N'n', N'Dort', N'1234567870', N'john.dort@example.com', NULL, NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1002, N'string12', N'string', N'string', N'1234569875', N'string@12.com', NULL, NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1003, N'Roahn', N'sdf', N'patel', N'9664555876', N'r12@gmail.com', NULL, NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1004, N'Kunit', N'string', N'Maheswari', N'7434012525', N'k12@gmail.com', CAST(N'2024-01-05T18:39:54.1467000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1005, N'Kunit', N'string', N'Maheswari', N'7434052525', N'k1212@gmail.com', CAST(N'2024-01-05T18:44:31.0367000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1006, N'stri', N'stg', N'strin', N'4521514526', N'str34@gmail.com', CAST(N'2024-01-05T18:46:22.3300000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1007, N'steewwri', N'stewg', N'strirewrn', N'4521914526', N'stdrewrr34@gmail.com', CAST(N'2024-01-05T18:47:42.0400000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1008, N'chirag', N'ss', N'string', N'1212212112', N'c12@gmail.com', CAST(N'2024-01-05T18:52:15.4733000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1011, N'John', N'Doe', N'Smith', N'1234569990', N'john.dowe@example.com', CAST(N'2024-01-05T18:59:31.7400000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (1012, N'string', N'string', N'string', N'5656565656', N'uj12@gmail.com', CAST(N'2024-01-05T19:02:46.1867000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2004, N'dhruv', N'pa', N'patel', N'7435859607', N'd@gmail.com', CAST(N'2024-01-08T14:55:42.1533000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2005, N'John', N'Doe', N'Smith', N'123-456-7890', N'johw2n.doe@example.com', CAST(N'2024-01-08T15:10:18.8533000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2006, N'harsh', N'string', N'string', N'9558214596', N'hr@gmail.com', CAST(N'2024-01-08T15:20:10.0900000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2007, N'kail', N'string', N'string', N'5652321545', N'kl@gmail.com', CAST(N'2024-01-08T15:28:02.8267000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2008, N'hthh', N'string', N'string', N'6989856545', N'hy@gmail.com', CAST(N'2024-01-08T15:40:19.2367000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2009, N'dinesh', N'string', N'string', N'5415125233', N'dn@gmail.com', CAST(N'2024-01-08T15:44:09.9633000' AS DateTime2), NULL)
INSERT [dbo].[ContactDetails] ([Id], [FirstName], [MiddleName], [LastName], [PhoneNumber], [Email], [CreatedAt], [UpdatedAt]) VALUES (2010, N'dinesh', N'string', N'string', N'5415127233', N'ddqewden@gmail.com', CAST(N'2024-01-08T15:44:44.9733000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[ContactDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactOrganization] ON 

INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (1, 1, 1, NULL)
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2, 2, 1, NULL)
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (1005, 1, 1, NULL)
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (1006, 1, 1, CAST(N'2024-01-05T19:04:35.9300000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2006, 1, 2, CAST(N'2024-01-08T16:00:15.1300000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2007, 1, 1, CAST(N'2024-01-08T16:05:43.9567000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2008, 1, 1, CAST(N'2024-01-08T16:08:30.4367000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2009, 1, 1, CAST(N'2024-01-08T16:08:34.1200000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2010, 1, 1, CAST(N'2024-01-08T16:08:35.1600000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2011, 1, 1, CAST(N'2024-01-08T16:08:35.4000000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2012, 1, 1, CAST(N'2024-01-08T16:09:59.3033000' AS DateTime2))
INSERT [dbo].[ContactOrganization] ([Id], [ContactId], [OrganizationId], [CreatedAt]) VALUES (2013, 1, 1, CAST(N'2024-01-08T16:18:24.9667000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ContactOrganization] OFF
GO
SET IDENTITY_INSERT [dbo].[Organization] ON 

INSERT [dbo].[Organization] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1, N'NGO', NULL, NULL)
INSERT [dbo].[Organization] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (6, N'strideq', CAST(N'2024-01-05T19:05:04.1400000' AS DateTime2), NULL)
INSERT [dbo].[Organization] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (7, N'striqwdqdng', CAST(N'2024-01-05T19:10:37.9400000' AS DateTime2), NULL)
INSERT [dbo].[Organization] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1006, N'ujij', CAST(N'2024-01-08T14:56:22.4233000' AS DateTime2), NULL)
INSERT [dbo].[Organization] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1007, N'sons', CAST(N'2024-01-08T16:24:52.0000000' AS DateTime2), NULL)
INSERT [dbo].[Organization] ([Id], [Name], [CreatedAt], [UpdatedAt]) VALUES (1008, N'strinfrewfewg', CAST(N'2024-01-08T16:36:45.8500000' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Organization] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (1, N'Admin', 1)
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (2, N'user', 1)
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (4002, N'string', 1)
INSERT [dbo].[Role] ([Id], [Name], [IsActive]) VALUES (5002, N'string', 1)
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1, N'string_123', N'meet123', N'string@19.com', N'1111111111', N'string', N'string', 1, 1, CAST(N'2023-12-25T16:10:28.2700000' AS DateTime2), CAST(N'2024-01-03T11:10:47.0467000' AS DateTime2), N'7a5a84fae31b4dbc82ae5029a3ca2a5f1', CAST(N'2024-01-02T18:18:55.4267000' AS DateTime2))
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1007, N'kunit', N'string', N'gh@exafmplrere.com', N'9664555876', N'string', N'string', 1, 1, CAST(N'2023-12-26T17:35:01.8767000' AS DateTime2), CAST(N'2023-12-29T12:47:41.2800000' AS DateTime2), N'e722665301f6455ea75fd19df67f2b961017', CAST(N'2024-01-02T10:35:43.4900000' AS DateTime2))
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1008, N'milan', N'stwdring', N'gh@exafmple.com', N'9664555876', N'string', N'string', 1, 1, CAST(N'2023-12-26T17:48:18.6733000' AS DateTime2), CAST(N'2023-12-29T12:47:24.7733000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1009, N'string1', N'string', N'userss@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T17:49:30.9467000' AS DateTime2), CAST(N'2023-12-29T12:45:18.4667000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1010, N'string2', N'string', N'useedr@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T17:54:27.4200000' AS DateTime2), CAST(N'2023-12-29T12:45:26.6200000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1011, N'string3', N'string', N'Jigar@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T17:56:16.3400000' AS DateTime2), CAST(N'2023-12-29T12:45:34.4833000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1012, N'string4', N'string', N'Meet@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T17:57:29.0600000' AS DateTime2), CAST(N'2023-12-29T12:45:42.2133000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1013, N'string5', N'string', N'nirav@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T17:58:32.8833000' AS DateTime2), CAST(N'2023-12-29T12:45:53.0067000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1014, N'string6', N'string', N'nirasv@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T17:58:43.8833000' AS DateTime2), CAST(N'2023-12-29T12:46:01.5433000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1015, N'string7', N'string', N'soham@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T18:01:15.9333000' AS DateTime2), CAST(N'2023-12-29T12:46:11.1967000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1016, N'string8', N'string', N'token@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T18:05:53.6567000' AS DateTime2), CAST(N'2023-12-29T12:46:19.9533000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1017, N'string9', N'string', N'gh@example.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T18:15:33.9567000' AS DateTime2), CAST(N'2023-12-29T12:46:29.4033000' AS DateTime2), N'f55448a2d8304525b0fc9d61d21d44af1017', CAST(N'2024-01-08T18:03:24.9667000' AS DateTime2))
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1018, N'string10', N'string', N'string12@123.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-26T18:48:17.8433000' AS DateTime2), CAST(N'2023-12-29T12:44:25.3233000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1019, N'milsan', N'123456', N'milan@123.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-27T12:58:28.4767000' AS DateTime2), CAST(N'2023-12-29T12:48:35.6167000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1020, N'kiran', N'789654', N'milanwef@123.com', N'9664555876', N'string', N'string', 1, 1, CAST(N'2023-12-27T14:26:05.6133000' AS DateTime2), CAST(N'2023-12-29T12:49:12.9100000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1021, N'kiradqwn', N'string', N'milandawef@123.com', N'9664555876', N'string', N'string', 1, 0, CAST(N'2023-12-27T14:27:18.2633000' AS DateTime2), CAST(N'2023-12-29T12:49:23.5533000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1022, N'string12', N'123456', N'stg@123.com', N'1234567895', N'string', N'string', 1, 0, CAST(N'2023-12-27T18:38:31.6600000' AS DateTime2), CAST(N'2023-12-29T12:43:57.6900000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (1023, N'string13', N'123456', N'stri@123ng.com', N'1234567896', N'string', N'string', 1, 0, CAST(N'2023-12-27T18:45:04.4400000' AS DateTime2), CAST(N'2023-12-29T12:43:43.9400000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (2019, N'string14', N'string', N'strin12@123g.com', N'7894563214', N'string', N'string', 1, 0, CAST(N'2023-12-28T13:06:18.8933000' AS DateTime2), CAST(N'2023-12-29T12:43:05.3333000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (4019, N'JigarParajapti', N'987654', N'mailto:jigar@gmail.com', N'1234567890', N'string', N'string', 1, 0, CAST(N'2024-01-02T12:14:31.9000000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (4020, N'JigarParajapti_21', N'987654', N'mailto:jaigar@gmail.com', N'1234567890', N'string', N'string', 1, 0, CAST(N'2024-01-02T12:16:24.9100000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (4021, N'JigarParajapti_22', N'987654', N'mailto:jeigar@gmail.com', N'1234567890', N'string', N'string', 1, 0, CAST(N'2024-01-02T12:17:18.4633000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (4022, N'shivam', N'string', N'shivam@123.com', N'6363524152', N'string', N'string', 1, 1, CAST(N'2024-01-02T18:19:50.5100000' AS DateTime2), CAST(N'2024-01-03T10:39:37.0367000' AS DateTime2), NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (5019, N'kinal', N'string', N'kinal@gmail.com', N'9664555876', N'string', N'string', 1, 1, CAST(N'2024-01-03T10:38:54.3667000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (5020, N'kkkk', N'str23g', N'str@.com', N'4545454545', N'string', N'string', 1, 0, CAST(N'2024-01-05T19:07:10.8333000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (6020, N'jitu', N'123456', N'jit@gmail.com', N'7854569665', N'string', N'string', 1, 0, CAST(N'2024-01-08T17:57:14.3033000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (6022, N'jfggitu', N'123456', N'jivvt@gmail.com', N'7854569665', N'string', N'string', 1, 0, CAST(N'2024-01-08T17:59:52.2133000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (6023, N'jfggfdswfitu', N'123456', N'jidqwdvvt@gmail.com', N'7854569665', N'string', N'string', 1, 0, CAST(N'2024-01-08T18:00:29.0467000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (6024, N'jffewggfdswfitu', N'123456', N'jidwerfqwdvvt@gmail.com', N'7854569665', N'string', N'string', 1, 0, CAST(N'2024-01-08T18:01:45.0067000' AS DateTime2), NULL, NULL, NULL)
INSERT [dbo].[User] ([Id], [Name], [Password], [Email], [PhoneNumber], [City], [ImageURL], [IsActive], [IsDeleted], [CreatedAt], [UpdatedAt], [RefreshToken], [RefreshTokenTime]) VALUES (6025, N'hfiwgufng', N'strieng', N'stwdewr@123.com', N'1236568985', N'string', N'string', 1, 0, CAST(N'2024-01-08T18:13:25.7533000' AS DateTime2), NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRole] ON 

INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (3, 1009, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (4, 1010, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (5, 1011, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (6, 1012, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (7, 1013, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (8, 1014, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (9, 1015, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (10, 1016, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (11, 1017, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (1006, 1022, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (1007, 1023, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (2002, 2019, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (3002, 1017, 1, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (4004, 4021, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (4005, 4022, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (5003, 5019, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (6004, 5020, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (7004, 1, 1, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (7005, 1, 1, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (7006, 1, 1, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (7007, 6024, 2, 1)
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [IsActive]) VALUES (7008, 6025, 2, 1)
SET IDENTITY_INSERT [dbo].[UserRole] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ContactD__85FB4E38095C97EE]    Script Date: 1/8/2024 6:19:11 PM ******/
ALTER TABLE [dbo].[ContactDetails] ADD UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__ContactD__A9D105344FB0B0B5]    Script Date: 1/8/2024 6:19:11 PM ******/
ALTER TABLE [dbo].[ContactDetails] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_Organization_Name]    Script Date: 1/8/2024 6:19:11 PM ******/
ALTER TABLE [dbo].[Organization] ADD  CONSTRAINT [UC_Organization_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UC_User_Name]    Script Date: 1/8/2024 6:19:11 PM ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UC_User_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ContactOrganization]  WITH CHECK ADD  CONSTRAINT [FK_ContactOrganization_ContactOrganization] FOREIGN KEY([Id])
REFERENCES [dbo].[ContactOrganization] ([Id])
GO
ALTER TABLE [dbo].[ContactOrganization] CHECK CONSTRAINT [FK_ContactOrganization_ContactOrganization]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_RoleId]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_UserId]
GO
/****** Object:  StoredProcedure [dbo].[AddContact]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddContact]
    @Id int output,
    @FirstName VARCHAR(50),
    @MiddleName VARCHAR(50),
    @LastName VARCHAR(50),
    @PhoneNumber VARCHAR(14),
    @Email VARCHAR(100)

AS
BEGIN
    DECLARE @ContactId INT;

    INSERT INTO [dbo].[ContactDetails] (FirstName, MiddleName, LastName, PhoneNumber, Email, CreatedAt)
    VALUES (@FirstName, @MiddleName, @LastName, @PhoneNumber, @Email, GETDATE());
	  set @Id=SCOPE_IDENTITY();
	  return 1;
   
END;
GO
/****** Object:  StoredProcedure [dbo].[AddContactOrganization]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[AddContactOrganization]  @Id int Output,  @ContactId int,  @OrganizationId int  as  begin INSERT INTO ContactOrganization (ContactId, OrganizationId,CreatedAt) VALUES (@ContactId, @OrganizationId,GETDATE());  set @Id=SCOPE_IDENTITY();
	  return 1;  end;
GO
/****** Object:  StoredProcedure [dbo].[AddOrganization]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE procedure [dbo].[AddOrganization]  @Id int Output,  @Name Varchar(50)  As  BEGIN insert into  Organization (Name,CreatedAt) values(@Name,GETDATE());  set @Id=SCOPE_IDENTITY();
	  return 1;  END;
GO
/****** Object:  StoredProcedure [dbo].[AddRefreshToken]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRefreshToken]
    @Id int, -- Add the appropriate length for the name
    @RefreshToken VARCHAR(5000)
    
AS
BEGIN
    -- Check if the user with the given name already exists
   
        -- Update the user's refresh token if the name exists
        UPDATE [UserManagement].[dbo].[User]
        SET RefreshToken = @RefreshToken, 
            RefreshTokenTime = GETDATE()
        WHERE [Id] = @Id;
    END
    

GO
/****** Object:  StoredProcedure [dbo].[AddRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddRole]
 @Id int Output,
    @Name VARCHAR(100)
AS
BEGIN
    INSERT INTO [UserManagement].[dbo].[Role] (Name, IsActive)
    VALUES (@Name, 1);
	 set @Id=SCOPE_IDENTITY();
	  return 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[AddUserRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddUserRole]
 @Id int Output,
  @UserId int,
  @RoleId int
  as
  begin
 INSERT INTO UserRole (UserId, RoleId, IsActive) VALUES (@UserId, @RoleId, 1);
  set @Id=SCOPE_IDENTITY();
	  return 1;
  end;
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateUser]
 @Id int Output,
    @Name VARCHAR(50),
    @Password VARCHAR(250),
    @Email VARCHAR(100),
    @PhoneNumber VARCHAR(14),
    @City NVARCHAR(50),
    @ImageURL VARCHAR(500)
AS
BEGIN
    -- Check if the user with the given email already exists
    IF NOT EXISTS (SELECT 1 FROM [UserManagement].[dbo].[User] WHERE [Email] = @Email)
    BEGIN
        -- Insert the user if the email is not already in use
        INSERT INTO [UserManagement].[dbo].[User]
            ( [Name], [Password], [Email], [PhoneNumber], [City], ImageURL, [IsActive], [IsDeleted], [CreatedAt])
        VALUES
            ( @Name, @Password, @Email, @PhoneNumber, @City, @ImageURL, 1, 0, GETDATE());
			 set @Id=SCOPE_IDENTITY();
	  return 1;
    END
    ELSE
    BEGIN
        -- User with this email already exists, raise an error
        THROW 50001, 'User with this email already exists.', 1;
    END
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteContact]    @Id INTASBEGIN    DELETE FROM [dbo].[ContactDetails]    OUTPUT deleted.[Id], deleted.[FirstName], deleted.[MiddleName], deleted.[LastName], deleted.[PhoneNumber], deleted.[Email]    WHERE Id = @Id;END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteContactOrganization]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteContactOrganization]
  @Id int
  as
  begin
 DELETE FROM ContactOrganization
 output deleted.[Id],deleted.ContactId,deleted.OrganizationId
 WHERE Id = @Id ;
  end;
GO
/****** Object:  StoredProcedure [dbo].[DeleteOrganization]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteOrganization]
  @Id int
 
  As
  BEGIN
  delete from Organization output deleted.[Id],deleted.Name
 WHERE [Id] = @Id;
  END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteRole]
@Id INT

AS
BEGIN
    SET NOCOUNT ON;

    -- Declare a variable to store the deleted ID
  delete from [dbo].[Role]output deleted.[Name], deleted.[Id]where Id = @Id
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]    @Id INTASBEGIN    UPDATE [UserManagement].[dbo].[User]    SET [IsDeleted] = 1	output deleted.[Id],deleted.[Name],deleted.[Password],deleted.[Email],deleted.[PhoneNumber],Deleted.[City],deleted.[ImageURL]    WHERE [Id] = @Id;END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create procedure [dbo].[DeleteUserRole]  @UserId int    as  begin DELETE FROM UserRole output deleted.[Id],deleted.[UserId],deleted.[RoleId] WHERE UserId = @UserId ;  end;
GO
/****** Object:  StoredProcedure [dbo].[EditContact]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditContact]    @Id INT,    @FirstName VARCHAR(50),    @MiddleName VARCHAR(50) = NULL,    @LastName VARCHAR(50),    @PhoneNumber VARCHAR(14),    @Email VARCHAR(100)ASBEGIN    UPDATE [dbo].[ContactDetails]    SET        FirstName = @FirstName,        MiddleName = @MiddleName,        LastName = @LastName,        PhoneNumber = @PhoneNumber,        Email = @Email,		UpdatedAt = GETDATE()    WHERE Id = @Id;	SELECT * FROM [ContactDetails] WHERE Id = @Id;END;
GO
/****** Object:  StoredProcedure [dbo].[EditOrganization]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[EditOrganization]  @Id int,  @Name Varchar(50)  As  BEGIN  update Organization set Name=@Name,UpdatedAt = GETDATE() WHERE [Id] = @Id; SELECT * FROM Organization WHERE Id = @Id;  END;
GO
/****** Object:  StoredProcedure [dbo].[EditRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditRole]@Id int,@Name varchar(100)asbeginupdate Role setName=@Name  WHERE [Id] = @Id	SELECT * FROM [Role] WHERE Id = @Id;End;
GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditUser]
    @Id INT,
    @Name VARCHAR(50),
    @Email VARCHAR(100),
    @PhoneNumber VARCHAR(14),
    @City NVARCHAR(50),
    @ImageURL VARCHAR(100)
AS
BEGIN
    UPDATE [UserManagement].[dbo].[User]
    SET [Name] = @Name, 
        [Email] = @Email, 
        [PhoneNumber] = @PhoneNumber, 
        [City] = @City, 
        [ImageURL] = @ImageURL, 
        [UpdatedAt] = GETDATE() 
    WHERE [Id] = @Id;

	SELECT * FROM [User] WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[EditUserPassword]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditUserPassword]
    @Id INT,
    @Password VARCHAR(250)
AS
BEGIN
    UPDATE [UserManagement].[dbo].[User]
    SET [Password] = @Password, 
        [UpdatedAt] = GETDATE() 
    WHERE [Id] = @Id;

	SELECT * FROM [User] WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganizations]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllOrganizations]
  As
  BEGIN
  select * from Organization
  END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetAllRole]

as
begin
select * from  Role 

End;
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[GetAllUsers]
AS
BEGIN
    SELECT * 
    FROM [UserManagement].[dbo].[User]
    WHERE [IsDeleted] = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[GetContactDetails]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContactDetails]ASBEGIN    SELECT * FROM [dbo].[ContactDetails];END;
GO
/****** Object:  StoredProcedure [dbo].[GetContactDetailsById]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetContactDetailsById]    @Id INTASBEGIN    SELECT Id, FirstName, MiddleName, LastName, PhoneNumber, Email    FROM [dbo].[ContactDetails]    WHERE Id = @Id;END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrganizationByContactId]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganizationByContactId]
    @ContactId INT
AS
BEGIN
       SELECT CO.[Id] ,
           CO.[ContactId],
           CO.[OrganizationId],
           O.[Id] AS OrganizationId, -- Include the OrganizationId in the result set
           O.[Name] AS OrganizationName
    FROM [dbo].[ContactOrganization] CO
    JOIN [dbo].[Organization] O ON CO.[OrganizationId] = O.[Id]
    WHERE CO.[ContactId] = @ContactId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrganizationById]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetOrganizationById]
  @Id int
  As
  BEGIN
  select * from Organization where Id=@Id;
  END;
GO
/****** Object:  StoredProcedure [dbo].[GetRefreshToken]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetRefreshToken]
    @Id int -- Add the parameter for Id
AS
BEGIN
    SELECT RefreshToken
    FROM [UserManagement].[dbo].[User]
    WHERE Id = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetRoleById]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[GetRoleById]
@Id int
as
begin
select * from  Role 
  WHERE [Id] = @Id
End;
GO
/****** Object:  StoredProcedure [dbo].[GetUserRole]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserRole]
    @UserId INT
AS
BEGIN
    SELECT 
        U.[Email],
        UR.[UserId],
        R.[Name] AS RoleName,
        R.[Id] AS RoleId
    FROM [UserManagement].[dbo].[UserRole] UR
    JOIN [UserManagement].[dbo].[Role] R ON UR.[RoleId] = R.[Id]
    JOIN [UserManagement].[dbo].[User] U ON UR.[UserId] = U.[Id]
    WHERE UR.[UserId] = @UserId;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUsersById]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetUsersById]
    @Id INT -- Add the parameter for Id
AS
BEGIN
    SELECT * 
    FROM [UserManagement].[dbo].[User]
    WHERE [Id] = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[GetUsersWithoutDelete]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetUsersWithoutDelete]
AS
BEGIN
    SELECT * 
    FROM [UserManagement].[dbo].[User]
    WHERE [IsDeleted] = 0;
END
GO
/****** Object:  StoredProcedure [dbo].[SearchContactDetailsWithPagination]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SearchContactDetailsWithPagination]    @SearchText VARCHAR(50),    @PageSize INT,    @PageNumber INT,    @SortColumn NVARCHAR(50),    @SortOrder NVARCHAR(4)ASBEGIN    SET NOCOUNT ON;    -- Ensure valid values for @PageSize and @PageNumber    IF @PageSize <= 0 SET @PageSize = 1;    IF @PageNumber <= 0 SET @PageNumber = 1;    -- Ensure valid values for @SortOrder    IF UPPER(@SortOrder) NOT IN ('ASC', 'DESC') SET @SortOrder = 'ASC';    DECLARE @DynamicOrderBy NVARCHAR(MAX) = 'ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;    DECLARE @DynamicSql NVARCHAR(MAX) =         'SELECT Id, FirstName, MiddleName, LastName, PhoneNumber, Email         FROM [dbo].[ContactDetails]         WHERE FirstName LIKE ''%'' + @SearchText + ''%''            OR MiddleName LIKE ''%'' + @SearchText + ''%''            OR LastName LIKE ''%'' + @SearchText + ''%''            OR PhoneNumber LIKE ''%'' + @SearchText + ''%''            OR Email LIKE ''%'' + @SearchText + ''%''         ' + @DynamicOrderBy + '         OFFSET (@PageNumber - 1) * @PageSize ROWS         FETCH NEXT @PageSize ROWS ONLY;';    EXEC sp_executesql @DynamicSql,                       N'@SearchText VARCHAR(50), @PageSize INT, @PageNumber INT',                       @SearchText, @PageSize, @PageNumber;END;
GO
/****** Object:  StoredProcedure [dbo].[SoftDeleteUser]    Script Date: 1/8/2024 6:19:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SoftDeleteUser]
    @Id INT
AS
BEGIN
    UPDATE [UserManagement].[dbo].[User]
    SET [IsDeleted] = 1
    WHERE [Id] = @Id;
END
GO
USE [master]
GO
ALTER DATABASE [UserManagement] SET  READ_WRITE 
GO
