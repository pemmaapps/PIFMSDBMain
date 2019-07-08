CREATE PROCEDURE [Authorization].[usp_GetRole]
	@Name NVARCHAR(50) = NULL
AS
	IF(@Name is NULL)
	BEGIN
		SELECT 
			Id, 
			[Name], 
			[Description],
			[IsActive]
		FROM [Authorization].[Roles] 
	END
	ELSE
	BEGIN
		SELECT 
		Id, 
		[Name], 
		[Description],
		[IsActive]
		FROM [Authorization].[Roles] 
		WHERE [Name] = @Name AND IsActive = 1
	END
RETURN 0
