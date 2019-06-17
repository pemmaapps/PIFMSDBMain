CREATE TABLE [Authorization].[Users]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [FirstName] NVARCHAR(100) NULL, 
    [LastName] NVARCHAR(100) NULL, 
    [Email] NVARCHAR(100) NULL, 
    [PhoneNumber] NVARCHAR(50) NULL, 
    [PasswordHash] NVARCHAR(MAX) NULL, 
    [CreatedDate] DATETIME NULL, 
    [CreatedBy] UNIQUEIDENTIFIER NULL, 
    [LastLoggedin] DATETIME NULL, 
    [Status] TINYINT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] UNIQUEIDENTIFIER NULL
)
