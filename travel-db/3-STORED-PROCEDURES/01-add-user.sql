USE forsgren;
GO

DROP PROCEDURE IF EXISTS dbo.usp_AddUser;
GO

-- USP som lägger till en ny användare

CREATE PROCEDURE dbo.usp_AddUser
    @UserName NVARCHAR(200)
AS
BEGIN
    SET NOCOUNT ON;

    -- Kontrollerar så användarnamnet inte är tomt:

    IF @UserName IS NULL OR @UserName = ''
    BEGIN
        PRINT '---- ERROR: Username must be defined. ----';
        RETURN;
    END;

    -- Kontrollerar så att användarnamnet inte är upptaget:

     IF EXISTS (SELECT 1 FROM dbo.Users u WHERE u.UserName = @UserName)
    BEGIN
        PRINT '---- ERROR: Username already exists. ----';
        RETURN;
    END;

    INSERT INTO dbo.Users
        (
        UserId,
        UserName
        )
    VALUES
        (
            NEWID(),
            @UserName
    );
    PRINT '-- Successfully added ''' + @UserName + ''' to database. --';
END;
GO

-- Användning demonstreras i DEMO-SCRIPTS

-- Exekvering:

-- EXEC dbo.usp_AddUser 'WeekendNomad';



