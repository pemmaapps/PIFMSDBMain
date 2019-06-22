﻿CREATE TABLE [Markets].[MarketProfile]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY ,
	[Address1] NVARCHAR(200) NOT NULL,
	[Address2] NVARCHAR(200) NULL,
	[Landmark] NVARCHAR(200) NULL,
	[Zipcode] NVARCHAR(15) NOT NULL,
	[City] NVARCHAR(100) NOT NULL,
	[State] NVARCHAR(100) NOT NULL,
	[Country] NVARCHAR(100) NOT NULL,
	[Logo] IMAGE NOT NULL,

	[CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] BIGINT NULL, 
)
