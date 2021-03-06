USE [EHRDB]
GO
/****** Object:  StoredProcedure [dbo].[Insertpatient]    Script Date: 1/31/2018 7:41:59 PM ******/
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
