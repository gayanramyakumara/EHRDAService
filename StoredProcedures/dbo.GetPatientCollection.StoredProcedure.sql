USE [EHRDB]
GO
/****** Object:  StoredProcedure [dbo].[GetPatientCollection]    Script Date: 1/31/2018 7:41:59 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPatientCollection]
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
WHERE [IsActive]=1
ORDER BY 
[PIN] ASC

GO
