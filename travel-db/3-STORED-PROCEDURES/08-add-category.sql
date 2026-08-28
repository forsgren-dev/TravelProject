USE forsgren;
GO

-- Stored Procedure för att lägga till kategori

CREATE OR ALTER PROCEDURE dbo.usp_AddCategory
    @AttractionId UNIQUEIDENTIFIER,
    @CategoryId UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    -- Startar try/catch och transaction
    BEGIN TRY

        BEGIN TRANSACTION
        -- Lägger till kopplingar mellan sevärdhet och kategori.
        -- NOT EXISTS gör att redan existerande kopplingar inte läggs till igen.
        INSERT INTO dbo.AttractionCategory
        (
        AttractionId, CategoryId
        )
        SELECT @AttractionId, @CategoryId
        WHERE NOT EXISTS
        (
        SELECT 1 FROM dbo.AttractionCategory ac
        WHERE ac.AttractionId = @AttractionId
        AND ac.CategoryId = @CategoryId
        );

    -- Ändringen committas
    PRINT '-- Category updated. --'
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

-- Hitta attraction-ID samt se tilldelade kategorier:

-- SELECT
--     a.AttractionId, a.AttractionName,
--     STRING_AGG(c.CategoryName, ', ') AS Categories
-- FROM dbo.Attraction a
--     LEFT OUTER JOIN dbo.AttractionCategory ac
--     ON a.AttractionId = ac.AttractionId
--     LEFT OUTER JOIN dbo.Category c
--     ON ac.CategoryId = c.CategoryId
-- GROUP BY a.AttractionId, a.AttractionName
-- ORDER BY a.AttractionName
-- GO;

-- Visa samtliga kategorier samt deras category-ID:

-- SELECT ca.CategoryId, ca.CategoryName FROM dbo.Category ca
-- GO;


-- Exekvering:

-- EXEC dbo.usp_AddCategory @AttractionId = '289316c2-cb9e-4a7a-a5c6-b8b0243454b6', @CategoryId = 'd4376eb1-f7ab-4558-a3d3-97c96bdd9536';
-- GO


-- För testning
-- DELETE FROM dbo.Reviews
-- WHERE ReviewId = '604a6f03-4e32-4684-b89b-bda4bde825d6';