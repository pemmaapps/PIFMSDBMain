-- =============================================
-- Author:		Vinay
-- Create date: 7/15/2019
-- Description:	This procedure used for Insert/Update Market plan subscription
-- Parameters : 
--				@sysId - Market plan subscription id.
--				@marketInfoId - Market info id
--				@subscriptionId - Subscription id
--				@planId - Plan id
--				@startDate - Start date of Market plan subscription
--				@endDate - End date of Market plan subscription
--				@status - Market plan subscription status
-- =============================================
CREATE PROCEDURE [Subscription].[usp_UpsertMarketPlanSubscriptions]
	@sysId INT = NULL, 
    @marketInfoId INT = NULL,
	@subscriptionId INT = NULL,
	@planId INT = NULL,
	@startDate DATETIME = NULL,
	@endDate DATETIME = NULL,
	@status TINYINT,
	@createdby INT = 0,
	@createddate DATETIME = '',	
	@modifiedby INT = NULL,
	@modifieddate DATETIME = NULL
AS
BEGIN
	IF (@sysId is null or (SELECT COUNT(*) FROM [Subscription].[MarketPlanSubscriptions] WHERE SysId = @sysId) = 0)
	BEGIN

		INSERT INTO [Subscription].[MarketPlanSubscriptions] (MarketInfoId, SubscriptionId, PlanId, StartDate, EndDate, Status, CreatedDate, CreatedBy) 
		VALUES (@marketInfoId, @subscriptionId, @planId, @startDate, @endDate, @status, @createdDate, @createdBy)
		SET @sysId = @@IDENTITY
	END
	ELSE
	BEGIN

	UPDATE [Subscription].[MarketPlanSubscriptions] SET
		[MarketInfoId] = COALESCE(@marketInfoId, MarketInfoId),
		[SubscriptionId] = COALESCE(@subscriptionId, SubscriptionId),
		[PlanId] = COALESCE(@planId, PlanId),
		[StartDate] = COALESCE(@startDate, StartDate),
		[EndDate] = COALESCE(@endDate, EndDate),
		[Status] = COALESCE(@status, Status),
		[ModifiedBy] = @modifiedby,
		[ModifiedDate] = @modifieddate
		WHERE SysId = @sysId

	END
	SELECT @sysId
END
