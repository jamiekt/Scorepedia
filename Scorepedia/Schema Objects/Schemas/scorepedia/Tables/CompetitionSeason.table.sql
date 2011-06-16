CREATE TABLE [scorepedia].[CompetitionSeason]
(
	[CompetitionSeasonId]	int			NOT NULL	 IDENTITY(-2147483648,1),
	[CompetitionId]			smallint 	NOT NULL,
	[SeasonId]				smallint 	NOT NULL,
	[CreatedDate]			smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_CompetitionSeason_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT	[PK_Scorepedia_CompetitionSeason]		PRIMARY KEY ([CompetitionSeasonId]),
	CONSTRAINT	[FK_ScorepediaCompetitionSeason_ScorepediaCompetition]	FOREIGN KEY ([CompetitionId]) REFERENCES [scorepedia].[Competition]([CompetitionId]),
	CONSTRAINT	[FK_ScorepediaCompetitionSeason_ScorepediaSeason]	FOREIGN KEY ([SeasonId]) REFERENCES [scorepedia].[Season]([SeasonId])
)
;