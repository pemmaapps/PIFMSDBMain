-- =============================================
-- Author:		Vinay
-- Create date: 7/16/2019
-- Description:	This procedure gets Plan detail based on the Plan id/name passed.
-- Parameters : 
--				@sysId - Plan id
--				@name - Name of the plan
-- =============================================
CREATE PROCEDURE [Subscription].[usp_GetPlan]
	@sysId INT = NULL,
	@name NVARCHAR(50) = NULL
AS
BEGIN
	SELECT
	SysId,
	Name, 
	Description,
	Price, 
	Currency, 
	Duration, 
	DurationType, 
	Status	
	FROM [Subscription].[Plans]
	WHERE 
		(SysId = @sysId OR Name = @name)
END

