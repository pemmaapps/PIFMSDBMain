CREATE TABLE [Authorization].[Permissions]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(100) NOT NULL, 
    [Description] NVARCHAR(100) NULL, 
    [CreatedDate] DATETIME NULL, 
    [CreatedBy] UNIQUEIDENTIFIER NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] UNIQUEIDENTIFIER NULL
)
