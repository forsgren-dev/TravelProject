-- Master-skript som bygger databasen genom att köra samtliga skript i
-- mapparna 1–5 i nummerordning.

-- Kräver SQLCMD-läge påslaget.


:on error exit

PRINT '============================================================';
PRINT '==               Bygger databasen travel-db               ==';
PRINT '============================================================';


-- 1-CREATE-DB
------------------------------------------------------------

:r 1-CREATE-DB\00-delete-database.sql
:r 1-CREATE-DB\01-create-database.sql
:r 1-CREATE-DB\02-create-country.sql
:r 1-CREATE-DB\03-create-city.sql
:r 1-CREATE-DB\04-create-attraction.sql
:r 1-CREATE-DB\05-create-category.sql
:r 1-CREATE-DB\06-create-attractioncategory.sql
:r 1-CREATE-DB\07-create-users.sql
:r 1-CREATE-DB\08-create-reviews.sql
:r 1-CREATE-DB\09-create-indexes.sql


-- 2-POPULATE-DB
------------------------------------------------------------

:r 2-POPULATE-DB\01-populate-users.sql
:r 2-POPULATE-DB\02-populate-country.sql
:r 2-POPULATE-DB\03-populate-city.sql
:r 2-POPULATE-DB\04-populate-attraction.sql
:r 2-POPULATE-DB\05-populate-category.sql
:r 2-POPULATE-DB\06-distribute-categories.sql
:r 2-POPULATE-DB\07-populate-reviews.sql


-- 3-STORED-PROCEDURES
------------------------------------------------------------

:r 3-STORED-PROCEDURES\01-add-user.sql
:r 3-STORED-PROCEDURES\02-add-attraction.sql
:r 3-STORED-PROCEDURES\03-add-uppdate-review-comment.sql
:r 3-STORED-PROCEDURES\04-add-uppdate-review-rating.sql
:r 3-STORED-PROCEDURES\05-delete-user.sql
:r 3-STORED-PROCEDURES\06-delete-attraction.sql
:r 3-STORED-PROCEDURES\07-delete-rating.sql
:r 3-STORED-PROCEDURES\08-add-category.sql


-- 4-VIEWS
------------------------------------------------------------

:r 4-VIEWS\01-attractions-by-country-and-city-rating.sql
:r 4-VIEWS\02-attractions-without-comments.sql
:r 4-VIEWS\03-attractions-by-country-and-city-comments.sql
:r 4-VIEWS\04-users-and-reviews.sql


-- 5-TABLE-FUNCTIONS
------------------------------------------------------------

:r 5-TABLE-FUNCTIONS\01-comments-between-dates.sql
:r 5-TABLE-FUNCTIONS\02-no-comments-since-date.sql
:r 5-TABLE-FUNCTIONS\03-users-with-no-comments-since-date.sql
GO

PRINT '============================================================';
PRINT '==   Klart! Databasen forsgren är skapad och välfylld.    ==';
PRINT '============================================================';
GO

