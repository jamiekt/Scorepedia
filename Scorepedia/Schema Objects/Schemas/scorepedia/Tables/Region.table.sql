CREATE TABLE [scorepedia].[Region]
(
	[RegionId]		smallint		NOT NULL IDENTITY(-32768,1),
	[RegionName]	nvarchar(50)	NOT NULL,
	[CreatedDate]	smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_Region_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT [PK_Scorepedia_Region] PRIMARY KEY ([RegionId]),
	CONSTRAINT [UK_ScorePedia_Region_RegionName] UNIQUE ([RegionName])
)
;
