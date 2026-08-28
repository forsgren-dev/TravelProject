USE [travel-db];
GO

-- DROP PROCEDURE IF EXISTS dbo.usp_DeleteUser;
-- GO


-- Stored Procedure för att radera användare

CREATE OR ALTER PROCEDURE dbo.usp_DeleteAttraction
    @AttractionName NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    -- Startar try/catch och transaction
    BEGIN TRY

        BEGIN TRANSACTION
        -- Om namnet i inparametern inte hittas i db så skrivs felet ut 
        -- och det körs en rollback
        IF NOT EXISTS (
            SELECT 1
    FROM dbo.Attraction a
    WHERE a.AttractionName = @AttractionName
        )
        BEGIN
        PRINT '---- ERROR: Attraction' + @AttractionName + ' does not exist. ----'
        ROLLBACK TRANSACTION
        RETURN;
    END;

    -- Om namnet hittas så används det för att ta fram det unika attraktions-id:t
    -- som en extra säkerhetsåtgärd
    DECLARE @AttractionId UNIQUEIDENTIFIER;

     -- Använder här den andra varianten istället för SET @UserId = (SELECT....)
    SELECT @AttractionId = AttractionId
    FROM dbo.Attraction
    WHERE AttractionName = @AttractionName;

       -- Tar bort recensioner/betyg
        DELETE FROM dbo.Reviews
        WHERE AttractionId = @AttractionId;

        -- Tar bort kategori-kopplingar
        DELETE FROM dbo.AttractionCategory
        WHERE AttractionId = @AttractionId;

        -- Tar bort sevärdheten
        DELETE FROM dbo.Attraction
        WHERE AttractionId = @AttractionId;

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

-- Hitta namn

-- SELECT AttractionName
-- FROM dbo.Attraction
-- WHERE AttractionName LIKE 'G%';

-- Exekvering:

-- EXEC dbo.usp_DeleteAttraction @AttractionName = 'Gröna Lund';





