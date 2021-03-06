USE [EHRDB]
GO
/****** Object:  StoredProcedure [dbo].[UpdatePatient]    Script Date: 1/31/2018 7:41:59 PM ******/
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
      ,[IsActive] = @IsActive
 WHERE [PatientId]=@PatientId
GO
