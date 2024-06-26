USE [master]
GO
/****** Object:  Database [UserManagement]    Script Date: 10-01-2024 07:04:33 PM ******/
CREATE DATABASE [UserManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UserManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UserManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UserManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\UserManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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
ALTER DATABASE [UserManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [UserManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [UserManagement]
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 10-01-2024 07:04:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactOrganization]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  Table [dbo].[LoginUser]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  Table [dbo].[Organization]    Script Date: 10-01-2024 07:04:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_Organization_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrganizationLocation]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrganizationLocation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [varchar](50) NOT NULL,
	[State] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[CreatedAt] [datetime2](4) NULL,
	[UpdatedAt] [datetime2](4) NULL,
 CONSTRAINT [PK_OrganizationLocation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  Table [dbo].[RolePermission]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 10-01-2024 07:04:33 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UC_User_Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddContact]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddContactOrganization]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[AddContactOrganization]  @Id int Output,  @ContactId int,  @OrganizationId int  as  begin INSERT INTO ContactOrganization (ContactId, OrganizationId,CreatedAt) VALUES (@ContactId, @OrganizationId,GETDATE());  set @Id=SCOPE_IDENTITY();
	  return 1;  end;
GO
/****** Object:  StoredProcedure [dbo].[AddOrganization]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddOrganization]  @Id int Output,  @Name Varchar(50)  As  BEGIN insert into  Organization (Name,CreatedAt) values(@Name,GETDATE());  set @Id=SCOPE_IDENTITY();
	  return 1;  END;
GO
/****** Object:  StoredProcedure [dbo].[AddOrganizationLocation]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddOrganizationLocation]
    @Country NVARCHAR(255),
    @State NVARCHAR(255),
    @City NVARCHAR(255),
    @Street NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @InsertedRows TABLE (Id INT);

    -- Insert into the table and capture the inserted Id
    INSERT INTO [dbo].[OrganizationLocation] (Country, State, City, Street, CreatedAt)
    OUTPUT inserted.Id INTO @InsertedRows
    VALUES (@Country, @State, @City, @Street, GETDATE());

    -- Select the inserted record based on the captured Id
    SELECT *
    FROM [dbo].[OrganizationLocation]
    WHERE [Id] = (SELECT Id FROM @InsertedRows);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddRefreshToken]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddRole]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddUserRole]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteContact]
    @Id INT
AS
BEGIN
    DELETE FROM [dbo].[ContactDetails]
    OUTPUT deleted.[Id], deleted.[FirstName], deleted.[MiddleName], deleted.[LastName], deleted.[PhoneNumber], deleted.[Email]
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteContactOrganization]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteOrganization]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteOrganizationLocation]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[DeleteOrganizationLocation]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    DELETE FROM [UserManagement].[dbo].[OrganizationLocation]
    OUTPUT deleted.[Id], deleted.[Country], deleted.[State], deleted.[City], deleted.[Street]
    WHERE [Id] = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[DeleteRole]
@Id int
as
begin
delete from  Role 
   output deleted.[Id],deleted.[Name]  WHERE [Id] = @Id
End;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteUser]
    @Id INT
AS
BEGIN
    UPDATE [UserManagement].[dbo].[User]
    SET [IsDeleted] = 1
	output deleted.[Id],deleted.[Name],deleted.[Password],deleted.[Email],deleted.[PhoneNumber],Deleted.[City],deleted.[ImageURL]
    WHERE [Id] = @Id;
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserRole]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create procedure [dbo].[DeleteUserRole]
  @UserId int
  
  as
  begin
 DELETE FROM UserRole
 output deleted.[Id],deleted.[UserId],deleted.[RoleId]
 WHERE UserId = @UserId ;
  end;
GO
/****** Object:  StoredProcedure [dbo].[EditContact]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditContact]
    @Id INT,
    @FirstName VARCHAR(50),
    @MiddleName VARCHAR(50) = NULL,
    @LastName VARCHAR(50),
    @PhoneNumber VARCHAR(14),
    @Email VARCHAR(100)
AS
BEGIN
    UPDATE [dbo].[ContactDetails]
    SET
        FirstName = @FirstName,
        MiddleName = @MiddleName,
        LastName = @LastName,
        PhoneNumber = @PhoneNumber,
        Email = @Email,
		UpdatedAt = GETDATE()
    WHERE Id = @Id;

	SELECT * FROM [ContactDetails] WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditOrganization]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE procedure [dbo].[EditOrganization]
  @Id int,
  @Name Varchar(50)
  As
  BEGIN
  update Organization set Name=@Name,UpdatedAt = GETDATE()
 WHERE [Id] = @Id;
 SELECT * FROM Organization WHERE Id = @Id;
  END;
GO
/****** Object:  StoredProcedure [dbo].[EditOrganizationLocation]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[EditOrganizationLocation]
    @Id INT,
    @Country NVARCHAR(255),
    @State NVARCHAR(255),
    @City NVARCHAR(255),
    @Street NVARCHAR(255)
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [UserManagement].[dbo].[OrganizationLocation]
    SET [Country] = @Country,
        [State] = @State,
        [City] = @City,
        [Street] = @Street,
        [UpdatedAt] = GETDATE()
    WHERE [Id] = @Id;

	SELECT * FROM [OrganizationLocation] WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditRole]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditRole]@Id int,@Name varchar(100)asbeginupdate Role setName=@Name  WHERE [Id] = @Id	SELECT * FROM [Role] WHERE Id = @Id;End;
GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditUserPassword]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllOrganizationLocation]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllOrganizationLocation]
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [UserManagement].[dbo].[OrganizationLocation];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganizations]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllRole]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetContactDetails]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetContactDetails]
AS
BEGIN
    SELECT * FROM [dbo].[ContactDetails];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetContactDetailsById]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetContactDetailsById]
    @Id INT
AS
BEGIN
    SELECT Id, FirstName, MiddleName, LastName, PhoneNumber, Email
    FROM [dbo].[ContactDetails]
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrganizationByContactId]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOrganizationById]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOrganizationLocationById]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganizationLocationById]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM [UserManagement].[dbo].[OrganizationLocation]
    WHERE [Id] = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetRefreshToken]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoleById]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserRole]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUsersById]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUsersWithoutDelete]    Script Date: 10-01-2024 07:04:33 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SearchContactDetailsWithPagination]    Script Date: 10-01-2024 07:04:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create stored procedure
CREATE PROCEDURE [dbo].[SearchContactDetailsWithPagination]
    @SearchText VARCHAR(50),
    @PageSize INT,
    @PageNumber INT,
    @SortColumn NVARCHAR(50),
    @SortOrder NVARCHAR(4)
AS
BEGIN
    SET NOCOUNT ON;

    -- Ensure valid values for @PageSize and @PageNumber
    IF @PageSize <= 0 SET @PageSize = 1;
    IF @PageNumber <= 0 SET @PageNumber = 1;

    -- Ensure valid values for @SortOrder
    IF UPPER(@SortOrder) NOT IN ('ASC', 'DESC') SET @SortOrder = 'ASC';

    DECLARE @DynamicOrderBy NVARCHAR(MAX) = 'ORDER BY ' + QUOTENAME(@SortColumn) + ' ' + @SortOrder;

    DECLARE @DynamicSql NVARCHAR(MAX) = 
        'SELECT Id, FirstName, MiddleName, LastName, PhoneNumber, Email
         FROM [dbo].[ContactDetails]
         WHERE FirstName LIKE ''%'' + @SearchText + ''%''
            OR MiddleName LIKE ''%'' + @SearchText + ''%''
            OR LastName LIKE ''%'' + @SearchText + ''%''
            OR PhoneNumber LIKE ''%'' + @SearchText + ''%''
            OR Email LIKE ''%'' + @SearchText + ''%''
         ' + @DynamicOrderBy + '
         OFFSET (@PageNumber - 1) * @PageSize ROWS
         FETCH NEXT @PageSize ROWS ONLY;';

    EXEC sp_executesql @DynamicSql,
                       N'@SearchText VARCHAR(50), @PageSize INT, @PageNumber INT',
                       @SearchText, @PageSize, @PageNumber;
END;
GO
/****** Object:  StoredProcedure [dbo].[SoftDeleteUser]    Script Date: 10-01-2024 07:04:33 PM ******/
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
