CREATE TABLE [Subscription].[MarketPlanSubscriptions]
(
	[SysId] INT NOT NULL PRIMARY KEY IDENTITY,
	[MarketInfoId] INT NOT NULL,
	[SubscriptionId] INT NOT NULL,
	[PlanId] INT NOT NULL,
	[StartDate] DATETIME NOT NULL,
	[EndDate] DATETIME NOT NULL,
	[Status] TINYINT NOT NULL,
	[CreatedDate] DATETIME NOT NULL, 
    [CreatedBy] BIGINT NOT NULL, 
    [ModifiedDate] DATETIME NULL, 
    [ModifiedBy] BIGINT NULL
)
