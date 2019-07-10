/*
This procedure gets the password of the user based on the email/username passed
*/

CREATE PROCEDURE [Authorization].[usp_GetPassword]
	@email NVARCHAR(100)	
AS
	SELECT 
	PasswordHash 
	FROM [Authorization].[Users]
	WHERE [Email] = @email 
RETURN 0
