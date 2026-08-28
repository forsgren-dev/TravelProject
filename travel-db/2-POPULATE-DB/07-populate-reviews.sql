USE forsgren;
GO

DELETE FROM dbo.Reviews;
GO

INSERT INTO dbo.Reviews
    (ReviewComment, ReviewRating, ReviewCreated, AttractionId, UserId)
VALUES

    -- Med rating:

    ('Absolutely worth visiting. One of the highlights of the trip.', 5, DATEADD(DAY, -45, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Colosseum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'GlobeTrotter')),

    ('Very impressive place, but quite crowded.', 4, DATEADD(DAY, -102, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Trevi Fountain'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Wanderlust')),

         ('People everywhere. Could not get close to the fountain.', 2, DATEADD(DAY, -5, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Trevi Fountain'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelBug')),

    ('Beautiful and historic location with amazing architecture.', 5, DATEADD(DAY, -3, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Florence Cathedral'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelBug')),

    ('A must-see for anyone interested in art.', 5, DATEADD(DAY, -12, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Uffizi Gallery'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureSeeker')),

    ('Nice view and a very unique bridge.', 3, DATEADD(DAY, -24, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Ponte Vecchio'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ExplorerX')),

           ('If you like historic architecture this bridge is a must see.', 5, DATEADD(DAY, -24, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Ponte Vecchio'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureLover')),

    ('Amazing basilica with beautiful details everywhere.', 5, DATEADD(DAY, -209, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'St Mark''s Basilica'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'RoamingSoul')),

    ('Romantic and scenic, especially in the evening.', 4, DATEADD(DAY, -198, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Grand Canal'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'JetSetter')),

    ('Incredible design and atmosphere.', 5, DATEADD(DAY, -34, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Sagrada Família'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Globetrotter123')),

    ('Colorful, creative and different from anything else.', 4, DATEADD(DAY, -24, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Park Güell'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelEnthusiast')),

    ('Busy and crowded street, but fun to have been there.', 2, DATEADD(DAY, -66, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'La Rambla'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'WandererX')),

    ('Outstanding museum with world-class collections.', 5, DATEADD(DAY, -108, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Prado Museum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureLover')),

        ('I don''t like art. Boring...', 2, DATEADD(DAY, -93, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Prado Museum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelJunkie')),

        ('Some things are incredible to look at, other stuff is dull.', 3, DATEADD(DAY, -168, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Prado Museum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'FlyingNomad')),

    ('Grand and beautiful palace.', 4, DATEADD(DAY, -7, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Royal Palace of Madrid'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'GlobeTrotterX')),

    ('Great place to walk and relax.', 4, DATEADD(DAY, -46, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'El Retiro Park'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelJunkie')),

    ('Fantastic architecture and rich history.', 5, DATEADD(DAY, -18, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Alcázar of Seville'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'RoamingAdventurer')),

    ('Very photogenic and impressive.', 5, DATEADD(DAY, -122, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Plaza de España'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'FlyingNomad')),

    ('Powerful historic symbol and great photo spot.', 4, DATEADD(DAY, -127, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Brandenburg Gate'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ProGlobetrotter')),

    ('Important and emotional place to visit.', 5, DATEADD(DAY, -205, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Berlin Wall Memorial'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelExplorer')),

    ('Beautiful building with strong historical importance.', 4, DATEADD(DAY, -202, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Reichstag Building'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Lone_Wanderer')),

    ('Lively square with plenty to see nearby.', 3, DATEADD(DAY, -185, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Marienplatz'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureSeekerX')),

    ('Large palace with beautiful gardens.', 5, DATEADD(DAY, -163, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Nymphenburg Palace'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ExplorerPro')),

    ('Peaceful and huge park, perfect for a long walk.', 4, DATEADD(DAY, -192, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'English Garden'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'GlobeTrotter')),

    ('A stunning cathedral and a true landmark.', 5, DATEADD(DAY, -95, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Cologne Cathedral'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Wanderlust')),

    ('Iconic bridge with a great city view.', 4, DATEADD(DAY, -92, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Hohenzollern Bridge'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelBug')),

    ('Classic London landmark and great to see in person.', 3, DATEADD(DAY, -53, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Big Ben'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureSeeker')),

    ('Very interesting castle with a lot of history.', 5, DATEADD(DAY, -26, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Tower of London'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ExplorerX')),

    ('Huge museum with something for everyone.', 4, DATEADD(DAY, -15, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'British Museum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'RoamingSoul')),

    ('Beautiful bridge and one of London''s best sights.', 4, DATEADD(DAY, -254, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Tower Bridge'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'JetSetter')),

    ('Crowded and overly hyped. Don''t waste your time.', 2, DATEADD(DAY, -204, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Tower Bridge'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'JetSetter')),

    ('Fantastic views and a strong medieval feeling.', 5, DATEADD(DAY, -242, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Edinburgh Castle'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Globetrotter123')),

    ('Charming street with shops, history and atmosphere.', 4, DATEADD(DAY, -173, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Royal Mile'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelEnthusiast')),

    ('Great hike and amazing view from the top.', 5, DATEADD(DAY, -140, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Arthur''s Seat'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'WandererX')),

    ('Very well preserved and fascinating.', 5, DATEADD(DAY, -105, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Roman Baths'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureLover')),

    ('Beautiful abbey in the middle of Bath.', 5, DATEADD(DAY, -91, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Bath Abbey'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'GlobeTrotterX')),

        ('Just another old house...', 2, DATEADD(DAY, -126, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Bath Abbey'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelJunkie')),

    ('Perhaps the most famous statue. It''s very big!', 5, DATEADD(DAY, -300, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Statue of Liberty'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureLover')),

    ('One of the most recognizable sights in the world.', 5, DATEADD(DAY, -86, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Statue of Liberty'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelJunkie')),

    ('Perfect break from the busy city.', 4, DATEADD(DAY, -77, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Central Park'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'RoamingAdventurer')),

    ('Bright, loud and unforgettable.', 4, DATEADD(DAY, -36, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Times Square'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'FlyingNomad')),

    ('Important building and a must-see in Washington.', 4, DATEADD(DAY, -5, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'White House'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ProGlobetrotter')),

    ('Powerful monument with a calm atmosphere.', 5, DATEADD(DAY, -302, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Lincoln Memorial'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelExplorer')),

    ('Spectacular bridge and great views.', 5, DATEADD(DAY, -330, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Golden Gate Bridge'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Lone_Wanderer')),

    ('Very interesting and a little eerie.', 4, DATEADD(DAY, -239, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Alcatraz Island'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureSeekerX')),

    ('Beautiful old town with lots of charm.', 5, DATEADD(DAY, -21, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Gamla Stan'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ExplorerPro')),


    -- Utan rating:

    ('Nice place to visit to see a really old ship.', NULL, DATEADD(DAY, -63, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Vasa Museum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'GlobeTrotter')),

    ('Interesting stop with a lot of local character.', NULL, DATEADD(DAY, -78, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Royal Palace'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Wanderlust')),

    ('Fun and lively attraction.', NULL, DATEADD(DAY, -131, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Liseberg'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelBug')),

    ('Not the biggest amusement park but some great rides.', NULL, DATEADD(DAY, -60, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Liseberg'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'GlobeTrotter')),

    ('Great for families and curious visitors.', NULL, DATEADD(DAY, -285, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Universeum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureSeeker')),

    ('Modern landmark that stands out immediately.', NULL, DATEADD(DAY, -306, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Turning Torso'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ExplorerX')),

    ('Historic site with a calm atmosphere.', NULL, DATEADD(DAY, -176, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Malmö Castle'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'RoamingSoul')),

    ('Fun place with a classic city atmosphere.', NULL, DATEADD(DAY, -41, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Tivoli Gardens'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'JetSetter')),

    ('Colorful and very pleasant by the water.', NULL, DATEADD(DAY, -99, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Nyhavn'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Globetrotter123')),

        ('Great smørrebrød and beer around here.', NULL, DATEADD(DAY, -49, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Nyhavn'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'JetSetter')),

    ('Small but famous landmark.', NULL, DATEADD(DAY, -157, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'The Little Mermaid'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelEnthusiast')),

    ('Modern museum with an impressive building.', NULL, DATEADD(DAY, -212, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'ARoS Aarhus Art Museum'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'WandererX')),

    ('Feels like stepping back in time.', NULL, DATEADD(DAY, -312, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Den Gamle By'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureLover')),

    ('Relaxing lake area with beautiful views.', NULL, DATEADD(DAY, -199, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Lake Zurich'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'GlobeTrotterX')),

    ('Nice historic area for walking.', NULL, DATEADD(DAY, -299, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Old Town'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelJunkie')),

    ('Very recognizable fountain and easy to visit.', NULL, DATEADD(DAY, -99, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Jet d''Eau'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'RoamingAdventurer')),

    ('Important international site.', NULL, DATEADD(DAY, -57, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Palace of Nations'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'FlyingNomad')),

    ('Charming wooden bridge with great views.', NULL, DATEADD(DAY, -76, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Chapel Bridge'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ProGlobetrotter')),

    ('Scenic lake surrounded by mountains.', NULL, DATEADD(DAY, -176, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Lake Lucerne'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'TravelExplorer')),

    ('Beautiful palace with impressive grounds.', NULL, DATEADD(DAY, -276, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Schönbrunn Palace'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'Lone_Wanderer')),

    ('Historic cathedral in a great central location.', NULL, DATEADD(DAY, -33, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'St. Stephen''s Cathedral'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'AdventureSeekerX')),

    ('Large fortress with excellent views.', NULL, DATEADD(DAY, -17, SYSUTCDATETIME()),
        (SELECT AttractionId
        FROM dbo.Attraction
        WHERE AttractionName = 'Hohensalzburg Fortress'),
        (SELECT UserId
        FROM dbo.Users
        WHERE UserName = 'ExplorerPro'));
PRINT '-- Table ''Reviews'' populated. --';
GO