CREATE TABLE [scorepedia].[Score]
(
	[ScoreId]		int				NOT NULL IDENTITY(-2147483648,1), 
	[PlayerId]		int				NOT NULL,
	[FixtureTeamId]	int				NOT NULL,
	[NumberOfGoals]	tinyint			NOT NULL CONSTRAINT [CK_ScorepediaScore_NoZeroGoals]	CHECK ([NumberOfGoals] <> 0), --We don't store the fact that someone hasn't scored
	[CreatedDate]	smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_Score_CreatedDate]	DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT	[PK_Scorepedia_Score]						PRIMARY KEY ([ScoreId]),
	CONSTRAINT	[UK_Scorepedia_PlayerIdFixtureTeamId]		UNIQUE		([PlayerId],[FixtureTeamId]),
	CONSTRAINT	[FK_ScorepediaScore_ScorepediaPlayer]		FOREIGN KEY	([PlayerId])	REFERENCES [scorepedia].[Player]([PlayerId]),
	CONSTRAINT	[FK_ScorepediaScore_ScorepediaFixtureTeam]	FOREIGN KEY	([FixtureTeamId])	REFERENCES [scorepedia].[FixtureTeam]([FixtureTeamId])
)
