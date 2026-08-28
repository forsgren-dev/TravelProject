USE travel-db;
GO

DROP PROCEDURE IF EXISTS dbo.usp_AddOrUpdateReviewComment;
GO

-- Lägger till en review-kommentar på en attraction
-- Om @ReviewId skickas med i exekveringen så uppdateras
-- istället befintlig kommentar.

CREATE OR ALTER PROCEDURE dbo.usp_AddOrUpdateReviewComment
    @UserId UNIQUEIDENTIFIER,
    @AttractionId UNIQUEIDENTIFIER,
    @ReviewComment NVARCHAR(400),
    @ReviewId UNIQUEIDENTIFIER = NULL
AS
BEGIN
    SET NOCOUNT ON;

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

    -- Kontrollera att attraction finns
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.Attraction
        WHERE AttractionId = @AttractionId
    )
    BEGIN
        PRINT '---- ERROR: Attraction does not exist. ----';
        RETURN;
    END;

    -- Kontrollera att kommentaren inte är tom
    IF @ReviewComment IS NULL OR LTRIM(RTRIM(@ReviewComment)) = ''
    BEGIN
        PRINT '---- ERROR: Review comment cannot be empty. ----';
        RETURN;
    END;

    -- Om ReviewId skickas in så uppdateras befintlig review
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
            PRINT '---- ERROR: Review does not exist for this user and attraction. ----';
            RETURN;
        END;

        UPDATE dbo.Reviews
        SET ReviewComment = @ReviewComment,
            ReviewCreated = SYSDATETIME()
        WHERE ReviewId = @ReviewId
          AND UserId = @UserId
          AND AttractionId = @AttractionId;

        PRINT '-- Successfully updated comment. --';
        RETURN;
    END;

    -- Om ReviewId inte skickas in så skapas en ny review
    INSERT INTO dbo.Reviews
    (
        ReviewId,
        ReviewComment,
        ReviewRating,
        ReviewCreated,
        AttractionId,
        UserId
    )
    VALUES
    (
        NEWID(),
        @ReviewComment,
        NULL,
        SYSDATETIME(),
        @AttractionId,
        @UserId
    );

    PRINT '-- Successfully added comment. --';
END;
GO

-- Användning demonstreras i DEMO-SCRIPTS

-- Exekvering:

-- Plockar fram AttractionId och UserId:
-- DECLARE @AttractionId UNIQUEIDENTIFIER;
-- SELECT @AttractionId = a.AttractionId
-- FROM dbo.Attraction a
-- WHERE a.AttractionName = 'Gröna Lund';

-- DECLARE @UserId UNIQUEIDENTIFIER;
-- SELECT @UserId = u.UserId
-- FROM dbo.Users u
-- WHERE u.UserName = 'Travelking';

-- -- Plocka eventuellt fram id på senaste kommentar:
-- DECLARE @ReviewId UNIQUEIDENTIFIER = NULL;
-- -- SELECT TOP 1 @ReviewId = r.ReviewId
-- -- FROM dbo.Reviews r
-- -- WHERE r.UserId = @UserId
-- --   AND r.AttractionId = @AttractionId
-- -- ORDER BY r.ReviewCreated DESC;

-- EXEC dbo.usp_AddOrUpdateReviewComment @UserId, @AttractionId, 'Weather was bad, but the rides were fun.', @ReviewId;
-- GO




