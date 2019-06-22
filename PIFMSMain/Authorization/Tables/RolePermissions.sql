CREATE TABLE [Authorization].[RolePermissions]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY , 
    [RoleId] INT NOT NULL, 
    [PermissionId] INT NOT NULL
)
