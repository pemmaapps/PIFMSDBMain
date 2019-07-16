-- =============================================
-- Author:		Vinay
-- Create date: 7/15/2019
-- Description:	This procedure used for Insert user role mapping.
-- Parameters : 
--				@userId - User id.
-- =============================================
CREATE PROCEDURE [Authorization].[usp_GetUserRoles]
	@userId BIGINT
AS
BEGIN
	SELECT 
	RoleId
	FROM [Authorization].[UserRoles]
	WHERE UserId = @userId
END
