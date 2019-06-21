CREATE PROCEDURE [Authorization].[usp_GetPassword]
	@email NVARCHAR(100)	
AS
	SELECT 
	PasswordHash 
	FROM [Authorization].[Users]
	WHERE [Email] = @email 
RETURN 0
