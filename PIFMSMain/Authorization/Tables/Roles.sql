CREATE TABLE [Authorization].[Roles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY , 
    [Name] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(100) NULL, 
    [CreatedDate] DATETIME NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [ModifiedDate] DATETIME NOT NULL, 
    [ModifiedBy] BIGINT NULL, 
    [IsActive] BIT NOT NULL
)
