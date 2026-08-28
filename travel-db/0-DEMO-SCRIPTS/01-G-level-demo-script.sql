USE forsgren;
GO

-- ==== STORED PROCEDURES, G-nivå ====

-- 1. Stored procedure för att lägga till användare

-- Ändra @NewUser till valfritt användarnamn:

DECLARE @NewUser NVARCHAR(200);

SET @NewUser = 'WeekendNomad'

EXEC dbo.usp_AddUser @NewUser;
GO

-- Visa användaren:

SELECT * FROM dbo.Users WHERE UserName = 'WeekendNomad';

------------------------------------------------------------

-- 2. Stored procedure för att lägga till attraktion

-- Lista städer vid behov:
-- SELECT c.CityName FROM dbo.City c;

DECLARE @CityId UNIQUEIDENTIFIER;
DECLARE @CityName NVARCHAR(200);
DECLARE @AttractionName NVARCHAR(200);
DECLARE @AttractionDescription NVARCHAR(400);
DECLARE @AttractionStreet NVARCHAR(400) -- Får vara NULL
DECLARE @AttractionZip NVARCHAR(200) -- Får vara NULL

-- Ändra @CityName till valfri stad: 
SET @CityName = 'Stockholm';

-- Ange attraktionens namn i @AttractionName:
SET @AttractionName = 'Globen';

-- Lägg till beskrivning i @AttractionDescription:
SET @AttractionDescription = 'Unique indoor arena that looks like a golf ball.'

-- Lägg till eventuell gatuadress istället för NULL:
SET @AttractionStreet = NULL;

-- Lägg till eventuellt postnummer (får vara NULL):
SET @AttractionZip = '121 77';

-- Hämtar CityId för namngiven stad
SET @CityId = (SELECT c.CityId FROM dbo.City c WHERE c.CityName = @CityName); 

-- Stored Procedure exekveras
EXEC dbo.usp_AddAttraction @AttractionName, @AttractionDescription, @AttractionStreet, @AttractionZip, @CityId;
GO

-- Visa attraktionen:

SELECT * FROM dbo.Attraction WHERE AttractionName = 'Globen';

------------------------------------------------------------

-- 3. Stored procedure för att lägga till kommentar:

-- Lista användare och attraktioner vid behov:
-- SELECT UserName FROM dbo.Users ORDER BY UserName;
-- SELECT AttractionName FROM dbo.Attraction ORDER BY AttractionName;

-- Ange attraktionens namn, användarens namn samt ny kommentar 
-- (enklare för användaren än att plocka fram user- och attraction-id):
DECLARE @AttractionName NVARCHAR(200) = 'Globen'
DECLARE @UserName NVARCHAR(200) = 'WeekendNomad';
DECLARE @ReviewComment NVARCHAR(400) = 'A huge white ball! Cool arena.';

-- Tar fram id för attraktion och användare
DECLARE @AttractionId UNIQUEIDENTIFIER;
SELECT @AttractionId = a.AttractionId
FROM dbo.Attraction a
WHERE a.AttractionName = @AttractionName;

DECLARE @UserId UNIQUEIDENTIFIER;
SELECT @UserId = u.UserId
FROM dbo.Users u
WHERE u.UserName = @UserName;

-- Ta eventuellt fram id på senaste kommentar för att uppdatera den.
-- Om ReviewId är NULL så skapas det istället en ny review med kommentar.
DECLARE @ReviewId UNIQUEIDENTIFIER = NULL;
-- Om koden nedan avkommenteras så redigeras användarens senaste review.

-- SELECT TOP 1 @ReviewId = r.ReviewId
-- FROM dbo.Reviews r
-- WHERE r.UserId = @UserId
--   AND r.AttractionId = @AttractionId
-- ORDER BY r.ReviewCreated DESC;

EXEC dbo.usp_AddOrUpdateReviewComment @UserId, @AttractionId, @ReviewComment, @ReviewId;
GO

-- Visa kommentaren:

SELECT * FROM dbo.Reviews WHERE AttractionId = (SELECT AttractionId FROM dbo.Attraction WHERE AttractionName = 'Globen');

------------------------------------------------------------

-- 4. Stored procedure för att lägga till/uppdatera rating

-- Ange attraktionens namn, användarens namn samt ny rating:
DECLARE @AttractionName NVARCHAR(200) = 'Globen'
DECLARE @UserName NVARCHAR(200) = 'WeekendNomad';
DECLARE @ReviewRating INT = 3;

-- Tar fram attraktionens id utifrån angivet namn
DECLARE @AttractionId UNIQUEIDENTIFIER;
SET @AttractionId = (SELECT a.AttractionId
FROM dbo.Attraction a
WHERE a.AttractionName = @AttractionName);

DECLARE @UserId UNIQUEIDENTIFIER;
SET @UserId = (SELECT u.UserId
FROM dbo.Users u
WHERE u.UserName = @UserName);

-- Ange ReviewId istället för NULL för att uppdatera en befintlig review med
-- ett betyg. Annars skapas en ny review. Koden nedan kan avkommenteras för
-- att uppdatera användarens senaste review.
DECLARE @ReviewId UNIQUEIDENTIFIER = NULL;

-- SELECT TOP 1 @ReviewId = r.ReviewId
-- FROM dbo.Reviews r
-- WHERE r.UserId = @UserId
--   AND r.AttractionId = @AttractionId
-- ORDER BY r.ReviewCreated DESC;

EXEC dbo.usp_AddOrUpdateReviewRating @UserId, @AttractionId, @ReviewRating, @ReviewId;
GO

-- Visa rating:

SELECT * FROM dbo.Reviews WHERE AttractionId = (SELECT AttractionId FROM dbo.Attraction WHERE AttractionName = 'Globen') AND ReviewRating IS NOT NULL;


------------------------------------------------------------

USE forsgren;
GO

-- ==== VIEWS, G-nivå ====

-- 1 Visa alla sevärdheter per land, ort samt medelrating

SELECT * FROM dbo.vw_AttractionsByCountryCityRating;


-- 2 Visa alla sevärdheter som inte har någon kommentar

SELECT * FROM dbo.vw_AttractionsWithoutComments
ORDER BY CountryName;


-- 3 Visa alla sevärdheter per land, ort samt eventuella kommentarer

SELECT * FROM dbo.vw_AttractionsByCountryCityComments;


-- 4 Visar alla användare, deras ev kommentarer och/eller betyg:

SELECT * FROM dbo.vw_UsersAndReviews;
GO
