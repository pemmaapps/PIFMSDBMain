-- =============================================
-- Author:		Vinay
-- Create date: 7/15/2019
-- Description:	This procedure used for Insert/Update Plan
-- Parameters : 
--				@sysId - Plan id.
--				@name - Plan name
--				@description - Description about the Plan
--				@price - Plan price
--				@currency - Type of currency
--				@duration - Duration of the Plan
--				@durationType - Duration type of the Plan
--				@status - Plan status
-- =============================================
CREATE PROCEDURE [Subscription].[usp_UpsertPlans]
	@sysId INT = NULL, 
    @name NVARCHAR(200), 
    @description NVARCHAR(200) = NULL,
	@price NUMERIC(10,2) = NULL,
	@currency TINYINT,
	@duration TINYINT,
	@durationType TINYINT,
	@status TINYINT,
	@createdby INT = 0,
	@createddate DATETIME = '',	
	@modifiedby INT = NULL,
	@modifieddate DATETIME = NULL
AS
BEGIN
	IF (@sysId is null or (SELECT COUNT(*) FROM [Subscription].[Plans] WHERE SysId = @sysId) = 0)
	BEGIN

		INSERT INTO [Subscription].[Plans] (Name, Description, Price, Currency, Duration, DurationType, Status, CreatedDate, CreatedBy) 
		VALUES (@name, @description, @price, @currency, @duration, @durationType, @status, @createdDate, @createdBy)
		SET @sysId = @@IDENTITY
	END
	ELSE
	BEGIN

	UPDATE [Subscription].[Plans] SET
		[Name] = COALESCE(@name, Name),
		[Description] = COALESCE(@description, Description),
		[Price] = COALESCE(@price, Price),
		[Currency] = COALESCE(@currency, Currency),
		[Duration] = COALESCE(@duration, Duration),
		[DurationType] = COALESCE(@durationType, DurationType),
		[Status] = COALESCE(@status, Status),
		[ModifiedBy] = @modifiedby,
		[ModifiedDate] = @modifieddate
		WHERE SysId = @sysId

	END
	SELECT @sysId
END
