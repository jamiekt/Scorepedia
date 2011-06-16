CREATE TABLE [scorepedia].[FixtureTeam]
(
	[FixtureTeamId]		int	NOT NULL IDENTITY(-2147483648,1),
	[FixtureId]			int NOT NULL,
	[HomeTeamYesNo]		bit	NOT NULL,
	[TeamId]			int	NOT NULL,
	[CreatedDate]		smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_FixtureTeam_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT		[PK_Scorepedia_FixtureTeam]							PRIMARY KEY([FixtureTeamId]),
	CONSTRAINT		[UK_ScorepediaFixtureTeam_FixtureIdHomeTeamYesNo]	UNIQUE([FixtureId],[HomeTeamYesNo]),--Ensures there is only one home team and only one away team per fixture
	CONSTRAINT		[UK_ScorepediaFixtureTeam_FixtureIdTeamId]			UNIQUE([FixtureId],[TeamId]),--Ensures a team cannot play itself
	CONSTRAINT		[FK_ScorepediaFixtureTeam_ScorepediaFixture]		FOREIGN KEY([FixtureId])REFERENCES [scorepedia].[Fixture]([FixtureId]),
	CONSTRAINT		[FK_ScorepediaFixtureTeam_ScorepediaTeam]			FOREIGN KEY([TeamId])REFERENCES [scorepedia].[Team]([TeamId])
)
