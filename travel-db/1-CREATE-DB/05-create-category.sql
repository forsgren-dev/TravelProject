USE forsgren;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Category
(
	[CategoryId] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	[CategoryName] NVARCHAR(200) NOT NULL,
	
	CONSTRAINT PK_Category PRIMARY KEY (CategoryId)

);
PRINT '-- Table ''Category'' created. --';
GO



