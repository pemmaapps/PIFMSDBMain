/*
This procedure gets Market info based on the Name passed.
If Name is not passed then returns all market info.
*/
CREATE PROCEDURE [Markets].[usp_GetMarketInfo]
	@Name NVARCHAR(50) = NULL
AS
	IF(@Name is NULL)
	BEGIN
		SELECT 
			Id, 
			[Name], 
			[Description],
			[ClientId],
			[ClientSecret],
			[SecretExpiresOn]
		FROM [Markets].[MarketInfo] 
	END
	ELSE
	BEGIN
		SELECT 
		Id, 
		[Name], 
		[Description],
		[ClientId],
		[ClientSecret],
		[SecretExpiresOn]
		FROM [Markets].[MarketInfo] 
		WHERE [Name] = @Name
	END
RETURN 0
