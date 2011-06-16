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
