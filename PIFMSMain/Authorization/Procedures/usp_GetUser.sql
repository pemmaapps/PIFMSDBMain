CREATE PROCEDURE [Authorization].[usp_GetUser]
	@name NVARCHAR(100)
AS
	SELECT 
		Id, 
		FirstName, 
		LastName, 
		Email, 
		PhoneNumber, 
		PasswordHash,
		Status,
		LastLoggedin  
	FROM [Authorization].[Users] 
	WHERE 
		Email like '%'+@name+'%'
		OR FirstName like '%'+@name+'%'
		OR LastName like '%'+@name+'%'
RETURN 0
