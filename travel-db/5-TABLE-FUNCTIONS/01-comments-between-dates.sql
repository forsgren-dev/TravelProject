USE travel-db;
GO

-- User Defined (table) Function för att visa sevärdheter som har 
-- kommenterats mellan två datum, vilka är inparametrar i funktionen.
-- Använder DATETIME2 då det är Microsofts rekommendation för nya projekt pga
-- dess högre noggrannhet. Millisekundrar är dock bortskalade i kolumnen ReviewCreated:

CREATE OR ALTER FUNCTION dbo.udf_CommentsBetweenDates
(
    @StartDate DATETIME2,
    @EndDate   DATETIME2
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        a.AttractionId,
        a.AttractionName,
        ci.CityName,
        co.CountryName,
        -- Samlar tilldelade kategorier i en kolumn
        STRING_AGG(c.CategoryName, ', ') AS Categories,
        -- Plockar fram högsta (senaste) datum/tid för kommentarer
        MAX(r.ReviewCreated) AS NewestCommentDate
    FROM dbo.Attraction a
    -- Inner-joinar där det inte får vara NULL medan kategori kan vara det, därmed outer join på dessa 
    INNER JOIN dbo.Reviews r                  ON a.AttractionId = r.AttractionId
    INNER JOIN dbo.City ci                    ON a.CityId = ci.CityId
    INNER JOIN dbo.Country co                 ON ci.CountryId = co.CountryId
    LEFT OUTER JOIN dbo.AttractionCategory ac ON a.AttractionId = ac.AttractionId
    LEFT OUTER JOIN dbo.Category c            ON ac.CategoryId = c.CategoryId
    -- Här sker urvalet mellan de inskickade datumen
    WHERE r.ReviewCreated BETWEEN @StartDate AND @EndDate
    GROUP BY
        a.AttractionId,
        a.AttractionName,
        ci.CityName,
        co.CountryName
);
GO

-- Användning, demonstreras i DEMO-SCRIPTS:

-- SELECT *
-- FROM dbo.udf_CommentsBetweenDates('2025-01-01', '2025-12-31')
-- ORDER BY NewestCommentDate DESC;