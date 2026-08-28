USE travel-db;
GO

-- ==== STORED PROCEDURES, VG-nivå ====

-- 1. Stored procedure för att ta bort en användare, inkl dennes betyg och kommentarer 

-- Hitta användarnamn 
SELECT UserName FROM dbo.Users WHERE Username LIKE 'T%';
GO

-- Exekvering -  dbo.usp_DeleteUser:
EXEC dbo.usp_DeleteUser @UserName = 'TravelEnthusiast';
GO

-- Visa användare med ovan SELECT igen...

------------------------------------------------------------


-- 2. Stored procedure för att ta bort en sevärdhet, inkl kommentarer/betyg om denna

-- Hitta attraktionens namn
SELECT AttractionName
FROM dbo.Attraction
WHERE AttractionName LIKE 'G%';
GO

-- Exekvering - dbo.usp_DeleteAttraction:
EXEC dbo.usp_DeleteAttraction @AttractionName = 'Globen';
GO

-- Visa attraktioner på G med ovan SELECT igen...

------------------------------------------------------------


-- 3. Stored procedure för att ta bort ett betyg 

-- Visar sevärdheter och deras betyg:
SELECT a.AttractionName, r.ReviewRating, r.ReviewId, u.Username
FROM dbo.Attraction a
LEFT OUTER JOIN dbo.Reviews r ON a.AttractionId = r.AttractionId
LEFT OUTER JOIN dbo.Users u ON r.UserId = u.UserId
WHERE r.ReviewRating IS NOT NULL
ORDER BY a.AttractionName;
GO

-- Hittar betygs-ID för 'Alcatraz Island'. Lite udda sätt, men jag modifierade från ovan.
-- Detta fungerar såklart inte när det finns flera betyg, utan är bara för demo av USP:n:
DECLARE @RatId UNIQUEIDENTIFIER;
SET @RatId = (SELECT r.ReviewId
FROM dbo.Attraction a
LEFT OUTER JOIN dbo.Reviews r ON a.AttractionId = r.AttractionId
LEFT OUTER JOIN dbo.Users u ON r.UserId = u.UserId
WHERE a.AttractionName = 'Alcatraz Island'
AND r.ReviewRating IS NOT NULL);
-- Exekvering - dbo.usp_DeleteRating (Alcatraz tappar sin 4:a):
EXEC dbo.usp_DeleteRating @ReviewId = @RatId;
GO

-- Kontrollera genom att köra SELECT ovan igen.

------------------------------------------------------------


-- 3. Stored procedure för att lägga till en kategori till en sevärdhet

-- Visa id och namn på kategorier:
SELECT CategoryId, CategoryName FROM dbo.Category;
GO

-- Visa sevärdheter samt redan tilldelade kategorier:
SELECT
    a.AttractionId, a.AttractionName,
    STRING_AGG(c.CategoryName, ', ') AS Categories
FROM dbo.Attraction a
    LEFT OUTER JOIN dbo.AttractionCategory ac
    ON a.AttractionId = ac.AttractionId
    LEFT OUTER JOIN dbo.Category c
    ON ac.CategoryId = c.CategoryId
GROUP BY a.AttractionId, a.AttractionName
ORDER BY a.AttractionName;
GO

-- Exekvering - dbo.usp_AddCategory - ange attraktion resp kategori. 
-- Globen, som lades till tidigare, är NULL och får här i demo-koden 'Landmark' adderat:
DECLARE @AttId UNIQUEIDENTIFIER;
DECLARE @CatId UNIQUEIDENTIFIER;
SELECT @AttId = AttractionId FROM dbo.Attraction WHERE AttractionName = 'Globen';
SELECT @CatId = CategoryId FROM dbo.Category WHERE CategoryName = 'Landmark';

EXEC dbo.usp_AddCategory @AttractionId = @Attid, @CategoryId = @CatId;
GO

-- Visar Globen, för efterkontroll:

SELECT
    a.AttractionId, a.AttractionName,
    STRING_AGG(c.CategoryName, ', ') AS Categories
FROM dbo.Attraction a
    LEFT OUTER JOIN dbo.AttractionCategory ac
    ON a.AttractionId = ac.AttractionId
    LEFT OUTER JOIN dbo.Category c
    ON ac.CategoryId = c.CategoryId
GROUP BY a.AttractionId, a.AttractionName
HAVING a.AttractionName = 'Globen'
GO

------------------------------------------------------------

USE travel-db;
GO

-- ==== USER DEFINED FUNCTIONS, VG-nivå ====

--1. Table function som visar alla severdheter som har blivit kommenterade mellan två datum

-- Ange mellan vilka datum det gäller:
SELECT *
FROM dbo.udf_CommentsBetweenDates('2025-11-01', '2025-12-31')
ORDER BY NewestCommentDate DESC;
GO

------------------------------------------------------------

--2. Table function som visar alla sevärdheter som inte kommenterats eller betygsatts
-- sedan ett visst datum, inkl dem som är helt utan. 

-- Ange datum:
SELECT *
FROM dbo.udf_NoCommentsSinceDate('2025-12-01')
ORDER BY LatestReviewDate DESC; 
GO

------------------------------------------------------------

--3. Table funcion som inte har kommenterat eller betygsatt något
-- sedan ett visst datum. 

--Ange datum: 
SELECT * 
FROM dbo.udf_UsersWithNoCommentsSinceDate('2026-04-01')
ORDER BY LatestReviewDate DESC;
GO