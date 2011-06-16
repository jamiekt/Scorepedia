CREATE TABLE [scorepedia].[Competition]
(
	[CompetitionId] 	smallint 		NOT NULL IDENTITY(-32768,1),
	[CompetitionName]	nvarchar(50)	NOT NULL,
	[RegionId]			smallint		NOT NULL,
	[CompetitionTypeId]	tinyint			NOT NULL,
	[CreatedDate]		smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_Competition_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT [PK_Scorepedia_Competition] PRIMARY KEY ([CompetitionId]),
	CONSTRAINT [UK_ScorePedia_Competition_CompetitionName] UNIQUE ([CompetitionName]),
	CONSTRAINT [FK_ScorepediaCompetition_ScorepediaCompetitionType] FOREIGN KEY ([CompetitionTypeId]) REFERENCES [scorepedia].[CompetitionType]([CompetitionTypeId]),
	CONSTRAINT [FK_ScorepediaCompetition_ScorepediaRegion] FOREIGN KEY ([RegionId]) REFERENCES [scorepedia].[Region]([RegionId])
)
