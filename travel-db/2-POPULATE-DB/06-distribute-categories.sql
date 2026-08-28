USE forsgren;
GO

DELETE FROM dbo.AttractionCategory;
GO

-- Sätter variabler för attractions: 
DECLARE @A1  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Acropolis');
DECLARE @A2  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Alcatraz Island');
DECLARE @A3  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Alcázar of Seville');
DECLARE @A4  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'ARoS Aarhus Art Museum');
DECLARE @A5  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Arthur''s Seat');
DECLARE @A6  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Bath Abbey');
DECLARE @A7  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Berlin Wall Memorial');
DECLARE @A8  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Big Ben');
DECLARE @A9  uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Brandenburg Gate');
DECLARE @A10 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'British Museum');
DECLARE @A11 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Central Park');
DECLARE @A12 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Chapel Bridge');
DECLARE @A13 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Cologne Cathedral');
DECLARE @A14 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Cologne Old Town');
DECLARE @A15 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Colosseum');
DECLARE @A16 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Den Gamle By');
DECLARE @A17 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Doge''s Palace');
DECLARE @A18 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Edinburgh Castle');
DECLARE @A19 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'El Retiro Park');
DECLARE @A20 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'English Garden');
DECLARE @A21 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Fira');
DECLARE @A22 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Fisherman''s Wharf');
DECLARE @A23 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Florence Cathedral');
DECLARE @A24 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Gamla Stan');
DECLARE @A25 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Golden Gate Bridge');
DECLARE @A26 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Golden Roof');
DECLARE @A27 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Grand Canal');
DECLARE @A28 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Hohensalzburg Fortress');
DECLARE @A29 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Hohenzollern Bridge');
DECLARE @A30 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Jet d''Eau');
DECLARE @A31 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'La Rambla');
DECLARE @A32 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Lake Lucerne');
DECLARE @A33 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Lake Zurich');
DECLARE @A34 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Lincoln Memorial');
DECLARE @A35 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Liseberg');
DECLARE @A36 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Malmö Castle');
DECLARE @A37 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Marienplatz');
DECLARE @A38 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Mirabell Palace');
DECLARE @A39 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Nordkette');
DECLARE @A40 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Nyhavn');
DECLARE @A41 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Nymphenburg Palace');
DECLARE @A42 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Oia');
DECLARE @A43 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Old Town');
DECLARE @A44 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Palace of Nations');
DECLARE @A45 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Park Güell');
DECLARE @A46 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Parthenon');
DECLARE @A47 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Plaza de España');
DECLARE @A48 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Ponte Vecchio');
DECLARE @A49 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Prado Museum');
DECLARE @A50 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Reichstag Building');
DECLARE @A51 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Roman Baths');
DECLARE @A52 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Rotunda');
DECLARE @A53 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Royal Crescent');
DECLARE @A54 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Royal Mile');
DECLARE @A55 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Royal Palace');
DECLARE @A56 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Royal Palace of Madrid');
DECLARE @A57 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Sagrada Família');
DECLARE @A58 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Schönbrunn Palace');
DECLARE @A59 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'St Mark''s Basilica');
DECLARE @A60 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'St. Stephen''s Cathedral');
DECLARE @A61 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Statue of Liberty');
DECLARE @A62 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'The Little Mermaid');
DECLARE @A63 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Times Square');
DECLARE @A64 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Tivoli Gardens');
DECLARE @A65 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Tower Bridge');
DECLARE @A66 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Tower of London');
DECLARE @A67 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Trevi Fountain');
DECLARE @A68 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Turning Torso');
DECLARE @A69 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Uffizi Gallery');
DECLARE @A70 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'United States Capitol');
DECLARE @A71 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Universeum');
DECLARE @A72 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Vasa Museum');
DECLARE @A73 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'Vatican City');
DECLARE @A74 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'White House');
DECLARE @A75 uniqueidentifier = (SELECT TOP 1 AttractionId FROM dbo.Attraction WHERE AttractionName = 'White Tower');


-- Sätter variabler för kategorierna:
DECLARE @Art        uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Art');
DECLARE @Museum     uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Museum');
DECLARE @Historical uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Historical Site');
DECLARE @Religious  uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Religious Site');
DECLARE @Ruins      uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Ruins');
DECLARE @Park       uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Park');
DECLARE @Landmark   uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Landmark');
DECLARE @Nature     uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Nature');
DECLARE @Other      uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Other');
DECLARE @Entertainment uniqueidentifier = (SELECT CategoryId FROM dbo.Category WHERE CategoryName = 'Entertainment');

--Fördelar kategorier, hyfsat korrekt, till attraktionerna:

