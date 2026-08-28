USE forsgren;
GO

-- User Defined (table) Function för att visa sevärdheter som inte har 
-- kommenterats eller betgsatts sedan ett visst datum, vilket är inparameter i funktionen:

CREATE OR ALTER FUNCTION dbo.udf_NoCommentsSinceDate
(
    @SinceDate DATETIME2
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
        -- Tar fram senaste ReviewCreated för varje attraktion
        -- Blir NULL om ingen review alls finns
        ( SELECT MAX(r.ReviewCreated)
          FROM dbo.Reviews r
          WHERE r.AttractionId = a.AttractionId) AS LatestReviewDate
    FROM dbo.Attraction a
    INNER JOIN dbo.City ci ON a.CityId = ci.CityId
    INNER JOIN dbo.Country co ON ci.CountryId = co.CountryId
    -- Urvalskriteriet för svaret är att det inte ska finnas någon review med nyare ReviewCreated än @SinceDate
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.Reviews r
        WHERE r.AttractionId = a.AttractionId
          AND r.ReviewCreated > @SinceDate
    )
);
GO

-- Användning, demonstreras i DEMO-SCRIPTS:

-- SELECT *
-- FROM dbo.udf_NoCommentsSinceDate('2025-08-01');