CREATE PROCEDURE [Authorization].[usp_GetRole]
	@Name NVARCHAR(50)
AS
	SELECT 
		Id, 
		[Name], 
		[Description],
		[IsActive]
	FROM [Authorization].[Roles] 
	WHERE [Name] = @Name AND IsActive = 1
RETURN 0
