-- =============================================
-- Author:		Vinay
-- Create date: 7/16/2019
-- Description:	This procedure gets all active roles.			
-- =============================================

CREATE PROCEDURE [Authorization].[usp_GetAllRoles]	
AS
BEGIN
	SELECT 
	[SysId], 
	[Name], 
	[Description],
	[IsActive]
	FROM [Authorization].[Roles] 
	WHERE 
	 IsActive = 1
END

