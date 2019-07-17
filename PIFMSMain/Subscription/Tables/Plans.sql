CREATE TABLE [Subscription].[Plans]
(
	[SysId] INT NOT NULL PRIMARY KEY IDENTITY,
	[Name] NVARCHAR(50) NOT NULL,
	[Description] NVARCHAR(200) NOT NULL,
	[Price] NUMERIC(10,2) NOT NULL,
	[Currency] TINYINT NOT NULL,
	[Duration] TINYINT NOT NULL,
	[DurationType] TINYINT NOT NULL,
	[Status] TINYINT NOT NULL,
	[CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] BIGINT NULL
)
