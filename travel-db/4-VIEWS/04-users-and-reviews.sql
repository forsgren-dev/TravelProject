USE forsgren;
GO


-- Visar alla användare, samt ev reviews med kommentarer och/eller betyg:

CREATE OR ALTER VIEW dbo.vw_UsersAndReviews
AS
SELECT 
    u.UserName,
    a.AttractionName,
    r.ReviewComment,
    r.ReviewRating,
    r.ReviewCreated
FROM dbo.Users u
LEFT OUTER JOIN dbo.Reviews r
    ON u.UserId = r.UserId
LEFT OUTER JOIN dbo.Attraction a
    ON r.AttractionId = a.AttractionId
    GROUP BY u.UserName, 
    a.AttractionName,
    r.ReviewComment,
    r.ReviewRating,
    r.ReviewCreated;
GO

-- Visning, demonstreras i DEMO-SCRIPTS:

-- SELECT * FROM dbo.vw_UsersAndReviews;




