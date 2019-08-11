-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure update/change User's password.
-- Parameters : 
--				@email - Email id of the user
--				@passwordHash - New hashed password
-- =============================================

CREATE PROCEDURE [Authorization].[usp_ChangePassword]
	@email NVARCHAR(100),
	@passwordHash NVARCHAR(50) = NULL
AS
BEGIN
	UPDATE [Authorization].[Users] SET
		[PasswordHash] = COALESCE(@passwordHash, PasswordHash)	
	WHERE 
		Email = @email
END

