/*
This procedure will either Insert or Update MarketProfile
*/

CREATE PROCEDURE [Markets].[usp_UpsertMarketProfile]
	@id BIGINT = NULL, 
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

	IF (@id is null or (SELECT COUNT(*) FROM [Markets].[MarketProfile] WHERE Id = @id) = 0)
	BEGIN

	 INSERT INTO [Markets].[MarketProfile] (Address1, Address2, City, Country, Landmark, State, Zipcode, Logo, CreatedDate, CreatedBy) 
	 VALUES (@address1, @address2, @city, @country, @landmark, @state, @zipcode, @logo, @createdDate, @createdBy)
	 SET @id = @@IDENTITY
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
		WHERE Address1 = @address1

	END
	SELECT @id
END