USE forsgren;
GO

INSERT INTO dbo.City
    (CityName, CountryId)
VALUES
    -- Italy
    ('Rome', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Italy')),
    ('Florence', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Italy')),
    ('Venice', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Italy')),

    -- Spain
    ('Barcelona', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Spain')),
    ('Madrid', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Spain')),
    ('Seville', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Spain')),

    -- Germany
    ('Berlin', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Germany')),
    ('Munich', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Germany')),
    ('Cologne', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Germany')),

    -- UK
    ('London', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'United Kingdom')),
    ('Edinburgh', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'United Kingdom')),
    ('Bath', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'United Kingdom')),

    -- USA
    ('New York', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'United States')),
    ('Washington DC', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'United States')),
    ('San Francisco', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'United States')),

    -- Swe
    ('Stockholm', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Sweden')),
    ('Gothenburg', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Sweden')),
    ('Malmö', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Sweden')),

    -- Denmark
    ('Copenhagen', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Denmark')),
    ('Aarhus', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Denmark')),

    -- Switzerland
    ('Zurich', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Switzerland')),
    ('Geneva', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Switzerland')),
    ('Lucerne', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Switzerland')),

    -- Austria
    ('Vienna', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Austria')),
    ('Salzburg', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Austria')),
    ('Innsbruck', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Austria')),

    -- Greece
    ('Athens', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Greece')),
    ('Thessaloniki', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Greece')),
    ('Santorini', (SELECT CountryId
        FROM dbo.Country
        WHERE CountryName = 'Greece'));
PRINT '-- Table ''City'' populated. --';
GO