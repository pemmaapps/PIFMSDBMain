CREATE TABLE [Markets].[MarketInfo]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY , 
    [Name] NVARCHAR(200) NOT NULL, 
    [Description] NVARCHAR(200) NOT NULL, 
    [ClientId] UNIQUEIDENTIFIER NOT NULL, 
    [ClientSecret] NVARCHAR(MAX) NOT NULL, 
    [SecretExpiresOn] DATETIME NOT NULL, 
    [CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] BIGINT NULL 
)
