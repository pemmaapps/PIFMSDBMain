CREATE TABLE [Markets].[MarketInfo]
(
	[SysId] INT NOT NULL PRIMARY KEY IDENTITY , 
    [Name] NVARCHAR(200) NOT NULL, 
    [Description] NVARCHAR(200) NOT NULL, 
	[OwnerId] BIGINT NOT NULL,
    [ClientId] UNIQUEIDENTIFIER NOT NULL, 
    [ClientSecret] NVARCHAR(MAX) NOT NULL, 
    [SecretExpiresOn] DATETIME NOT NULL, 
	[Status] TINYINT NOT NULL,
    [CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] INT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] INT NULL 
)
