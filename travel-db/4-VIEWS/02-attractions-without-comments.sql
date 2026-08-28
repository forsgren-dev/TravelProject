USE travel-db;
GO

-- Visar alla sevärdheter som inte har några kommentarer

CREATE OR ALTER VIEW dbo.vw_AttractionsWithoutComments
AS
    SELECT
        a.AttractionId,
        a.AttractionName,
        a.AttractionDescription,
        a.AttractionStreet,
        a.AttractionZip,
        c.CityName,
        co.CountryName
    FROM dbo.Attraction a
    INNER JOIN dbo.City c ON a.CityId = c.CityId
    INNER JOIN dbo.Country co ON c.CountryId = co.CountryId
    WHERE NOT EXISTS (
    SELECT 1
    FROM dbo.Reviews r
    WHERE r.AttractionId = a.AttractionId
        AND r.ReviewComment IS NOT NULL
        AND r.ReviewComment <> ''
);
GO

-- Visning, demonstreras i DEMO-SCRIPTS:

-- SELECT * FROM dbo.vw_AttractionsWithoutComments;




