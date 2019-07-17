-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets passwordhash based on the Email passed.
-- Parameters : 
--				@email - Email id of the user
-- =============================================

CREATE PROCEDURE [Authorization].[usp_GetPassword]
	@email NVARCHAR(100)	
AS
BEGIN
	SELECT 
	PasswordHash 
	FROM [Authorization].[Users]
	WHERE [Email] = @email 
END
