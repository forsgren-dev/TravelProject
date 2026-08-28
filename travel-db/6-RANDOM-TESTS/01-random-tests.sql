USE travel-db;
GO

SELECT *
FROM dbo.Users;
GO

-- Radera attraktion:
-- IF EXISTS (
--     SELECT 1
--     FROM dbo.Attraction
--     WHERE AttractionName = 'Globen'
-- )
-- BEGIN
--     DELETE FROM dbo.Attraction
--     WHERE AttractionName = 'Globen';
-- END;
-- GO

-- Visa reviews för en viss sevärdhet:

SELECT a.AttractionName, r.ReviewComment, r.ReviewRating, u.UserName, r.ReviewCreated
FROM dbo.Attraction a
INNER JOIN dbo.Reviews r ON a.AttractionId = r.AttractionId
INNER JOIN dbo.Users u on r.UserId = u.UserId
WHERE a.AttractionName = 'Globen'
ORDER BY r.ReviewCreated DESC;
GO

-- Alla reviews:
SELECT *
FROM dbo.Reviews;
GO

-- Sök på adress:
SELECT * FROM dbo.Attraction
WHERE AttractionStreet LIKE 'Via%';
GO

-- Alla reviews, städat:

SELECT
    a.AttractionName AS Attraction,
    c.CityName AS City,
    r.ReviewRating AS Rating,
    r.ReviewComment AS Review,
    u.UserName AS [User]
FROM dbo.Reviews r
    INNER JOIN dbo.Users u ON r.UserId = u.UserId
    INNER JOIN dbo.Attraction a ON r.AttractionId = a.AttractionId
    INNER JOIN dbo.City c ON a.CityId = c.CityId
ORDER BY a.AttractionName, r.ReviewCreated DESC;
GO


-- Två olika sätt att räkna ut genomsnittet av betyg
SELECT a.AttractionName, COUNT(r.ReviewRating) AS NrRatings, CAST(AVG(CAST(r.ReviewRating AS DECIMAL(1))) AS DECIMAL(10,1)) AS AvgRating
FROM dbo.Attraction a
    LEFT JOIN dbo.Reviews r ON r.AttractionId = a.AttractionId
GROUP BY a.AttractionName
ORDER BY NrRatings DESC

-- Med CONVERT istället för CAST
SELECT a.AttractionName, COUNT(r.ReviewRating) AS NrRatings, CONVERT(DECIMAL(2,1), AVG(1.0 * r.ReviewRating)) AS AvgRating
FROM dbo.Attraction a
    LEFT JOIN dbo.Reviews r ON r.AttractionId = a.AttractionId
GROUP BY a.AttractionName
ORDER BY NrRatings DESC


-- Alla attraktioner i en eller flera specifika kategorier 
-- (ta bort HAVING för att få med attraktioner som inte har samtliga kategorier)
SELECT a.AttractionName, STRING_AGG(c.CategoryName, ', ') AS Categories
FROM dbo.Attraction a
    INNER JOIN dbo.AttractionCategory ac ON a.AttractionId = ac.AttractionId
    INNER JOIN dbo.Category c ON ac.CategoryId = c.CategoryId
WHERE c.CategoryName IN ('Historical Site', 'Ruins')
GROUP BY a.AttractionName
HAVING COUNT(DISTINCT c.CategoryName) = 2
ORDER BY a.AttractionName

-- Skriver ut alla attraktioner för en viss kategori samt visar ev övriga kategorier för varje attraktion
SELECT
    a.AttractionName,
    STRING_AGG(c.CategoryName, ', ') AS Categories
FROM dbo.Attraction a
    INNER JOIN dbo.AttractionCategory ac
    ON a.AttractionId = ac.AttractionId
    INNER JOIN dbo.Category c
    ON ac.CategoryId = c.CategoryId
WHERE EXISTS
(
    SELECT 1
FROM dbo.AttractionCategory ac2
    INNER JOIN dbo.Category c2
    ON ac2.CategoryId = c2.CategoryId
WHERE ac2.AttractionId = a.AttractionId
    AND c2.CategoryName = 'Religious Site'
)
GROUP BY a.AttractionId, a.AttractionName
ORDER BY a.AttractionName;

-- Radera användare
DELETE FROM dbo.Users
WHERE UserName = 'MrBoat';

-- Skriver ut alla sevärdheter och deras ev kategorier

SELECT
    a.AttractionName,
    STRING_AGG(c.CategoryName, ', ') AS Categories
FROM dbo.Attraction a
    LEFT OUTER JOIN dbo.AttractionCategory ac
    ON a.AttractionId = ac.AttractionId
    LEFT OUTER JOIN dbo.Category c
    ON ac.CategoryId = c.CategoryId
GROUP BY a.AttractionId, a.AttractionName
ORDER BY a.AttractionName;

-- Visa sparade procedures:

SELECT *
FROM sys.procedures;

USE travel-db;
GO

-- Visar alla användare samt deras ev senaste ReviewDate

SELECT
    u.UserId,
    u.UserName,
    MAX(r.ReviewCreated) AS LatestReviewDate
FROM dbo.Users u
LEFT JOIN dbo.Reviews r
    ON u.UserId = r.UserId
GROUP BY
    u.UserId,
    u.UserName
ORDER BY
    LatestReviewDate;