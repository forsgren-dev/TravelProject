USE [travel-db];
GO


-- Visar alla sevärdheter per land och ort samt dess medelbetyg:

CREATE OR ALTER VIEW dbo.vw_AttractionsByCountryCityRating
AS
    SELECT
        co.CountryName,
        c.CityName,
        a.AttractionName,
        CONVERT(DECIMAL(2,1), AVG(1.0 * r.ReviewRating)) AS AvgRating
    FROM dbo.Attraction a
        INNER JOIN dbo.City c
        ON a.CityId = c.CityId
        INNER JOIN dbo.Country co
        ON c.CountryId = co.CountryId
        LEFT JOIN dbo.Reviews r
        ON a.AttractionId = r.AttractionId
    GROUP BY
    co.CountryName,
    c.CityName,
    a.AttractionName;
GO

-- Visning, demonstreras i DEMO-SCRIPTS:

-- SELECT * FROM dbo.vw_AttractionsByCountryCityRating;


-- -- Enbart med betyg:
-- SELECT *
-- FROM dbo.vw_AttractionsByCountryCityRating
-- WHERE AvgRating IS NOT NULL;