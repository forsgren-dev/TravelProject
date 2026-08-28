USE [travel-db];
GO

-- User Defined (table) Function för att visa användare som inte har 
-- kommenterat/betygsatt alls eller inte gjort det efter ett visst datum. 
-- I båda fallen blir resultatet i urvalet NULL så funktionen fångar upp bägge:

CREATE OR ALTER FUNCTION dbo.udf_UsersWithNoCommentsSinceDate
(
    @SinceDate DATETIME2
)
RETURNS TABLE
AS
RETURN
(
    SELECT
        u.UserId,
        u.UserName,
        -- Visar användarens senaste review-datum, om sådant finns
        ( SELECT MAX(r.ReviewCreated)
          FROM dbo.Reviews r
          WHERE r.UserId = u.UserId) AS LatestReviewDate
    FROM dbo.Users u
    WHERE NOT EXISTS
    (
        SELECT 1
        FROM dbo.Reviews r
        WHERE r.UserId = u.UserId
          AND r.ReviewCreated > @SinceDate
    )
);
GO


-- Användning, demonstreras i DEMO-SCRIPTS:

-- SELECT *
-- FROM dbo.udf_UsersWithNoCommentsSinceDate('2025-12-01')
-- ORDER BY LatestReviewDate DESC;