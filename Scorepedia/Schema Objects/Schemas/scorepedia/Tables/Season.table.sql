CREATE TABLE [scorepedia].[Season]
(
	[SeasonId]		smallint		NOT NULL IDENTITY(-32768,1),
	[SeasonName]	nvarchar(30)	NOT NULL,
	[CreatedDate]	smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_Season_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT [PK_Scorepedia_Season]				PRIMARY KEY ([SeasonId]),
	CONSTRAINT [UK_ScorePedia_Season_SeasonName]	UNIQUE ([SeasonName])
)
;