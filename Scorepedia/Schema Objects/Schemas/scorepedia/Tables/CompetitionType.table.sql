CREATE TABLE [scorepedia].[CompetitionType]
(
	[CompetitionTypeId] 			tinyint 		NOT NULL IDENTITY(1,1), 
	[CompetitionTypeName] 			nvarchar(20) 	NOT NULL,
	[CompetitionTypeDescription]	NVARCHAR(500)	NOT NULL,
	[CreatedDate]					smalldatetime	NOT NULL  CONSTRAINT [DF_Scorepedia_CompetitionType_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT [PK_Scorepedia_CompetitionType] PRIMARY KEY ([CompetitionTypeId]),
	CONSTRAINT [UK_ScorePedia_CompetitionType_CompetitionTypeName] UNIQUE ([CompetitionTypeName])
)
;