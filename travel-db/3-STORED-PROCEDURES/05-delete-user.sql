USE [travel-db];
GO

-- DROP PROCEDURE IF EXISTS dbo.usp_DeleteUser;
-- GO


-- Stored Procedure för att radera användare

CREATE OR ALTER PROCEDURE dbo.usp_DeleteUser
    @UserName NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    -- Startar try/catch och transaction
    BEGIN TRY

        BEGIN TRANSACTION
        -- Om användarnamnet i inparametern inte hittas i db så skrivs felet ut 
        -- och det blir en rollback
        IF NOT EXISTS (
            SELECT 1 FROM dbo.Users u
            WHERE u.Username = @UserName
        )
        BEGIN
            PRINT '---- ERROR: User ' + @UserName + ' does not exist. ----'
            ROLLBACK TRANSACTION
            RETURN;
        END;

    -- Om namnet hittas så används det för att ta fram det unika användar-id:t
    -- som en extra säkerhetsåtgärd
    DECLARE @UserId UNIQUEIDENTIFIER;

    -- Använder här den andra varianten istället för SET @UserId = (SELECT....)
    SELECT @UserId = UserId FROM dbo.Users
    WHERE UserName = @UserName;

    -- Därefter raderas reviews gjorda med detta id
    -- och slutligen användaren 
    DELETE FROM dbo.Reviews
    WHERE UserId = @UserId;

    DELETE FROM dbo.Users  
    WHERE UserId = @UserId

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

-- SELECT UserName FROM dbo.Users WHERE Username LIKE 'W%';

-- Exekvering:

-- EXEC dbo.usp_DeleteUser @UserName = 'WeekendNomad';





