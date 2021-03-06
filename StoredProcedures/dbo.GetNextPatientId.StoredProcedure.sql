USE [EHRDB]
GO
/****** Object:  StoredProcedure [dbo].[GetNextPatientId]    Script Date: 1/31/2018 7:41:59 PM ******/
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
