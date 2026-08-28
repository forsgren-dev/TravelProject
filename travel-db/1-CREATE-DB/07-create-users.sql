USE forsgren;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE dbo.Users
(
	[UserId] [uniqueidentifier] NOT NULL DEFAULT NEWID(),
	[UserName] [nvarchar](200) NOT NULL,

	CONSTRAINT PK_User PRIMARY KEY (UserId)

	-- Sätter här UNIQUE på UserName men det testas också i usp_AddUser
	, CONSTRAINT UNIQUE_Users_UserName UNIQUE (UserName)
);
PRINT '-- Table ''Users'' created. --';
GO

