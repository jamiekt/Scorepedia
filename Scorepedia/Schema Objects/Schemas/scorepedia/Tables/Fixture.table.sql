CREATE TABLE [scorepedia].[Fixture]
(
	[FixtureId]				int				NOT NULL IDENTITY(-2147483648,1),
	[CompetitionSeasonId]	int				NOT NULL,
	[FixtureDate]			date			NULL,
	[FixtureStatusId]		tinyint			NOT NULL,
	[CreatedDate]			smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_Fixture_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT	[PK_Scorepedia_Fixture] PRIMARY KEY ([FixtureId]),
	CONSTRAINT	[FK_ScorepediaFixture_ScorepediaCompetitionSeason]	FOREIGN KEY ([CompetitionSeasonId])	REFERENCES [scorepedia].[CompetitionSeason]([CompetitionSeasonId]),
	CONSTRAINT	[FK_ScorepediaFixture_ScorepediaFixtureStatus]		FOREIGN KEY ([FixtureStatusId])		REFERENCES [scorepedia].[FixtureStatus]([FixtureStatusId])
);
