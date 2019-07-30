-- =============================================
-- Author:		Vinay
-- Create date: 7/23/2019
-- Description:	This procedure gets All User detail.
-- =============================================

CREATE PROCEDURE [Authorization].[usp_GetAllUsers]	
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
END