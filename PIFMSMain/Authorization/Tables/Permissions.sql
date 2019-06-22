CREATE TABLE [Authorization].[Permissions]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY , 
    [Name] NVARCHAR(100) NOT NULL, 
    [Description] NVARCHAR(100) NULL, 
    [CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] BIGINT NULL
)
