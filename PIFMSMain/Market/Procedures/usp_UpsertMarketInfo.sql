-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure used for Insert/Update market info
-- Parameters : 
--				@sysId - Market info id of the Market.
--				@name - Market name
--				@description - Description about the market
--				@ownerId - Market owner's id
--				@clientId - Client id of market
--				@clientSecret - Client secret of the market
--				@secretExpiresOn - Expiration time of the secret/subscription of the market.
-- =============================================

CREATE PROCEDURE [Markets].[usp_UpsertMarketInfo]
	@sysId INT = NULL, 
    @name NVARCHAR(200), 
    @description NVARCHAR(200) = NULL,
	@ownerId BIGINT = NULL,
    @clientId UNIQUEIDENTIFIER  = NUll, 
    @clientSecret NVARCHAR(MAX) = NULL, 
    @secretExpiresOn DATETIME = NULL,
	@status TINYINT,
    @createdDate DATETIME = '', 
    @createdBy INT = 0, 
    @modifiedDate DATETIME = NULL, 
    @modifiedBy INT = NULL 
AS
BEGIN

	IF (@sysId is null or (SELECT COUNT(*) FROM [Markets].[MarketInfo] WHERE SysId = @sysId) = 0)
	BEGIN

	 INSERT INTO [Markets].[MarketInfo] (Name, Description, OwnerId, ClientId, ClientSecret, SecretExpiresOn, Status, CreatedDate, CreatedBy) 
	 VALUES (@name, @description, @ownerId, @clientId, @clientSecret, @secretExpiresOn, @status, @createdDate, @createdBy)
	 SET @sysId = @@IDENTITY
    END
	ELSE
	BEGIN

	UPDATE [Markets].[MarketInfo] SET
		[Name] = COALESCE(@name, Name),
		[Description] = COALESCE(@description, Description),
		[ClientId] = COALESCE(@clientId, ClientId),
		[ClientSecret] = COALESCE(@clientSecret, ClientSecret),
		[SecretExpiresOn] = COALESCE(@secretExpiresOn, SecretExpiresOn),
		[Status] = COALESCE(@status, Status),
		[ModifiedBy] = @modifiedby,
		[ModifiedDate] = @modifieddate
		WHERE SysId = @sysId

	END
	SELECT @sysId
END