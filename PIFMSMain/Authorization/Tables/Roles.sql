CREATE TABLE [Authorization].[Roles]
(
	[SysId] INT NOT NULL PRIMARY KEY IDENTITY , 
    [Name] NVARCHAR(50) NOT NULL, 
    [Description] NVARCHAR(100) NULL, 
    [CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] BIGINT NULL, 
    [IsActive] BIT NOT NULL
)
