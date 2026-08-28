USE [travel-db];
GO

DELETE FROM dbo.Category;
GO

INSERT INTO dbo.Category
    (CategoryName)
VALUES
    ('Art'),
    ('Museum'),
    ('Historical Site'),
    ('Religious Site'),
    ('Theater'),
    ('Ruins'),
    ('Park'),
    ('Landmark'),
    ('Entertainment'),
    ('Shopping'),
    ('Food & Drink'),
    ('Nature'),
    ('Other');

PRINT '-- Table ''Category'' populated. --';   
GO