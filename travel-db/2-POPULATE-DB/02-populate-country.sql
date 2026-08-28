USE travel-db;
GO

INSERT INTO dbo.Country
    (CountryName)
VALUES
    ('Italy'),
    ('Spain'),
    ('Germany'),
    ('United Kingdom'),
    ('United States'),
    ('Sweden'),
    ('Denmark'),
    ('Switzerland'),
    ('Austria'),
    ('Greece');
PRINT '-- Table ''Country'' populated. --';
GO