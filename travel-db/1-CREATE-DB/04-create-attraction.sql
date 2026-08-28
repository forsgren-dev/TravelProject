USE travel-db;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.Attraction
(
	[AttractionId] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	[AttractionName] NVARCHAR(200) NOT NULL,
	[AttractionDescription] NVARCHAR(400) NOT NULL,
	[AttractionStreet] NVARCHAR(200) NULL,
	[AttractionZip] NVARCHAR(100) NULL,
	[CityId] UNIQUEIDENTIFIER NOT NULL,

	CONSTRAINT PK_Attraction PRIMARY KEY (AttractionId),

	CONSTRAINT FK_Attraction_City 
        FOREIGN KEY (CityId) 
        REFERENCES dbo.City(CityId)
        ON DELETE CASCADE

);
PRINT '-- Table ''Attraction'' created. --';
GO


