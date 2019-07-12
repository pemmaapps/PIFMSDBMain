-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets Market profile based on the MarketId passed
-- PARAMETERS : 
--				@marketProfileId - Market profile id
--				@marketInfoId - Market info id of the Market profile.
-- =============================================
CREATE PROCEDURE [Markets].[usp_GetMarketProfile]
	@marketProfileId INT = NULL,
	@marketInfoId INT = NULL
AS	
BEGIN
	SELECT 
		[MarketProfileId],
		[MarketInfoId],
		[Address1],
		[Address2],
		[Landmark],
		[Zipcode],
		[City],
		[State],
		[Country],
		[Logo]
	FROM [Markets].[MarketProfile] 
	WHERE 
		(@marketProfileId IS NULL OR [MarketProfileId] = @marketProfileId)
		AND (@marketInfoId IS NULL OR [MarketInfoId] = @marketInfoId)
END

--EXEC [Markets].[usp_GetMarketProfile] 1

