/*
This procedure will either Insert or Update MarketInfo
*/

CREATE PROCEDURE [Markets].[usp_UpsertMarketInfo]
	@id BIGINT = NULL, 
    @name NVARCHAR(200), 
    @description NVARCHAR(200) = NULL, 
    @clientId UNIQUEIDENTIFIER  = NUll, 
    @clientSecret NVARCHAR(MAX) = NULL, 
    @secretExpiresOn DATETIME = NULL, 
    @createdDate DATETIME = '', 
    @createdBy INT = 0, 
    @modifiedDate DATETIME = NULL, 
    @modifiedBy INT = NULL 
AS
BEGIN

	IF (@id is null or (SELECT COUNT(*) FROM [Markets].[MarketInfo] WHERE Id = @id) = 0)
	BEGIN

	 INSERT INTO [Markets].[MarketInfo] (Name, Description, ClientId, ClientSecret, SecretExpiresOn, CreatedDate, CreatedBy) 
	 VALUES (@name, @description, @clientId, @clientSecret, @secretExpiresOn, @createdDate, @createdBy)
	 SET @id = @@IDENTITY
    END
	ELSE
	BEGIN

	UPDATE [Markets].[MarketInfo] SET
		[Name] = COALESCE(@name, Name),
		[Description] = COALESCE(@description, Description),
		[ClientId] = COALESCE(@clientId, ClientId),
		[ClientSecret] = COALESCE(@clientSecret, ClientSecret),
		[SecretExpiresOn] = COALESCE(@secretExpiresOn, SecretExpiresOn),
		[ModifiedBy] = @modifiedby,
		[ModifiedDate] = @modifieddate
		WHERE Id = @id

	END
	SELECT @id
END