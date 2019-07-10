/*
This procedure will either Insert or Update Role
*/

CREATE PROCEDURE [Authorization].[usp_UpsertRole]
	@id INT = NULL,
	@name NVARCHAR(50) = NULL, 
    @description NVARCHAR(100) = NULL,
	@isActive BIT = 1,
	@createdby INT = 0,
	@createddate DATETIME = '',
	@modifiedby INT = NULL,
	@modifieddate DATETIME = NULL
AS
BEGIN

    IF (@id is null or (SELECT COUNT(*) FROM [Authorization].[Roles] WHERE Id = @id) = 0)
	BEGIN
		INSERT INTO [Authorization].[Roles] (Name, Description, IsActive, CreatedBy, CreatedDate)
		Values(@name, @description, @isActive, @createdby, @createddate)
		SET @id = @@IDENTITY
	END

	ELSE
	BEGIN
		UPDATE [Authorization].[Roles] SET 
			[Name] = COALESCE(@name, [Name]) , 
			[Description] = COALESCE(@description,[Description]),
			[IsActive] = COALESCE(@isActive, [IsActive]),
			[ModifiedBy] = @modifiedby,
			[ModifiedDate] = @modifieddate
		WHERE [Id] = @id
	END
	SELECT @id
END
