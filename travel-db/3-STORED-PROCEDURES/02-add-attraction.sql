USE forsgren;
GO

DROP PROCEDURE IF EXISTS dbo.usp_AddAttraction;
GO

-- USP som lägger till en ny attraktion

CREATE PROCEDURE dbo.usp_AddAttraction
    @AttractionName NVARCHAR(200),
    @AttractionDescription NVARCHAR(400),
    @AttractionStreet NVARCHAR(200),
    @AttractionZip NVARCHAR(100),
    @CityId UNIQUEIDENTIFIER
AS
BEGIN
    SET NOCOUNT ON;

    -- Kontrollerar att attraktionen namngivits:

    IF @AttractionName IS NULL OR @AttractionName = ''
    BEGIN
        PRINT '---- ERROR: Attraction name must be defined. ----';
        RETURN;
    END;

    -- Kontrollerar att attraktionen har beskrivning:

     IF @AttractionDescription IS NULL OR @AttractionDescription = ''
    BEGIN
        PRINT '---- ERROR: Attraction description must be defined. ----';
        RETURN;
    END;

-- Kontrollerar så att staden finns:
    IF NOT EXISTS (
        SELECT 1
        FROM dbo.City
        WHERE CityId = @CityId
    )
    BEGIN
        PRINT '---- ERROR: City does not exist in database. ----';
        RETURN;
    END;

-- Kontrollerar om attraktionen redan finns:

    IF EXISTS (
        SELECT 1
        FROM dbo.Attraction
        WHERE AttractionName = @AttractionName
    )
    BEGIN
        PRINT '---- ERROR: The attraction is already in the database. ----';
        RETURN;
    END;


    INSERT INTO dbo.Attraction (
        AttractionId,
        AttractionName,
        AttractionDescription,
        AttractionStreet,
        AttractionZip,
        CityId
    )
    VALUES (
        NEWID(),
        @AttractionName,
        @AttractionDescription,
        @AttractionStreet,
        @AttractionZip,
        @CityId
    );

    PRINT '-- Successfully added attraction ''' + @AttractionName + ''' to database. --';
END;
GO

-- Användning demonstreras i DEMO-SCRIPTS

-- Exekvering:

-- Raderar attraktionen om den redan finns (för testning)
-- IF EXISTS (
--     SELECT 1
--     FROM dbo.Attraction
--     WHERE AttractionName = 'Gröna Lund'
-- )
-- BEGIN
--     DELETE FROM dbo.Attraction
--     WHERE AttractionName = 'Gröna Lund';
-- END;
-- GO

-- USE forsgren;
-- GO

-- -- Plockar fram CityId för Stockholm:
-- DECLARE @CityId UNIQUEIDENTIFIER;
-- SET @CityId = (SELECT c.CityId FROM dbo.City c WHERE c.CityName = 'Stockholm'); 

-- EXEC dbo.usp_AddAttraction 'Gröna Lund', 'Amusement park for all ages in central Stockholm', 'Lilla Allmänna Gränd 9', '115 21', @CityId;
-- GO




