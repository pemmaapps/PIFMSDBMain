CREATE TABLE [Authorization].[Roles]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(100) NULL, 
    [CreatedDate] DATETIME NULL, 
    [CreatedBy] UNIQUEIDENTIFIER NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] UNIQUEIDENTIFIER NULL, 
    [IsActive] BIT NOT NULL
)
