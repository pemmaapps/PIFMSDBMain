CREATE TABLE [Authorization].[Users]
(
	[UserId] BIGINT NOT NULL PRIMARY KEY IDENTITY , 
    [FirstName] NVARCHAR(100) NOT NULL, 
    [LastName] NVARCHAR(100) NULL, 
    [Email] NVARCHAR(100) NOT NULL, 
    [PhoneNumber] NVARCHAR(50) NOT NULL, 
    [PasswordHash] NVARCHAR(MAX) NOT NULL, 
    [CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [LastLoggedin] DATETIME NULL, 
    [Status] TINYINT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] BIGINT NULL
)
