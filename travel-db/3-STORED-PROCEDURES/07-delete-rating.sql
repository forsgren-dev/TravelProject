USE travel-db;
GO


-- Stored Procedure för att radera betyg

CREATE OR ALTER PROCEDURE dbo.usp_DeleteRating
    @ReviewId UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    -- Startar try/catch och transaction
    BEGIN TRY

        BEGIN TRANSACTION
        -- Om id:t inte hittas i db så skrivs felet ut 
        -- och det körs en rollback
        IF NOT EXISTS (
            SELECT 1
    FROM dbo.Reviews r
    WHERE r.ReviewId = @ReviewId
        )
        BEGIN
        PRINT '---- ERROR: Invalid review-ID. ----'
        ROLLBACK TRANSACTION
        RETURN;
    END;

  
       -- Tar bort betyg
    UPDATE dbo.Reviews
    SET ReviewRating = NULL
    WHERE ReviewId = @ReviewId

    -- Ändringen committas
    COMMIT TRANSACTION
END TRY

-- Eventuella andra fel fångas upp av catch och det körs en rollback
BEGIN CATCH
    
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;

    PRINT '--- ERROR: Something went wrong. ---'
END CATCH
END;
GO

-- Användning demonstreras i DEMO-SCRIPTS

-- Hitta betygs-ID samt kontrollera när det har tagits bort:

-- SELECT a.AttractionName, r.ReviewRating, r.ReviewId, u.Username
-- FROM dbo.Attraction a
-- LEFT OUTER JOIN dbo.Reviews r ON a.AttractionId = r.AttractionId
-- LEFT OUTER JOIN dbo.Users u ON r.UserId = u.UserId
-- ORDER BY a.AttractionName;


-- Exekvering:

-- EXEC dbo.usp_DeleteRating @ReviewId = '604a6f03-4e32-4684-b89b-bda4bde825d6';


-- För testning
-- DELETE FROM dbo.Reviews
-- WHERE ReviewId = '604a6f03-4e32-4684-b89b-bda4bde825d6';