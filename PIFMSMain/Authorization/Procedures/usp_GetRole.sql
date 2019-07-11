-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets Role detail based on the role name passed.
-- PARAMETERS : 
--				@Name - Role name.
-- =============================================

CREATE PROCEDURE [Authorization].[usp_GetRole]
	@Name NVARCHAR(50) = NULL
AS
IF(@Name is NULL)
BEGIN
	SELECT 
		[RoleId], 
		[Name], 
		[Description],
		[IsActive]
	FROM [Authorization].[Roles] 
END
ELSE
BEGIN
	SELECT 
	[RoleId], 
	[Name], 
	[Description],
	[IsActive]
	FROM [Authorization].[Roles] 
	WHERE [Name] = @Name AND IsActive = 1
END

