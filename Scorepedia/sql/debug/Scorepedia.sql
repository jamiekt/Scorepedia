/*
Deployment script for Scorepedia
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "Scorepedia"
:setvar DefaultDataPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"
:setvar DefaultLogPath "C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\"

GO
USE [master]

GO
:on error exit
GO
IF (DB_ID(N'$(DatabaseName)') IS NOT NULL
    AND DATABASEPROPERTYEX(N'$(DatabaseName)','Status') <> N'ONLINE')
BEGIN
    RAISERROR(N'The state of the target database, %s, is not set to ONLINE. To deploy to this database, its state must be set to ONLINE.', 16, 127,N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO

IF NOT EXISTS (SELECT 1 FROM [master].[dbo].[sysdatabases] WHERE [name] = N'$(DatabaseName)')
BEGIN
    RAISERROR(N'You cannot deploy this update script to target XPSSTUDIO. The database for which this script was built, Scorepedia, does not exist on this server.', 16, 127) WITH NOWAIT
    RETURN
END

GO

IF (@@servername != 'XPSSTUDIO')
BEGIN
    RAISERROR(N'The server name in the build script %s does not match the name of the target server %s. Verify whether your database project settings are correct and whether your build script is up to date.', 16, 127,N'XPSSTUDIO',@@servername) WITH NOWAIT
    RETURN
END

GO

IF CAST(DATABASEPROPERTY(N'$(DatabaseName)','IsReadOnly') as bit) = 1
BEGIN
    RAISERROR(N'You cannot deploy this update script because the database for which it was built, %s , is set to READ_ONLY.', 16, 127, N'$(DatabaseName)') WITH NOWAIT
    RETURN
END

GO
USE [$(DatabaseName)]

GO
/*
 Pre-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be executed before the build script.	
 Use SQLCMD syntax to include a file in the pre-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the pre-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

GO
PRINT N'Dropping Permission...';


GO
REVOKE CONNECT TO [dbo]
    AS [dbo];


GO
PRINT N'Dropping DF_Scorepedia_Competition_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Competition] DROP CONSTRAINT [DF_Scorepedia_Competition_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_CompetitionSeason_CreatedDate...';


GO
ALTER TABLE [scorepedia].[CompetitionSeason] DROP CONSTRAINT [DF_Scorepedia_CompetitionSeason_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_CompetitionType_CreatedDate...';


GO
ALTER TABLE [scorepedia].[CompetitionType] DROP CONSTRAINT [DF_Scorepedia_CompetitionType_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_Fixture_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Fixture] DROP CONSTRAINT [DF_Scorepedia_Fixture_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_FixtureTeam_CreatedDate...';


GO
ALTER TABLE [scorepedia].[FixtureTeam] DROP CONSTRAINT [DF_Scorepedia_FixtureTeam_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_Player_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Player] DROP CONSTRAINT [DF_Scorepedia_Player_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_Region_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Region] DROP CONSTRAINT [DF_Scorepedia_Region_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_Score_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Score] DROP CONSTRAINT [DF_Scorepedia_Score_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_Season_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Season] DROP CONSTRAINT [DF_Scorepedia_Season_CreatedDate];


GO
PRINT N'Dropping DF_Scorepedia_Team_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Team] DROP CONSTRAINT [DF_Scorepedia_Team_CreatedDate];


GO
PRINT N'Dropping DF_Support_ErrorLog_CreatedDate...';


GO
ALTER TABLE [support].[ErrorLog] DROP CONSTRAINT [DF_Support_ErrorLog_CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_Competition_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Competition]
    ADD CONSTRAINT [DF_Scorepedia_Competition_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_CompetitionSeason_CreatedDate...';


GO
ALTER TABLE [scorepedia].[CompetitionSeason]
    ADD CONSTRAINT [DF_Scorepedia_CompetitionSeason_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_CompetitionType_CreatedDate...';


GO
ALTER TABLE [scorepedia].[CompetitionType]
    ADD CONSTRAINT [DF_Scorepedia_CompetitionType_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_Fixture_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Fixture]
    ADD CONSTRAINT [DF_Scorepedia_Fixture_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_FixtureTeam_CreatedDate...';


GO
ALTER TABLE [scorepedia].[FixtureTeam]
    ADD CONSTRAINT [DF_Scorepedia_FixtureTeam_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_Player_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Player]
    ADD CONSTRAINT [DF_Scorepedia_Player_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_Region_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Region]
    ADD CONSTRAINT [DF_Scorepedia_Region_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_Score_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Score]
    ADD CONSTRAINT [DF_Scorepedia_Score_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_Season_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Season]
    ADD CONSTRAINT [DF_Scorepedia_Season_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Scorepedia_Team_CreatedDate...';


GO
ALTER TABLE [scorepedia].[Team]
    ADD CONSTRAINT [DF_Scorepedia_Team_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
PRINT N'Creating DF_Support_ErrorLog_CreatedDate...';


GO
ALTER TABLE [support].[ErrorLog]
    ADD CONSTRAINT [DF_Support_ErrorLog_CreatedDate] DEFAULT CURRENT_TIMESTAMP FOR [CreatedDate];


GO
-- Refactoring step to update target server with deployed transaction logs

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
SET NOCOUNT ON;
DECLARE @Sport TABLE (
		SportName	nvarchar(50)
);
INSERT	INTO @Sport([SportName])
SELECT	CAST(N'Football' AS nvarchar(50)) AS [SportName];

INSERT	[scorepedia].[Sport]([SportName])
SELECT	s.[SportName]
FROM	@Sport s
LEFT	OUTER JOIN [scorepedia].[Sport] t
ON		s.[SportName] = t.[SportName]
WHERE	t.[SportName] IS NULL;
PRINT	CAST(@@ROWCOUNT AS CHAR(2)) + ' rows inserted into [scorepedia].[Sport]';
SET NOCOUNT ON;
DECLARE	@vCompetitionTypeName			nvarchar(20),
		@vCompetitionTypeId				tinyint,
		@vCompetitionTypeDescription	nvarchar(500);
DECLARE	competitionTypeCursor	CURSOR FOR
		SELECT	CAST('League' AS nvarchar(20)) AS CompetitionTypeName,'' AS CompetitionTypeDescritpion
		UNION
		SELECT	CAST('Knockout' AS nvarchar(20)) AS CompetitionTypeName,'' AS CompetitionTypeDescritpion
		UNION
		SELECT	CAST('Other' AS nvarchar(20)) AS CompetitionTypeName,'' AS CompetitionTypeDescritpion;
OPEN	competitionTypeCursor;
FETCH	NEXT FROM competitionTypeCursor
INTO	@vCompetitionTypeName,@vCompetitionTypeDescription;

WHILE	@@FETCH_STATUS = 0
BEGIN
		SET		@vCompetitionTypeId = NULL;
		EXEC	[scorepedia].[SetCompetitionType] @vCompetitionTypeName, @vCompetitionTypeDescription, @vCompetitionTypeId OUT;
		PRINT	'@vCompetitionTypeId for ' + @vCompetitionTypeName + ' is ' + cast(@vCompetitionTypeId as nvarchar(4));
				
		FETCH	NEXT FROM competitionTypeCursor
		INTO	@vCompetitionTypeName,@vCompetitionTypeDescription;
END
CLOSE		competitionTypeCursor;
DEALLOCATE	competitionTypeCursor;
SET NOCOUNT ON;
DECLARE @FixtureStatus TABLE (
		FixtureStatusName	nvarchar(10),
		FixtureStatusId	tinyint
);
INSERT	INTO @FixtureStatus(FixtureStatusId,FixtureStatusName)
SELECT	CAST(1 AS tinyint) AS FixureStatusId,CAST('Latest' AS nvarchar(10)) AS FixtureStatusName
UNION
SELECT	2 AS FixureStatusId,CAST('Result' AS nvarchar(10)) AS FixtureStatusName;

SET	IDENTITY_INSERT [scorepedia].[FixtureStatus] ON;
INSERT	[scorepedia].[FixtureStatus](FixtureStatusId,FixtureStatusName)
SELECT	s.[FixtureStatusId],s.[FixtureStatusName]
FROM	@FixtureStatus s
LEFT	OUTER JOIN [scorepedia].[FixtureStatus] t
ON		s.[FixtureStatusId] = t.[FixtureStatusId]
WHERE	t.[FixtureStatusId] IS NULL;
PRINT	CAST(@@ROWCOUNT AS CHAR(2)) + ' rows inserted into [scorepedia].[FixtureStatus]';
SET	IDENTITY_INSERT [scorepedia].[FixtureStatus] ON;

GO
