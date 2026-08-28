USE travel-db;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE dbo.Reviews
(
	[ReviewId] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
	[ReviewComment] NVARCHAR(400) NULL,
	[ReviewRating] INT NULL,
	[ReviewCreated] DATETIME2(0) NOT NULL DEFAULT SYSUTCDATETIME(),
	[AttractionId] UNIQUEIDENTIFIER NOT NULL,
	[UserId] UNIQUEIDENTIFIER NOT NULL,

	CONSTRAINT PK_Review PRIMARY KEY (ReviewId),

	CONSTRAINT CK_Review_Rating CHECK (ReviewRating IS NULL OR ReviewRating BETWEEN 1 AND 5),

	CONSTRAINT FK_Review_Attraction 
        FOREIGN KEY (AttractionId) 
        REFERENCES dbo.Attraction(AttractionId),

		CONSTRAINT FK_Review_User 
        FOREIGN KEY (UserId) 
        REFERENCES dbo.Users(UserId)
		 ON DELETE CASCADE
);
PRINT '-- Table ''Reviews'' created. --';
GO

