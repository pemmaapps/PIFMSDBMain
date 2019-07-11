-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets Market info based on the Id passed.
-- PARAMETERS : 
--				@marketInfoId - Market info id.
--				@ownerId - Market owner id.
-- =============================================
CREATE PROCEDURE [Markets].[usp_GetMarketInfo]
	@marketInfoId INT = NULL,
	@ownerId BIGINT = NULL
AS
BEGIN
	SELECT 
	[MarketInfoId], 
	[Name], 
	[Description],
	[OwnerId],
	[ClientId],
	[ClientSecret],
	[SecretExpiresOn]
	FROM [Markets].[MarketInfo] 
	WHERE 
	(@marketInfoId IS NULL OR [MarketInfoId] = @marketInfoId)
	AND (@ownerId IS NULL OR [OwnerId] = @ownerId)
END

--EXEC [Markets].[usp_GetMarketInfo] 1,2