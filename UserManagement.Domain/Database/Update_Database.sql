USE [master]
GO
/****** Object:  Database [UserManagement]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[Booking]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TimeSlot] [datetime2](4) NOT NULL,
	[Date] [datetime2](4) NOT NULL,
	[Service] [nvarchar](50) NOT NULL,
	[Provider] [nvarchar](50) NOT NULL,
	[Location] [nvarchar](50) NOT NULL,
	[Organization] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetime2](4) NULL,
	[UpdatedAt] [datetime2](4) NULL,
	[ConfirmBooking] [bit] NOT NULL,
	[CancelBooking] [bit] NOT NULL,
	[PhoneNumber] [nvarchar](14) NULL,
 CONSTRAINT [PK_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactDetails]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[ContactOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[LoginUser]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[Organization]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[OrganizationLocation]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[Providers]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Providers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [varchar](50) NOT NULL,
	[CreatedAt] [datetime2](4) NOT NULL,
	[UpdatedAt] [datetime2](4) NULL,
 CONSTRAINT [PK_Providers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[RolePermission]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[Service]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[CreatedAt] [datetime2](4) NULL,
	[UpdatedAt] [datetime2](4) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceProvider]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceProvider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProviderId] [int] NULL,
	[ServiceId] [int] NULL,
	[CreatedAt] [datetime2](4) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  Table [dbo].[UserRole]    Script Date: 19-01-2024 06:54:16 PM ******/
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
ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviderLink_Provider] FOREIGN KEY([ProviderId])
REFERENCES [dbo].[Providers] ([Id])
GO
ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProviderLink_Provider]
GO
ALTER TABLE [dbo].[ServiceProvider]  WITH CHECK ADD  CONSTRAINT [FK_ServiceProviderLink_Service] FOREIGN KEY([ServiceId])
REFERENCES [dbo].[Service] ([Id])
GO
ALTER TABLE [dbo].[ServiceProvider] CHECK CONSTRAINT [FK_ServiceProviderLink_Service]
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
/****** Object:  StoredProcedure [dbo].[AddBooking]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddBooking]
    @Service NVARCHAR(255),
    @Provider NVARCHAR(255),
    @Location NVARCHAR(255),
    @PhoneNumber NVARCHAR(15),
    @Organization NVARCHAR(255)
AS
BEGIN
    -- Declare a table variable to store the Id of the inserted record
    DECLARE @InsertedIdTable TABLE (Id INT);

    BEGIN TRY
        -- Step 1: Check if the service exists in the Service table
        IF EXISTS (
            SELECT 1
            FROM [UserManagement].[dbo].[Service] s
            WHERE s.[Name] = @Service
        )
        AND EXISTS (
            SELECT 1
            FROM [UserManagement].[dbo].[Providers] p
            WHERE p.[ProviderName] = @Provider
        )
        AND EXISTS (
            SELECT 1
            FROM [UserManagement].[dbo].[OrganizationLocation] o
            CROSS APPLY STRING_SPLIT(@Location, ',') AS LocationParts
            WHERE 
                (ISNUMERIC(LocationParts.[value]) = 1 AND o.[Street] = LocationParts.[value])
                OR o.[Country] = LocationParts.[value]
                OR o.[State] = LocationParts.[value]
                OR o.[City] = LocationParts.[value]
        )
        AND EXISTS (
            SELECT 1
            FROM [UserManagement].[dbo].[Organization] org
            WHERE org.[Name] = @Organization
        )
        AND EXISTS (
            SELECT 1
            FROM [UserManagement].[dbo].[ContactDetails] cd
            WHERE cd.[PhoneNumber] = @PhoneNumber	
        )
        BEGIN
            -- Step 2: Insert data into the Booking table
            INSERT INTO [UserManagement].[dbo].[Booking] 
                ([TimeSlot],
                 [Date],
                 [Service],
                 [Provider],
                 [Location],
                 [PhoneNumber],
                 [Organization],
                 [CreatedAt],
                 [ConfirmBooking],
                 [CancelBooking])
            OUTPUT INSERTED.Id INTO @InsertedIdTable
            VALUES (GETDATE(),
                    GETDATE(),
                    @Service,
                    @Provider,
                    @Location,
                    @PhoneNumber,
                    @Organization,
                    GETDATE(),
                    0, 0);

            PRINT 'Booking inserted successfully!';

            -- Step 3: Select the inserted record by ID
            DECLARE @InsertedId INT = (SELECT TOP 1 Id FROM @InsertedIdTable);

            SELECT *
            FROM [UserManagement].[dbo].[Booking]
            WHERE Id = @InsertedId;
            
            RETURN 0; -- Return 0 to indicate success
        END
        ELSE
        BEGIN
            PRINT 'Data does not exist in the Another table. Booking not inserted.';
            RETURN -1; -- Return -1 to indicate that no data was inserted
        END
    END TRY
    BEGIN CATCH
        -- Catch any errors and print them
        PRINT 'Error Message: ' + ERROR_MESSAGE();
        PRINT 'Error Severity: ' + CAST(ERROR_SEVERITY() AS NVARCHAR(5));
        PRINT 'Error State: ' + CAST(ERROR_STATE() AS NVARCHAR(5));
        PRINT 'Error Procedure: ' + ERROR_PROCEDURE();
        PRINT 'Error Line: ' + CAST(ERROR_LINE() AS NVARCHAR(5));
        
        RETURN -2; -- Return -2 to indicate an error
    END CATCH
END;
GO
/****** Object:  StoredProcedure [dbo].[AddContact]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddContactOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  procedure [dbo].[AddContactOrganization]  @Id int Output,  @ContactId int,  @OrganizationId int  as  begin INSERT INTO ContactOrganization (ContactId, OrganizationId,CreatedAt) VALUES (@ContactId, @OrganizationId,GETDATE());  set @Id=SCOPE_IDENTITY();
	  return 1;  end;
GO
/****** Object:  StoredProcedure [dbo].[AddOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[AddOrganization]  @Id int Output,  @Name Varchar(50)  As  BEGIN insert into  Organization (Name,CreatedAt) values(@Name,GETDATE());  set @Id=SCOPE_IDENTITY();
	  return 1;  END;
GO
/****** Object:  StoredProcedure [dbo].[AddOrganizationLocation]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddProvider]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddProvider]
    @ProviderName NVARCHAR(MAX)
AS
BEGIN
    DECLARE @InsertedRows TABLE (Id INT);

    INSERT INTO [dbo].[Providers] (ProviderName, CreatedAt)
    OUTPUT inserted.Id INTO @InsertedRows
    VALUES (@ProviderName, GETDATE());

    SELECT *
    FROM [dbo].[Providers]
    WHERE [Id] = (SELECT Id FROM @InsertedRows);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddRefreshToken]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddRole]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddService]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddService]
    @Name NVARCHAR(MAX)
AS
BEGIN
    DECLARE @InsertedRows TABLE (Id INT);

    INSERT INTO [dbo].[Service] (Name, CreatedAt)
    OUTPUT inserted.Id INTO @InsertedRows
    VALUES (@Name, GETDATE());

    SELECT *
    FROM [dbo].[Service]
    WHERE [Id] = (SELECT Id FROM @InsertedRows);
END;
GO
/****** Object:  StoredProcedure [dbo].[AddServiceProvider]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AddServiceProvider]
    @ProviderId INT,
    @ServiceId INT
AS
BEGIN
    INSERT INTO ServiceProvider (ProviderId, ServiceId, CreatedAt)
    VALUES (@ProviderId, @ServiceId, GETDATE());
END;
GO
/****** Object:  StoredProcedure [dbo].[AddUserRole]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[CancelBooking]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CancelBooking]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Booking]
    SET ConfirmBooking = 0,
        CancelBooking = 1
    WHERE  Id = @Id;
	SELECT * FROM [Booking] WHERE Id = @Id;

END;
GO
/****** Object:  StoredProcedure [dbo].[ConfirmBooking]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ConfirmBooking]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Booking]
    SET ConfirmBooking = 1
    WHERE Id = @Id;
	Select * From [Booking] Where Id = @Id;

END;
GO
/****** Object:  StoredProcedure [dbo].[CreateUser]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteContact]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteContactOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteOrganizationLocation]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteProvider]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteProvider]
    @Id INT
AS
BEGIN
    DELETE FROM [UserManagement].[dbo].[Providers]
    OUTPUT deleted.[Id], deleted.[ProviderName],deleted.[CreatedAt],deleted.[UpdatedAt]
    WHERE [Id] = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteRole]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteService]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[DeleteService]
    @Id INT
AS
BEGIN
    DELETE FROM [UserManagement].[dbo].[Service]
    OUTPUT deleted.[Id], deleted.[Name],deleted.[CreatedAt],deleted.[UpdatedAt]
    WHERE [Id] = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteServiceProvider]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteServiceProvider]
    @ServiceProviderLinkId INT
AS
BEGIN
    DELETE FROM ServiceProvider
    WHERE Id = @ServiceProviderLinkId;
END;
GO
/****** Object:  StoredProcedure [dbo].[DeleteUser]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteUserRole]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditContact]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditOrganizationLocation]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditProvider]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[EditProvider]
    @Id INT,
    @ProviderName NVARCHAR(MAX)
AS
BEGIN
    -- Update the Providers table
    UPDATE [UserManagement].[dbo].[Providers]
    SET [ProviderName] = @ProviderName,
        [UpdatedAt] = GETDATE()
    WHERE [Id] = @Id;

    -- Select records from OrganizationLocation based on the provided Id
    SELECT *
    FROM [Providers]
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditRole]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[EditRole]@Id int,@Name varchar(100)asbeginupdate Role setName=@Name  WHERE [Id] = @Id	SELECT * FROM [Role] WHERE Id = @Id;End;
GO
/****** Object:  StoredProcedure [dbo].[EditService]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [dbo].[EditService]
    @Id INT,
    @Name NVARCHAR(MAX)
AS
BEGIN
    -- Update the Providers table
    UPDATE [UserManagement].[dbo].[Service]
    SET [Name] = @Name,
        [UpdatedAt] = GETDATE()
    WHERE [Id] = @Id;

    -- Select records from OrganizationLocation based on the provided Id
    SELECT *
    FROM [Service]
    WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[EditUser]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[EditUserPassword]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllBookings]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllBookings]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM [dbo].[Booking];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllOrganizationLocation]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllOrganizations]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllOrganizations]
AS
BEGIN
    SELECT 
        O.Id,
        O.Name,
        O.CreatedAt,
        O.UpdatedAt,
        OL.Id AS LocationId,
        CASE 
            WHEN OL.Id IS NOT NULL THEN OL.Country
            ELSE NULL
        END AS Country,
        CASE 
            WHEN OL.Id IS NOT NULL THEN OL.State
            ELSE NULL
        END AS State,
        CASE 
            WHEN OL.Id IS NOT NULL THEN OL.City
            ELSE NULL
        END AS City,
        CASE 
            WHEN OL.Id IS NOT NULL THEN OL.Street
            ELSE NULL
        END AS Street,
        CASE 
            WHEN OL.Id IS NOT NULL THEN OL.CreatedAt
            ELSE NULL
        END AS LocationCreatedAt,
        CASE 
            WHEN OL.Id IS NOT NULL THEN OL.UpdatedAt
            ELSE NULL
        END AS LocationUpdatedAt
    FROM 
        Organization O
    LEFT JOIN 
        OrganizationLocation OL ON O.Id = OL.Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllProviders]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllProviders]
AS
BEGIN
    SELECT *
    FROM [UserManagement].[dbo].[Providers];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllRole]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetAllService]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetAllService]
AS
BEGIN
    SELECT *
    FROM [UserManagement].[dbo].[Service];
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllServiceProviders]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllServiceProviders]
AS
BEGIN
    SELECT *
    FROM ServiceProvider;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetAllUsers]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetBookingByConfirmBookingStatus]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBookingByConfirmBookingStatus]
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM [dbo].[Booking] WHERE ConfirmBooking = 1;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetBookingById]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetBookingById]
    @Id INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM [dbo].[Booking] WHERE Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetContactDetails]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetContactDetailsById]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOrganizationByContactId]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetOrganizationById]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetOrganizationById]
    @Id INT
AS
BEGIN
    SELECT 
        O.Id,
        O.Name,
        OL.Id,
        OL.Country,
        OL.State,
        OL.City,
        OL.Street
    FROM 
        Organization O
    LEFT JOIN 
        OrganizationLocation OL ON O.Id = OL.Id
    WHERE 
        O.Id = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetOrganizationLocationById]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetProviderById]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProviderById]
    @Id INT
AS
BEGIN
    SELECT *
    FROM [UserManagement].[dbo].[Providers]
    WHERE [Id] = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProvidersWithOrganizationAndLocation]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetProvidersWithOrganizationAndLocation]
AS
BEGIN  
    SELECT P.*, OL.*, O.*
    FROM Providers P
    JOIN OrganizationLocation OL ON OL.Id = OL.Id -- Adjust the join condition based on your actual column names
    JOIN Organization O ON OL.Id = O.Id; -- Adjust the join condition based on your actual column names
END;
GO
/****** Object:  StoredProcedure [dbo].[GetProvidersWithServiceLocationAndOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProvidersWithServiceLocationAndOrganization]
AS
BEGIN  
    SELECT P.*, S.*, OL.*, O.*
    FROM Providers P
    JOIN SERVICE S ON S.Id = S.Id
    JOIN OrganizationLocation OL ON S.Id = OL.Id
    JOIN Organization O ON S.Id = O.Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetRefreshToken]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetRoleById]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetServiceById]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[GetServiceById]
    @Id INT
AS
BEGIN
    SELECT *
    FROM [UserManagement].[dbo].[Service]
    WHERE [Id] = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetServiceByLocationAndOrganization]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetServiceByLocationAndOrganization]
AS
BEGIN
    SELECT S.*, L.*, O.*
    FROM SERVICE S
    JOIN OrganizationLocation L ON S.Id = L.Id
    JOIN Organization O ON S.Id = O.Id;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetServiceByLocationAndOrganizationAndProviders]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[GetServiceByLocationAndOrganizationAndProviders]
AS
BEGIN
    SELECT S.*, L.*, O.*,p.*
    FROM SERVICE S
    JOIN OrganizationLocation L ON S.Id = L.Id
    JOIN Organization O ON S.Id = O.Id
	JOIN Providers p ON P.Id = p.Id;
END;

GO
/****** Object:  StoredProcedure [dbo].[GetServiceProviderByProviderAndServiceId]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetServiceProviderByProviderAndServiceId]
    @Id INT = NULL
AS
BEGIN
    SELECT *
    FROM ServiceProvider
    WHERE ProviderId = @Id
       OR ServiceId = @Id;
END;
GO
/****** Object:  StoredProcedure [dbo].[GetUserRole]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUsersById]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[GetUsersWithoutDelete]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[RescheduleBooking]    Script Date: 19-01-2024 06:54:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RescheduleBooking]
    @Id INT,
    @Date DATETIME
AS
BEGIN
    SET NOCOUNT ON;

    UPDATE [dbo].[Booking]
    SET Date = @Date
    WHERE  Id = @Id;
	select * from [Booking] where id=@Id;

END;
GO
/****** Object:  StoredProcedure [dbo].[SearchContactDetailsWithPagination]    Script Date: 19-01-2024 06:54:16 PM ******/
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
/****** Object:  StoredProcedure [dbo].[SoftDeleteUser]    Script Date: 19-01-2024 06:54:16 PM ******/
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
