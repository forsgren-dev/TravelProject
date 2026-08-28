USE travel-db;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE dbo.Country
(
	[CountryId] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[CountryName] [nvarchar](200) NOT NULL,

	CONSTRAINT PK_Country PRIMARY KEY (CountryId)
);
PRINT '-- Table ''Country'' created. --';
GO

