USE [master]
GO
/****** Object:  Database [EHRDB]    Script Date: 1/31/2018 11:46:49 PM ******/
CREATE DATABASE [EHRDB]
GO
ALTER DATABASE [EHRDB] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EHRDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EHRDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EHRDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EHRDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EHRDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EHRDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [EHRDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EHRDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EHRDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EHRDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EHRDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EHRDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EHRDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EHRDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EHRDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EHRDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EHRDB] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [EHRDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EHRDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [EHRDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EHRDB] SET  MULTI_USER 
GO
ALTER DATABASE [EHRDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EHRDB] SET ENCRYPTION ON
GO
ALTER DATABASE [EHRDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [EHRDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [EHRDB]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [EHRDB]
GO
/****** Object:  Table [dbo].[IdGenerator]    Script Date: 1/31/2018 11:46:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IdGenerator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientID] [int] NOT NULL
)
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 1/31/2018 11:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[PIN] [varchar](10) NULL,
	[PatientName] [varchar](100) NULL,
	[NIC] [varchar](10) NULL,
	[Gender] [varchar](50) NULL,
	[Birthday] [date] NULL,
	[JoinedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[IsActive] [bit] NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[PatientAddress]    Script Date: 1/31/2018 11:46:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientAddress](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[PatientId] [int] NOT NULL,
	[AddressL1] [varchar](100) NULL,
	[AddressL2] [varchar](100) NULL,
	[AddressL3] [varchar](100) NULL,
	[PostCode] [varchar](10) NULL,
	[City] [varchar](100) NULL,
	[Country] [varchar](100) NULL,
 CONSTRAINT [PK_PatientAddress] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO
/****** Object:  Table [dbo].[PatientCredentials]    Script Date: 1/31/2018 11:46:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientCredentials](
	[PatientID] [int] NOT NULL,
	[PPassword] [varbinary](max) NOT NULL,
	[PUserName] [varchar](20) NOT NULL
)
GO
/****** Object:  Table [dbo].[StaffCredentials]    Script Date: 1/31/2018 11:46:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffCredentials](
	[StaffID] [int] NOT NULL,
	[SUsername] [varchar](20) NULL,
	[SPassword] [varbinary](max) NULL
)
GO
SET IDENTITY_INSERT [dbo].[IdGenerator] ON 

INSERT [dbo].[IdGenerator] ([ID], [PatientID]) VALUES (1, 1)
INSERT [dbo].[IdGenerator] ([ID], [PatientID]) VALUES (2, 2)
INSERT [dbo].[IdGenerator] ([ID], [PatientID]) VALUES (3, 3)
SET IDENTITY_INSERT [dbo].[IdGenerator] OFF
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([ID], [PatientId], [PIN], [PatientName], [NIC], [Gender], [Birthday], [JoinedDate], [UpdatedDate], [IsActive]) VALUES (1, 1, N'P000000001', N'Gayan Ramya Kumara', N'923322841V', N'Male', CAST(N'1992-11-27' AS Date), CAST(N'2018-01-20T00:00:00.000' AS DateTime), CAST(N'2018-01-31T22:54:00.000' AS DateTime), 1)
INSERT [dbo].[Patient] ([ID], [PatientId], [PIN], [PatientName], [NIC], [Gender], [Birthday], [JoinedDate], [UpdatedDate], [IsActive]) VALUES (2, 3, N'P000000003', N'Kasun Namal', N'973322842V', N'Male', CAST(N'1997-12-10' AS Date), CAST(N'2018-01-31T22:54:00.000' AS DateTime), CAST(N'2018-01-31T18:04:14.913' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET IDENTITY_INSERT [dbo].[PatientAddress] ON 

INSERT [dbo].[PatientAddress] ([AddressId], [PatientId], [AddressL1], [AddressL2], [AddressL3], [PostCode], [City], [Country]) VALUES (1, 1, N'Test1', N'Test2', N'test3', N'80122', N'Galle', N'SL')
INSERT [dbo].[PatientAddress] ([AddressId], [PatientId], [AddressL1], [AddressL2], [AddressL3], [PostCode], [City], [Country]) VALUES (2, 3, N'Test1ab', N'Test2ab', N'test3ab', N'00201', N'Colombo 2', N'SL')
SET IDENTITY_INSERT [dbo].[PatientAddress] OFF
INSERT [dbo].[PatientCredentials] ([PatientID], [PPassword], [PUserName]) VALUES (1, 0x00C9839EBB094146B7627C7505334D4C02000000AE03CA569D594BA464316624692915D6085C6590F1D2D0B029617BBA4753FD7F256F0B9088CEC079A0B1732ACB1D4902, N'Gayan Ramya Kumara')
INSERT [dbo].[StaffCredentials] ([StaffID], [SUsername], [SPassword]) VALUES (100, N'admin', 0x00C9839EBB094146B7627C7505334D4C0200000089B2C18461D40AFFFD9461C62FDA6F7511C1973D3A27D1967FB018CCD3DF2958A7C8C4701B7C0B9986FF8DDB743F06EB)
/****** Object:  StoredProcedure [dbo].[CheckPatientLogin]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- check user name and password are correct
CREATE PROCEDURE [dbo].[CheckPatientLogin]
(
@PUserName VARCHAR(20),
@PPassword VARCHAR(20)
)
AS
OPEN SYMMETRIC KEY SQLSymmetricKey  
DECRYPTION BY CERTIFICATE SelfSignedCertificate; 
SELECT 
c.PatientID
FROM [dbo].[PatientCredentials] c
INNER JOIN Patient p
ON
c.PatientID=p.PatientId
WHERE
c.[PUserName]=@PUserName AND
CONVERT(varchar, DecryptByKey(c.[PPassword]))=@PPassword
AND
p.IsActive=1
GO
/****** Object:  StoredProcedure [dbo].[CheckStaffLogin]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- check user name and password are correct
CREATE PROCEDURE [dbo].[CheckStaffLogin]
(
@SUserName VARCHAR(20),
@SPassword VARCHAR(20)
)
AS
OPEN SYMMETRIC KEY SQLSymmetricKey  
DECRYPTION BY CERTIFICATE SelfSignedCertificate; 
SELECT 
StaffID
FROM [dbo].[StaffCredentials]
WHERE
[SUsername]=@SUserName AND
CONVERT(varchar, DecryptByKey([SPassword]))=@SPassword
GO
/****** Object:  StoredProcedure [dbo].[DeactivatePatient]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeactivatePatient]
(
@PatientId INT
)
AS
UPDATE [dbo].[Patient]
   SET 
       [IsActive] = 0
 WHERE [PatientId]=@PatientId
GO
/****** Object:  StoredProcedure [dbo].[GetAddressOfpatient]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAddressOfpatient]
(
@PatientId INT
)
AS
SELECT [AddressId]
      ,[PatientId]
      ,[AddressL1]
      ,[AddressL2]
      ,[AddressL3]
      ,[PostCode]
      ,[City]
      ,[Country]
  FROM [dbo].[PatientAddress]
	WHERE [PatientId]=@PatientId


GO
/****** Object:  StoredProcedure [dbo].[GetNextPatientId]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- GENERATE NEW PATIENT id AND SELECT IT
CREATE PROCEDURE [dbo].[GetNextPatientId]
AS
DECLARE @maxId INT

	SELECT @maxId = MAX(PatientID) from IdGenerator

IF @maxId IS NULL OR @maxId=0
	BEGIN
		SET @maxId=1
	END
ELSE
	BEGIN 
		SET @maxId=@maxId+1
	END

INSERT INTO IdGenerator (PatientID) VALUES(@maxId)

SELECT PatientID from IdGenerator WHERE ID=SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[GetPatientById]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPatientById]
(
@PatientId INT
)
AS
SELECT [ID]
      ,[PatientId]
      ,[PIN]
      ,[PatientName]
      ,[NIC]
      ,[Gender]
      ,[Birthday]
      ,[JoinedDate]
      ,[UpdatedDate]
      ,[IsActive]
  FROM [dbo].[Patient]
WHERE [PatientId]=@PatientId


GO
/****** Object:  StoredProcedure [dbo].[GetPatientByPIN]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[GetPatientByPIN]
(
@PIN VARCHAR(10)
)
AS
SELECT [ID]
      ,[PatientId]
      ,[PIN]
      ,[PatientName]
      ,[NIC]
      ,[Gender]
      ,[Birthday]
      ,[JoinedDate]
      ,[UpdatedDate]
      ,[IsActive]
  FROM [dbo].[Patient]
WHERE [PIN]=@PIN


GO
/****** Object:  StoredProcedure [dbo].[GetPatientCollection]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPatientCollection]
AS
SELECT [ID]
      ,[PatientId]
      ,[PIN]
      ,[PatientName]
      ,[NIC]
      ,[Gender]
      ,[Birthday]
      ,[JoinedDate]
      ,[UpdatedDate]
      ,[IsActive]
  FROM [dbo].[Patient]
WHERE [IsActive]=1
ORDER BY 
[PIN] ASC

GO
/****** Object:  StoredProcedure [dbo].[GetPatientCount]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPatientCount]
AS
SELECT COUNT([PatientId]) AS TotalPatients
  FROM [dbo].[Patient]
WHERE [IsActive]=1

GO
/****** Object:  StoredProcedure [dbo].[InsertAddressofpatient]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertAddressofpatient]
(
@PatientId INT,
@AddressL1 VARCHAR(100),
@AddressL2 VARCHAR(100),
@AddressL3 VARCHAR(100),
@PostCode VARCHAR(10),
@City VARCHAR(100),
@Country VARCHAR(100)
)
AS
INSERT INTO [dbo].[PatientAddress]
           ([PatientId]
           ,[AddressL1]
           ,[AddressL2]
           ,[AddressL3]
           ,[PostCode]
           ,[City]
           ,[Country])
     VALUES
           (@PatientId
           ,@AddressL1
           ,@AddressL2
           ,@AddressL3
           ,@PostCode
           ,@City
           ,@Country)
GO
/****** Object:  StoredProcedure [dbo].[Insertpatient]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Insertpatient]
(
@PatientId INT,
@PIN VARCHAR(10),
@PatientName VARCHAR(100),
@NIC VARCHAR(10),
@Gender VARCHAR(10),
@Birthday DATE,
@JoinedDate DATETIME,
@UpdatedDate DATETIME
)
AS
INSERT INTO [dbo].[Patient]
           ([PatientId]
           ,[PIN]
           ,[PatientName]
           ,[NIC]
           ,[Gender]
           ,[Birthday]
           ,[JoinedDate]
           ,[UpdatedDate]
           ,[IsActive])
     VALUES
           (@PatientId
           ,@PIN
           ,@PatientName
           ,@NIC
           ,@Gender
           ,@Birthday
           ,@JoinedDate
           ,@UpdatedDate
           ,1)
GO
/****** Object:  StoredProcedure [dbo].[InsertPatientCredentials]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- INSERT IATIENT CREDENTIALS AND ENCRYPT THE PASSWORD
CREATE PROCEDURE [dbo].[InsertPatientCredentials]
(
@PatientID INT,
@PPassword VARCHAR(20),
@PUserName VARCHAR(20)
)
AS

OPEN SYMMETRIC KEY SQLSymmetricKey  
DECRYPTION BY CERTIFICATE SelfSignedCertificate;  

INSERT INTO [dbo].[PatientCredentials]
           ([PatientID]
           ,[PPassword]
           ,[PUserName])
     VALUES
           (@PatientID
           ,EncryptByKey(Key_GUID('SQLSymmetricKey'), @PPassword)
           ,@PUserName)


GO
/****** Object:  StoredProcedure [dbo].[UpdateAddressofpatient]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateAddressofpatient]
(
@PatientId INT,
@AddressL1 VARCHAR(100),
@AddressL2 VARCHAR(100),
@AddressL3 VARCHAR(100),
@PostCode VARCHAR(10),
@City VARCHAR(100),
@Country VARCHAR(100)
)
AS
UPDATE [dbo].[PatientAddress]
   SET 
      [AddressL1] = @AddressL1
      ,[AddressL2] =@AddressL2
      ,[AddressL3] =@AddressL3
      ,[PostCode] = @PostCode
      ,[City] = @City
      ,[Country] = @Country
 WHERE [PatientId]=@PatientId
GO
/****** Object:  StoredProcedure [dbo].[UpdatePatient]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[UpdatePatient]
(
@PatientId INT,
@PatientName VARCHAR(100),
@NIC VARCHAR(10),
@Gender VARCHAR(10),
@Birthday DATE,
@UpdatedDate DATETIME,
@IsActive BIT
)
AS
UPDATE [dbo].[Patient]
   SET 
      [PatientName] = @PatientName
      ,[NIC] = @NIC
      ,[Gender] = @Gender
      ,[Birthday] = @Birthday
      ,[UpdatedDate] = @UpdatedDate
      ,[IsActive] = 1
 WHERE [PatientId]=@PatientId
GO
/****** Object:  StoredProcedure [dbo].[UpdatePatientCredentials]    Script Date: 1/31/2018 11:46:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- UPDATE PATIENT CREDENTIALS AND ENCRYPT THE PASSWORD
CREATE PROCEDURE [dbo].[UpdatePatientCredentials]
(
@PatientID INT,
@PPassword VARCHAR(20)
)
AS
OPEN SYMMETRIC KEY SQLSymmetricKey  
DECRYPTION BY CERTIFICATE SelfSignedCertificate; 
UPDATE [dbo].[PatientCredentials]
   SET 
      [PPassword] = EncryptByKey(Key_GUID('SQLSymmetricKey'), @PPassword)
 WHERE [PatientID] = @PatientID



GO
USE [master]
GO
ALTER DATABASE [EHRDB] SET  READ_WRITE 
GO
