/*
This procedure gets Market profile based on the address1 passed.
If address1 is not passed then returns all market profiles.
*/
CREATE PROCEDURE [Markets].[usp_GetMarketProfile]
	@address1 NVARCHAR(200) = NULL
AS
	IF(@address1 is NULL)
	BEGIN
		SELECT 
			Id, 
			[Address1],
			[Address2],
			[Landmark],
			[Zipcode],
			[City],
			[State],
			[Country],
			[Logo]
		FROM [Markets].[MarketProfile] 
	END
	ELSE
	BEGIN
		SELECT 
			Id, 
			[Address1],
			[Address2],
			[Landmark],
			[Zipcode],
			[City],
			[State],
			[Country],
			[Logo]
		FROM [Markets].[MarketProfile] 
		WHERE [Address1] = @address1
	END
RETURN 0
