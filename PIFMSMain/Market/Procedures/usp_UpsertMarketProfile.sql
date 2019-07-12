-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure used for Insert/Update market profile
-- PARAMETERS : 
--				@marketProfileId - Market profile id of the Market profile.
--				@marketInfoId - Market info id of the Market profile.
--				@address1 - address of the market
--				@address2 - address of the market
--				@landmark - Landmark of the market
--				@zipcode - Zipcode of the market
--				@city - City name where the market is.
--				@state - State name where the market is.
--				@country - Country name where the market is.
--				@logo - Logo of the market.
-- =============================================

CREATE PROCEDURE [Markets].[usp_UpsertMarketProfile]
	@marketProfileId INT = NULL,
	@marketInfoId INT = NULL,
    @address1 NVARCHAR(200) = NULL,
	@address2 NVARCHAR(200) = NULL,
	@landmark NVARCHAR(200) = NULL,
	@zipcode NVARCHAR(15) = NULL,
	@city NVARCHAR(100) = NULL,
	@state NVARCHAR(100) = NULL,
	@country NVARCHAR(100) = NULL,
	@logo IMAGE = NULL, 
    @createdDate DATETIME = '', 
    @createdBy INT = 0, 
    @modifiedDate DATETIME = NULL, 
    @modifiedBy INT = NULL 
AS
BEGIN

	IF (@marketProfileId is null or (SELECT COUNT(*) FROM [Markets].[MarketProfile] WHERE [MarketProfileId] = @marketProfileId) = 0)
	BEGIN

	 INSERT INTO [Markets].[MarketProfile] (MarketInfoId, Address1, Address2, City, Country, Landmark, State, Zipcode, Logo, CreatedDate, CreatedBy) 
	 VALUES (@marketInfoId, @address1, @address2, @city, @country, @landmark, @state, @zipcode, @logo, @createdDate, @createdBy)
	 SET @marketProfileId = @@IDENTITY
    END
	ELSE
	BEGIN

	UPDATE [Markets].[MarketProfile] SET
		[Address1] = COALESCE(@address1, Address1),
		[Address2] = COALESCE(@address2, Address2),
		[City] = COALESCE(@city, City),
		[Country] = COALESCE(@country, Country),
		[Landmark] = COALESCE(@landmark, Landmark),
		[Logo] = COALESCE(@logo, Logo),
		[ModifiedBy] = @modifiedby,
		[ModifiedDate] = @modifieddate
		WHERE MarketProfileId = @marketProfileId

	END
	SELECT @marketProfileId
END