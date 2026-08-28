USE travel-db;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE dbo.AttractionCategory
(
	[AttractionId] UNIQUEIDENTIFIER NOT NULL,
	[CategoryId] UNIQUEIDENTIFIER NOT NULL,
	

	CONSTRAINT PK_AttractionCategory PRIMARY KEY (AttractionId, CategoryId),

	CONSTRAINT FK_AttractionCategory_Attraction 
        FOREIGN KEY (AttractionId) 
        REFERENCES dbo.Attraction(AttractionId)
        ON DELETE CASCADE,

    CONSTRAINT FK_AttractionCategory_Category 
        FOREIGN KEY (CategoryId) 
        REFERENCES dbo.Category(CategoryId)
        ON DELETE CASCADE            

);
PRINT '-- Table ''JOIN-table AttractionCategory'' created. --';
GO