INSERT INTO dbo.AttractionCategory (AttractionId, CategoryId)
VALUES
   
    (@A1,  @Historical),
    (@A1,  @Landmark),
    (@A1,  @Ruins),

    (@A2,  @Historical),
    (@A2,  @Landmark),
    (@A2,  @Other),
  
    (@A3,  @Historical),
    (@A3,  @Landmark),
    (@A3,  @Other),

    (@A4,  @Art),
    (@A4,  @Museum),
  
    (@A5,  @Nature),   

    (@A6,  @Religious),
    (@A6,  @Historical),
  
    (@A7,  @Historical),
    (@A7,  @Landmark),
    (@A7,  @Museum),

    (@A8,  @Landmark),

    (@A9,  @Landmark),
    (@A9,  @Historical),
  
    (@A10, @Museum),
    (@A10, @Historical),
    (@A10, @Art),
  
    (@A11, @Park),
    (@A11, @Nature),

    (@A12, @Historical),
    (@A12, @Landmark),
  
    (@A13, @Historical),
    (@A13, @Religious),
    (@A13, @Landmark),

    (@A14, @Historical),
    (@A14, @Landmark),

    (@A15, @Historical),
    (@A15, @Landmark),
    (@A15, @Ruins),

    (@A16, @Historical),
    (@A16, @Museum),

    (@A17, @Historical),
    (@A17, @Landmark),

    (@A18, @Historical),
    (@A18, @Landmark),

    (@A19, @Park),
    (@A19, @Nature),

    (@A20, @Park),
    (@A20, @Nature),

    (@A21, @Entertainment),
    (@A21, @Other),

    (@A22, @Entertainment),
    (@A22, @Other),

    (@A23, @Religious),
    (@A23, @Historical),
    (@A23, @Landmark),

    (@A24, @Historical),
    (@A24, @Landmark),

    (@A25, @Landmark),
  
    (@A26, @Historical),
    (@A26, @Landmark),

    (@A27, @Historical),
    (@A27, @Landmark),

    (@A28, @Historical),
    (@A28, @Landmark),

    (@A29, @Historical),
    (@A29, @Landmark),

    (@A30, @Landmark),
  
    (@A31, @Entertainment),
    (@A31, @Other),

    (@A32, @Nature),
  
    (@A33, @Nature),

    (@A34, @Historical),
    (@A34, @Landmark),

    (@A35, @Entertainment),

    (@A36, @Historical),
    (@A36, @Landmark),

    (@A37, @Historical),
    (@A37, @Landmark),

    (@A38, @Historical),
    (@A38, @Landmark),

    (@A39, @Nature),

    (@A40, @Entertainment),
    (@A40, @Other),
  
    (@A41, @Historical),
    (@A41, @Landmark),

    (@A42, @Landmark),
  
    (@A43, @Historical),
    (@A43, @Landmark),

    (@A44, @Historical),
    (@A44, @Landmark),

    (@A45, @Historical),
    (@A45, @Landmark),

    (@A46, @Historical),
    (@A46, @Landmark),
  
    (@A47, @Historical),
    (@A47, @Landmark),

    (@A48, @Historical),
    (@A48, @Landmark),

    (@A49, @Museum),
    (@A49, @Historical),
  
    (@A50, @Historical),
    (@A50, @Landmark),

    (@A51, @Historical),
  
    (@A52, @Historical),
  
    (@A53, @Historical),
  
    (@A54, @Historical),
  
    (@A55, @Historical),
    (@A55, @Landmark),

    (@A56, @Historical),
    (@A56, @Landmark),

    (@A57, @Religious),
    (@A57, @Historical),
    (@A57, @Landmark),

    (@A58, @Historical),
    (@A58, @Landmark),

    (@A59, @Religious),
    (@A59, @Historical),
    (@A59, @Landmark),

    (@A60, @Religious),
    (@A60, @Historical),
  
    (@A61, @Landmark),

    (@A62, @Art),
    (@A62, @Other),

    (@A63, @Entertainment),

    (@A64, @Entertainment),

    (@A65, @Landmark),

    (@A66, @Historical),
  
    (@A67, @Historical),
  
    (@A68, @Other),

    (@A69, @Art),
    (@A69, @Museum),

    (@A70, @Historical),
    (@A70, @Landmark),

    (@A71, @Entertainment),
  
    (@A72, @Museum),
    (@A72, @Historical),
  
    (@A73, @Historical),
    (@A73, @Landmark),

    (@A74, @Historical),
    (@A74, @Landmark),

    (@A75, @Historical),
    (@A75, @Landmark);
PRINT '-- Categories for attractions distributed. --';     
GO

