-- =============================================
-- Author:		Vinay
-- Create date: 7/11/2019
-- Description:	This procedure gets Market info based on the Id passed.
-- Parameters : 
--				@sysId - Market info id.
--				@ownerId - Market owner id.
-- =============================================
CREATE PROCEDURE [Markets].[usp_GetMarketInfo]
	@sysId INT = NULL,
	@ownerId BIGINT = NULL
AS
BEGIN
	SELECT 
	[SysId], 
	[Name], 
	[Description],
	[OwnerId],
	[ClientId],
	[ClientSecret],
	[SecretExpiresOn],
	[Status]
	FROM [Markets].[MarketInfo] 
	WHERE 
	(@sysId IS NULL OR [SysId] = @sysId)
	AND (@ownerId IS NULL OR [OwnerId] = @ownerId)
END

--EXEC [Markets].[usp_GetMarketInfo] 1,2