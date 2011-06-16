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
