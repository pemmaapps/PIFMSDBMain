-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure used for Insert/Update User detail
-- Parameters : 
--				@sysId - User id
--				@firstName - User's first name
--				@lastName - User's last name
--				@email - Email address
--				@phoneNumber - Contact number
--				@passwordHash - Hashed password
--				@city - City name where the market is.
--				@status - User's status
-- =============================================

CREATE PROCEDURE [Authorization].[usp_UpsertUser]
	@sysId BIGINT = NULL,
	@firstName NVARCHAR(100) = NULL, 
    @lastName NVARCHAR(100) = NULL, 
    @email NVARCHAR(100) = NULL, 
    @phoneNumber NVARCHAR(50) = NULL, 
    @passwordHash NVARCHAR(MAX) = NULL ,
	@createdby INT = 0,
	@createddate DATETIME = '',
	@status TINYINT,
	@modifiedby INT = NULL,
	@modifieddate DATETIME = NULL
AS
BEGIN

    IF (@sysId is null or (SELECT COUNT(*) FROM [Authorization].[Users] WHERE SysId = @sysId) = 0)
	BEGIN
		
		INSERT INTO [Authorization].[Users] (FirstName, LastName, Email, PhoneNumber, PasswordHash, CreatedBy, CreatedDate, [Status])
		Values(@firstName, @lastName, @email, @phoneNumber, @passwordHash, @createdby, @createddate, @status)
		SET @sysId = @@IDENTITY

	END
	ELSE
	BEGIN
	
		UPDATE [Authorization].[Users] SET 
			[FirstName] = COALESCE(@firstName, FirstName), 
			[LastName] = COALESCE(@lastName, LastName), 
			[Email] = COALESCE(@email, Email), 
			[PhoneNumber] = COALESCE(@phoneNumber, PhoneNumber),
			[ModifiedBy] = @modifiedby,
			[ModifiedDate] = @modifieddate
		WHERE SysId = @sysId

	END
	SELECT @sysId
END
