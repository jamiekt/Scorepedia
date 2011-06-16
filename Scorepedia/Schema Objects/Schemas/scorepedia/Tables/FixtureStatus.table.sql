CREATE TABLE [scorepedia].[FixtureStatus]
(
	[FixtureStatusId]	tinyint			NOT NULL IDENTITY(1,1),
	[FixtureStatusName]	nvarchar(10)	NOT NULL,
	CONSTRAINT [PK_Scorepedia_FixtureStatusId]		PRIMARY KEY	([FixtureStatusId]),
	CONSTRAINT [PK_Scorepedia_FixtureStatusName]	UNIQUE		([FixtureStatusName])
)
