USE [EHRDB]
GO
/****** Object:  StoredProcedure [dbo].[GetPatientCount]    Script Date: 1/31/2018 7:41:59 PM ******/
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
