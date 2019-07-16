-- =============================================
-- Author:		Vinay
-- Create date: 7/15/2019
-- Description:	This procedure used for Insert/Update Subscription
-- Parameters : 
--				@sysId - Subscription id.
--				@name - Subscription name
--				@description - Description about the Subscription
--				@status - Subscription status
-- =============================================
CREATE PROCEDURE [Subscription].[usp_UpsertSubscriptions]
	@sysId INT = NULL, 
    @name NVARCHAR(200), 
    @description NVARCHAR(200) = NULL,
	@status TINYINT,
	@createdby INT = 0,
	@createddate DATETIME = '',	
	@modifiedby INT = NULL,
	@modifieddate DATETIME = NULL
AS
BEGIN
	IF (@sysId is null or (SELECT COUNT(*) FROM [Subscription].[Subscriptions] WHERE SysId = @sysId) = 0)
	BEGIN

		INSERT INTO [Subscription].[Subscriptions] (Name, Description, Status, CreatedDate, CreatedBy) 
		VALUES (@name, @description, @status, @createdDate, @createdBy)
		SET @sysId = @@IDENTITY
	END
	ELSE
	BEGIN

	UPDATE [Subscription].[Subscriptions] SET
		[Name] = COALESCE(@name, Name),
		[Description] = COALESCE(@description, Description),
		[Status] = COALESCE(@status, Status),
		[ModifiedBy] = @modifiedby,
		[ModifiedDate] = @modifieddate
		WHERE SysId = @sysId

	END
	SELECT @sysId
END
