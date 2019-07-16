-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets User detail based on the Email/Phonenumber passed.
-- Parameters : 
--				@email - Email id of the user
--				@phoneNumber - Phonenumber of the user
-- =============================================

CREATE PROCEDURE [Authorization].[usp_GetUser]
	@email NVARCHAR(100),
	@phoneNumber NVARCHAR(50) = NULL
AS
BEGIN
	SELECT 
		SysId, 
		FirstName, 
		LastName, 
		Email, 
		PhoneNumber, 
		PasswordHash,
		Status,
		LastLoggedin  
	FROM [Authorization].[Users] 
	WHERE 
		(Email = @email OR PhoneNumber = @phoneNumber)
END