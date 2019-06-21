CREATE PROCEDURE [Authorization].[usp_UpsertUser]
	@id UNIQUEIDENTIFIER = NULL,
	@firstName NVARCHAR(100) = NULL, 
    @lastName NVARCHAR(100) = NULL, 
    @email NVARCHAR(100) = NULL, 
    @phoneNumber NVARCHAR(50) = NULL, 
    @passwordHash NVARCHAR(MAX) = NULL 
AS
BEGIN
	DECLARE @eid UNIQUEIDENTIFIER = @id

    IF (@Id is null or (SELECT COUNT(*) FROM [Authorization].[Users] WHERE Id = @Id) = 0)
	BEGIN
	INSERT INTO [Authorization].[Users] (FirstName, LastName, Email, PhoneNumber, PasswordHash)
	Values(@firstName, @lastName, @email, @phoneNumber, @passwordHash)
	END

	ELSE
	BEGIN
	UPDATE [Authorization].[Users] SET 
		[FirstName] =COALESCE(FirstName, @firstName), 
		[LastName] = COALESCE(LastName, @lastName), 
		[Email] = COALESCE(Email, @email), 
		[PhoneNumber] = COALESCE(PhoneNumber, @phoneNumber)
	WHERE Id = @id
	END
	return 1
END
