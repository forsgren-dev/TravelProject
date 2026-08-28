USE [travel-db];
GO

DROP PROCEDURE IF EXISTS dbo.usp_AddOrUpdateReviewRating;
GO

-- Lägger till eller uppdaterar en rating från en användare:
-- Om @ReviewId skickas in så uppdateras befintlig rating.
-- Om det istället är NULL så skapas en ny review med rating.
CREATE OR ALTER PROCEDURE dbo.usp_AddOrUpdateReviewRating
    @UserId UNIQUEIDENTIFIER,
    @AttractionId UNIQUEIDENTIFIER,
    @ReviewRating INT,
    @ReviewId UNIQUEIDENTIFIER = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- Kontrollera rating
    IF @ReviewRating < 1 OR @ReviewRating > 5
    BEGIN
        PRINT '---- ERROR: Rating must be between 1 and 5. ----';
        RETURN;
    END;

    -- Kontrollera att användaren finns
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.Users
        WHERE UserId = @UserId
    )
    BEGIN
        PRINT '---- ERROR: User does not exist. ----';
        RETURN;
    END;

    -- Kontrollera att attraktionen finns
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.Attraction
        WHERE AttractionId = @AttractionId
    )
    BEGIN
        PRINT '---- ERROR: Attraction does not exist. ----';
        RETURN;
    END;

    -- Om ReviewId skickas in så uppdateras den review:n
    IF @ReviewId IS NOT NULL
    BEGIN
        IF NOT EXISTS (
            SELECT 1
            FROM dbo.Reviews
            WHERE ReviewId = @ReviewId
              AND UserId = @UserId
              AND AttractionId = @AttractionId
        )
        BEGIN
            PRINT '---- ERROR: Invalid review ID. ----';
            RETURN;
        END;

        UPDATE dbo.Reviews
        SET ReviewRating = @ReviewRating,
            ReviewCreated = SYSDATETIME()
        WHERE ReviewId = @ReviewId
          AND UserId = @UserId
          AND AttractionId = @AttractionId;

        PRINT '-- Successfully updated rating. --';
        RETURN;
    END;

    -- Om ReviewId inte skickas in skapas en ny review med rating
    INSERT INTO dbo.Reviews (
        ReviewId,
        ReviewComment,
        ReviewRating,
        ReviewCreated,
        AttractionId,
        UserId
    )
    VALUES (
        NEWID(),
        NULL,
        @ReviewRating,
        SYSDATETIME(),
        @AttractionId,
        @UserId
    );

    PRINT '-- Successfully added rating. --';
END;
GO

-- Användning demonstreras i DEMO-SCRIPTS

-- Exekvering:

-- Plockar fram AttractionId och UserId
-- Ange sevärdhetens namn och användarens namn:
-- DECLARE @AttractionId UNIQUEIDENTIFIER;
-- SET @AttractionId = (SELECT a.AttractionId
-- FROM dbo.Attraction a
-- WHERE a.AttractionName = 'Bath Abbey');

-- DECLARE @UserId UNIQUEIDENTIFIER;
-- SET @UserId = (SELECT u.UserId
-- FROM dbo.Users u
-- WHERE u.UserName = 'GlobeTrotterX');


-- -- Ange eventuellt ReviewId (eller avkommentera koden för att plocka fram senast inlagda)
-- -- för att uppdatera en befintlig review. Annars skapas en ny:

-- DECLARE @ReviewId UNIQUEIDENTIFIER = NULL;
-- -- SELECT TOP 1 @ReviewId = r.ReviewId
-- -- FROM dbo.Reviews r
-- --      WHERE r.UserId = @UserId
-- --      AND r.AttractionId = @AttractionId
-- -- ORDER BY r.ReviewCreated DESC;

-- -- Här körs slutligen exekveringen. Nu fick det bli magic number för betyget:

-- EXEC dbo.usp_AddOrUpdateReviewRating @UserId, @AttractionId, 4, @ReviewId;
-- GO




