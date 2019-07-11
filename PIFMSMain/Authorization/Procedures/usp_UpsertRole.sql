﻿-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure used for Insert/Update Role
-- PARAMETERS : 
--				@roleId - Role id
--				@name - Role's name
--				@description - Description about role
--				@isActive - Role status flag
-- =============================================

CREATE PROCEDURE [Authorization].[usp_UpsertRole]
	@roleId INT = NULL,
	@name NVARCHAR(50) = NULL, 
    @description NVARCHAR(100) = NULL,
	@isActive BIT = 1,
	@createdby INT = 0,
	@createddate DATETIME = '',
	@modifiedby INT = NULL,
	@modifieddate DATETIME = NULL
AS
BEGIN

    IF (@roleId is null or (SELECT COUNT(*) FROM [Authorization].[Roles] WHERE RoleId = @roleId) = 0)
	BEGIN
		INSERT INTO [Authorization].[Roles] (Name, Description, IsActive, CreatedBy, CreatedDate)
		Values(@name, @description, @isActive, @createdby, @createddate)
		SET @roleId = @@IDENTITY
	END

	ELSE
	BEGIN
		UPDATE [Authorization].[Roles] SET 
			[Name] = COALESCE(@name, [Name]) , 
			[Description] = COALESCE(@description,[Description]),
			[IsActive] = COALESCE(@isActive, [IsActive]),
			[ModifiedBy] = @modifiedby,
			[ModifiedDate] = @modifieddate
		WHERE [RoleId] = @roleId
	END
	SELECT @roleId
END
