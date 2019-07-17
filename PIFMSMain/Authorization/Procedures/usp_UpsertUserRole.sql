-- =============================================
-- Author:		Vinay
-- Create date: 7/15/2019
-- Description:	This procedure used for Insert user role mapping.
-- Parameters : 
--				@userId - User id.
--				@roleId - Role id.
-- =============================================
CREATE PROCEDURE [Authorization].[usp_UpsertUserRole]
	@userId BIGINT,
	@roleId INT
AS
BEGIN
	INSERT INTO [Authorization].[UserRoles] (UserId, RoleId)
	VALUES (@userId, @roleId)
END
