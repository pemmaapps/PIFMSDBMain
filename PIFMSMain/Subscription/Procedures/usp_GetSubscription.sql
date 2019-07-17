-- =============================================
-- Author:		Vinay
-- Create date: 7/16/2019
-- Description:	This procedure gets Subscription detail based on the id/name passed.
-- Parameters : 
--				@sysId - Subscription id
--				@name - Name of the Subscription
-- =============================================
CREATE PROCEDURE [Subscription].[usp_GetSubscription]
	@sysId INT = NULL,
	@name NVARCHAR(50) = NULL
AS
BEGIN
	SELECT
	SysId,
	Name, 
	Description,	
	Status	
	FROM [Subscription].[Subscriptions]
	WHERE 
		(SysId = @sysId OR Name = @name)
END