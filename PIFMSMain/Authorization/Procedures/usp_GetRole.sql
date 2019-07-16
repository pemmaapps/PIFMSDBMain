-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets Role detail based on the role name passed.
-- Parameters : 
--				@sysId - Role id.
--				@Name - Role name.
-- =============================================

CREATE PROCEDURE [Authorization].[usp_GetRole]
	@sysId INT = NULL,
	@Name NVARCHAR(50) = NULL
AS
BEGIN
	SELECT 
	[SysId], 
	[Name], 
	[Description],
	[IsActive]
	FROM [Authorization].[Roles] 
	WHERE 
	(SysId = @sysId OR [Name] = @Name)
END

