USE [travel-db];
GO

-- Visar alla sevärdheter per land och ort samt eventiella användarkommentarer:

CREATE OR ALTER VIEW dbo.vw_AttractionsByCountryCityComments
AS
    SELECT 
        co.CountryName,
        c.CityName,
        a.AttractionName,
        r.ReviewComment,
        r.ReviewCreated
    FROM dbo.Attraction a
        INNER JOIN dbo.City c
        ON a.CityId = c.CityId
        INNER JOIN dbo.Country co
        ON c.CountryId = co.CountryId
        LEFT JOIN dbo.Reviews r
        ON a.AttractionId = r.AttractionId
    WHERE r.ReviewComment IS NOT NULL
        AND r.ReviewComment <> ''
    GROUP BY co.CountryName, c.CityName, a.AttractionName, r.ReviewComment,  r.ReviewCreated;
GO

-- Visning, demonstreras i DEMO-SCRIPTS:

-- SELECT * FROM dbo.vw_AttractionsByCountryCityComments;






