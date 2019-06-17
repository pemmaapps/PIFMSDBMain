CREATE TABLE [Markets].[MarketInfo]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY, 
    [Name] NVARCHAR(200) NOT NULL, 
    [Description] NVARCHAR(200) NULL, 
    [ClientId] UNIQUEIDENTIFIER NULL, 
    [ClientSecret] NVARCHAR(MAX) NULL, 
    [SecretExpiresOn] DATETIME NULL, 
    [CreatedDate] DATETIME NULL, 
    [CreatedBy] UNIQUEIDENTIFIER NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] UNIQUEIDENTIFIER NULL
)
