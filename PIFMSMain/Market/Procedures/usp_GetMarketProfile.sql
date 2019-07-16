-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets Market profile based on the MarketId passed
-- Parameters : 
--				@sysId - Market profile id
--				@marketInfoId - Market info id of the Market profile.
-- =============================================
CREATE PROCEDURE [Markets].[usp_GetMarketProfile]
	@sysId INT = NULL,
	@marketInfoId INT = NULL
AS	
BEGIN
	SELECT 
		[SysId],
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
		(@sysId IS NULL OR [SysId] = @sysId)
		AND (@marketInfoId IS NULL OR [MarketInfoId] = @marketInfoId)
END

--EXEC [Markets].[usp_GetMarketProfile] 1

