﻿/*
Deployment script for PIFMSMain

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "PIFMSMain"
:setvar DefaultFilePrefix "PIFMSMain"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [$(DatabaseName)];


GO
PRINT N'Creating [Markets]...';


GO
CREATE SCHEMA [Markets]
    AUTHORIZATION [dbo];


GO
PRINT N'Creating [Markets].[MarketInfo]...';


GO
CREATE TABLE [Markets].[MarketInfo] (
    [Id]              UNIQUEIDENTIFIER NOT NULL,
    [Name]            NVARCHAR (200)   NOT NULL,
    [Description]     NVARCHAR (200)   NULL,
    [ClientId]        UNIQUEIDENTIFIER NULL,
    [ClientSecret]    NVARCHAR (MAX)   NULL,
    [SecretExpiresOn] DATETIME         NULL,
    [CreatedDate]     DATETIME         NULL,
    [CreatedBy]       UNIQUEIDENTIFIER NULL,
    [ModifiedDate]    DATETIME         NULL,
    [ModifiedBy]      UNIQUEIDENTIFIER NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Authorization].[Permissions]...';


GO
CREATE TABLE [Authorization].[Permissions] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (100)   NOT NULL,
    [Description]  NVARCHAR (100)   NULL,
    [CreatedDate]  DATETIME         NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Authorization].[RolePermissions]...';


GO
CREATE TABLE [Authorization].[RolePermissions] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [RoleId]       UNIQUEIDENTIFIER NOT NULL,
    [PermissionId] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Authorization].[Roles]...';


GO
CREATE TABLE [Authorization].[Roles] (
    [Id]           UNIQUEIDENTIFIER NOT NULL,
    [Name]         NVARCHAR (50)    NOT NULL,
    [Description]  NVARCHAR (100)   NULL,
    [CreatedDate]  DATETIME         NULL,
    [CreatedBy]    UNIQUEIDENTIFIER NULL,
    [ModifiedDate] DATETIME         NULL,
    [ModifiedBy]   UNIQUEIDENTIFIER NULL,
    [IsActive]     BIT              NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [Authorization].[UserRoles]...';


GO
CREATE TABLE [Authorization].[UserRoles] (
    [Id]     UNIQUEIDENTIFIER NOT NULL,
    [UserId] UNIQUEIDENTIFIER NOT NULL,
    [RoleId] UNIQUEIDENTIFIER NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Update complete.';


GO
