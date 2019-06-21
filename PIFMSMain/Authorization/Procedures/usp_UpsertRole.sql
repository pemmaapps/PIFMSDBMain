CREATE PROCEDURE [Authorization].[usp_UpsertRole]
	@id UNIQUEIDENTIFIER = NULL,
	@name NVARCHAR(50) = NULL, 
    @description NVARCHAR(100) = NULL,
	@isActive BIT = 1
AS
BEGIN

	DECLARE @eid UNIQUEIDENTIFIER = @id
    IF (@id is null or (SELECT COUNT(*) FROM [Authorization].[Roles] WHERE Id = @id) = 0)
	BEGIN
		INSERT INTO [Authorization].[Roles] (Name, Description, IsActive)
		Values(@name, @description, @isActive)
	END

	ELSE
	BEGIN
		UPDATE [Authorization].[Roles] SET 
			[Name] = @name , 
			[Description] = @description,
			[IsActive] = @isActive
		WHERE [ID] = @id
	END
	return 1
END
