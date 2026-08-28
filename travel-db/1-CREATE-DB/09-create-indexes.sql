USE forsgren;
GO


-- Indexerar foreign keys:

CREATE INDEX IX_Attraction_CityId
ON dbo.Attraction(CityId);

CREATE INDEX IX_City_CountryId
ON dbo.City(CountryId);

CREATE INDEX IX_Reviews_AttractionId
ON dbo.Reviews(AttractionId);

CREATE INDEX IX_Reviews_UserId
ON dbo.Reviews(UserId);

-- Omvänd ordning för joinade ID:s

CREATE INDEX IX_AttractionCategory_CategoryId_AttractionId
ON dbo.AttractionCategory(CategoryId, AttractionId);
PRINT '-- Indexes created. --';
GO