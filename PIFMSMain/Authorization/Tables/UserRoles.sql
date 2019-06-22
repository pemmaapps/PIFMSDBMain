CREATE TABLE [Authorization].[UserRoles]
(
	[Id] BIGINT NOT NULL PRIMARY KEY IDENTITY , 
    [UserId] BIGINT NOT NULL, 
    [RoleId] INT NOT NULL
)
