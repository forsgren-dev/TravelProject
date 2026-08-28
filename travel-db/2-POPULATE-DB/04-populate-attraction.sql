USE travel-db;
GO

INSERT INTO dbo.Attraction
    (AttractionName, AttractionDescription, AttractionStreet, AttractionZip, CityId)
VALUES
    -- Rome
    ('Colosseum', 'The famous gladiator arena in ancient Rome.', 'Via Roma 23', '00184', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Rome')),

    ('Trevi Fountain', 'Amazing fountain known from classic movies.', 'Via Roma 48', '00184', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Rome')),

    ('Vatican City', 'The Pope lives here.', 'Via Vaticano 1', '00188', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Rome')),

    -- Florence
    ('Florence Cathedral', 'A huge and beautiful church.', 'Via Piazzo 242', '20334', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Florence')),

    ('Uffizi Gallery', 'One of the most visited art museums in the world.', 'Via Piazzo 130', '20334', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Florence')),

    ('Ponte Vecchio', 'Unique old bridge with houses on it.', 'Via Adriatica 34', '20374', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Florence')),

    -- Venice
    ('St Mark''s Basilica', 'An impressive cathedral from 1094.', 'St Mark''s Piazza 7', '10191', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Venice')),

    ('Grand Canal', 'The main canal of Venice, about 4 km long.', NULL, NULL, (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Venice')),

    ('Doge''s Palace', 'The government palace used when Venice was a powerful city state.', 'Via Doge 1', '10193', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Venice')),

    -- Barcelona
    ('Sagrada Família', 'The landmark masterpiece basilica designed by Gaudí', 'Carrer de la Llum 242', '08019', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Barcelona')),

    ('Park Güell', 'This iconic public park has been on the UNESCO list since 1984.', 'Carrer de la Llum 1', '08019', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Barcelona')),

    ('La Rambla', 'The most famous boulevard in Barcelona, alined with trees and historic buildings.', 'Carrer de la Llum 1', '08019', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Barcelona')),

    -- Madrid
    ('Prado Museum', 'Art museum with paintings by masters like Velázquez and Goya', 'Calle de Prado 242', '28014', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Madrid')),

    ('Royal Palace of Madrid', 'One of the most magnificent royal palaces in Europe.', 'Calle de la Gran Vía 1', '28300', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Madrid')),

    ('El Retiro Park', 'Madrid''s enormous and popular city park.', 'Calle de Retiro 38', '28014', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Madrid')),

    -- Seville
    ('Alcázar of Seville', 'The oldest royal complex in Europe that is still being used.', 'Calle de Alcázar 1', '41001', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Seville')),

    ('Plaza de España', 'This impressive plaza is one of the most visited landmarks in Spain.', 'Calle de España 1', '41001', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Seville')),

    -- Berlin
    ('Brandenburg Gate', 'Monument from the late 18th century built like an enourmous city gate', 'Unter den Linden 100', '10178', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Berlin')),

    ('Berlin Wall Memorial', 'Memorial and out door museum preserving an original part of the Berlin wall.', 'Mauerpark 1', '10178', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Berlin')),

    ('Reichstag Building', 'Iconic government building in the heart of Berlin.', 'Platz der Republik 1', '10179', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Berlin')),

    -- Munich
    ('Marienplatz', 'The main city square has been a symbol of Munich since the 12th century.', 'Marienplatz 1', '80331', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Munich')),

    ('Nymphenburg Palace', 'The former summer residence of the Bavarian monarchs.', 'Nymphenburger Strasse 200', '80639', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Munich')),

    ('English Garden', 'One of the largest city parks in the world.', 'Park Strasse 10', '80331', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Munich')),


    --Cologne
    ('Hohenzollern Bridge', 'Impressive steel bridge famous for it''s love locks.', 'Hohenzollern Bridge 1', '50679', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Cologne')),
    ('Cologne Cathedral', 'The most visited landmark in Germany.', 'Cologne Cathedral 1', '50679', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Cologne')),
    ('Cologne Old Town', 'Historic city center with cobble stone streets and colorful buildings.', 'Cologne Old Town 1', '50679', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Cologne')),


    -- London
    ('Big Ben', 'The nickname for the Great Bell of the clock at the Palace of Westminster.', 'Big Ben 1', 'SW1A 2AA', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'London')),

    ('Tower of London', 'Historic castle on the north bank of the River Thames in central London.', 'Tower of London 1', 'SW1A 2AA', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'London')),

    ('Tower Bridge', 'An iconic suspension bridge over the River Thames.', 'Tower Bridge 1', 'SW1A 2AA', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'London')),

    ('British Museum', 'One of the world''s largest and most comprehensive museums.', 'Great Russell Street 1', 'WC1B 3DG', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'London')),


    -- Edinburgh
    ('Edinburgh Castle', 'Historic fortress dominating the skyline of Edinburgh.', 'Edinburgh Castle 1', 'EH1 2NG', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Edinburgh')),
    ('Royal Mile', 'Famous street connecting Edinburgh Castle and Holyrood Palace.', 'Royal Mile 1', 'EH1 2NG', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Edinburgh')),
    ('Arthur''s Seat', 'Ancient volcano and popular viewpoint over the city.', 'Arthur''s Seat 1', 'EH1 2NG', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Edinburgh')),

    -- Bath
    ('Roman Baths', 'Well-preserved Roman bathing complex.', 'Roman Baths 1', 'BA1 2AA', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Bath')),
    ('Bath Abbey', 'Gothic church known for its fan vaulting.', 'Bath Abbey 1', 'BA1 2AA', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Bath')),
    ('Royal Crescent', 'Row of 18th century terraced houses.', 'Royal Crescent 1', 'BA1 2AA', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Bath')),

    -- New York
    ('Statue of Liberty', 'Iconic symbol of freedom in New York Harbor.', 'Liberty Island', '10001', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'New York')),
    ('Central Park', 'Large public park in Manhattan.', 'Central Park 1', '10110', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'New York')),
    ('Times Square', 'Major commercial and entertainment hub.', 'Times Square 1', '10150', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'New York')),

    -- Washington DC
    ('White House', 'Official residence of the President of the United States.', 'White House Lane 1', '20500', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Washington DC')),
    ('Lincoln Memorial', 'Monument honoring President Abraham Lincoln.', 'Lincoln Street 100', '20600', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Washington DC')),
    ('United States Capitol', 'Home of the United States Congress.', 'Capitol Hill 1', '20600', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Washington DC')),

    -- San Francisco
    ('Golden Gate Bridge', 'Famous suspension bridge.', NULL, '94133', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'San Francisco')),
    ('Alcatraz Island', 'Historic island prison.', NULL, '94133', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'San Francisco')),
    ('Fisherman''s Wharf', 'Popular waterfront area.', 'Wharf Street', '94133', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'San Francisco')),

    -- Stockholm
    ('Gamla Stan', 'Old town with medieval streets.', 'Gamla Stan', '111 52', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Stockholm')),
    ('Vasa Museum', 'Museum housing a 17th century warship.', 'Djurgårsvägen 38', '111 52', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Stockholm')),
    ('Royal Palace', 'Official residence of the Swedish monarch.', 'Royal Palace 1', '111 52', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Stockholm')),

    -- Gothenburg
    ('Liseberg', 'Popular amusement park.', 'Liseberg 1', '412 82', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Gothenburg')),
    ('Universeum', 'Science center and museum.', 'Universeum 1', '412 82', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Gothenburg')),

    -- Malmö
    ('Turning Torso', 'Iconic twisting skyscraper.', 'Turning Torso 1', '203 50', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Malmö')),
    ('Malmö Castle', 'Historic fortress and museum.', 'Malmö Castle 1', '203 50', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Malmö')),

    -- Copenhagen
    ('Tivoli Gardens', 'Famous amusement park in the center of Copenhagen.', 'Tivoli Gardens 1', '2000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Copenhagen')),
    ('Nyhavn', 'Colorful waterfront district with restaurants and outdoor bars.', 'Nyhavn 1', '2000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Copenhagen')),
    ('The Little Mermaid', 'Iconic statue that every tourist must see.', 'The Little Mermaid 1', '2000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Copenhagen')),

    -- Aarhus
    ('ARoS Aarhus Art Museum', 'Modern art museum.', 'ARoS Aarhus Art Museum 1', '8000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Aarhus')),
    ('Den Gamle By', 'Open-air museum of historic buildings.', 'Den Gamle By 1', '8000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Aarhus')),

    -- Zurich
    ('Lake Zurich', 'Scenic lake in the city.', 'Lake Zurich 1', '8000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Zurich')),
    ('Old Town', 'Historic center with narrow streets.', 'Old Town 1', '8000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Zurich')),

    -- Geneva
    ('Jet d''Eau', 'Large water fountain on Lake Geneva.', 'Jet d''Eau 1', '1200', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Geneva')),
    ('Palace of Nations', 'European headquarters of the UN.', 'Palace of Nations 1', '1200', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Geneva')),

    -- Lucerne
    ('Chapel Bridge', 'Historic wooden bridge.', 'Chapel Bridge 1', '6000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Lucerne')),
    ('Lake Lucerne', 'Picturesque lake.', 'Lake Lucerne 1', '6000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Lucerne')),

    -- Vienna
    ('Schönbrunn Palace', 'Former imperial summer residence.', 'Schönbrunn Palace 1', '1010', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Vienna')),
    ('St. Stephen''s Cathedral', 'Gothic cathedral in the city center.', 'St. Stephen''s Cathedral 1', '1010', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Vienna')),

    -- Salzburg
    ('Hohensalzburg Fortress', 'Large medieval fortress.', 'Hohensalzburg Fortress 1', '5020', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Salzburg')),
    ('Mirabell Palace', 'Historic palace with beautiful gardens.', 'Mirabell Palace 1', '5020', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Salzburg')),

    -- Innsbruck
    ('Golden Roof', 'Famous landmark in the old town.', 'Golden Roof 1', '6000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Innsbruck')),
    ('Nordkette', 'Mountain range accessible from the city.', 'Nordkette 1', '6000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Innsbruck')),

    -- Athens
    ('Acropolis', 'Ancient citadel with historic buildings.', 'Acropolis 1', '1000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Athens')),
    ('Parthenon', 'Temple dedicated to Athena.', 'Parthenon 1', '1000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Athens')),

    -- Thessaloniki
    ('White Tower', 'Iconic waterfront tower.', 'White Tower Street', '1000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Thessaloniki')),
    ('Rotunda', 'Historic circular building.', 'Rotunda 1', '1000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Thessaloniki')),

    -- Santorini
    ('Oia', 'Village known for sunsets.', 'Pierro del Oia ', '1000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Santorini')),
    ('Fira', 'Capital town with cliff views.', 'Fira 1', '1000', (SELECT CityId
        FROM dbo.City
        WHERE CityName = 'Santorini'));

PRINT '-- Table ''Attraction'' populated. --'; 
GO