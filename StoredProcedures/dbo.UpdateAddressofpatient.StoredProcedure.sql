USE [EHRDB]
GO
/****** Object:  StoredProcedure [dbo].[UpdateAddressofpatient]    Script Date: 1/31/2018 7:41:59 PM ******/
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
