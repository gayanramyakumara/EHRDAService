USE [EHRDB]
GO
/****** Object:  StoredProcedure [dbo].[GetAddressOfpatient]    Script Date: 1/31/2018 7:41:59 PM ******/
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
