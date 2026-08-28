USE master;
GO
-- Säkerställer att databasen kan droppas även om det finns 
-- aktiva anslutningar:
IF EXISTS (
    SELECT 1
    FROM sys.databases
    WHERE name = 'travel-db'
)
BEGIN
    ALTER DATABASE travel-db
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;
END

DROP DATABASE IF EXISTS travel-db;
PRINT '-- Database ''travel_db'' deleted! --'
GO


