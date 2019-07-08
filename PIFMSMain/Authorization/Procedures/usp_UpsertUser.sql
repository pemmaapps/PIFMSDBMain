CREATE PROCEDURE [Authorization].[usp_UpsertUser]
	@id BIGINT = NULL,
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

    IF (@Id is null or (SELECT COUNT(*) FROM [Authorization].[Users] WHERE Id = @Id) = 0)
	BEGIN
		
		INSERT INTO [Authorization].[Users] (FirstName, LastName, Email, PhoneNumber, PasswordHash, CreatedBy, CreatedDate, [Status])
		Values(@firstName, @lastName, @email, @phoneNumber, @passwordHash, @createdby, @createddate, @status)
		SET @id = @@IDENTITY

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
		WHERE Id = @id

	END
	SELECT @id
END
