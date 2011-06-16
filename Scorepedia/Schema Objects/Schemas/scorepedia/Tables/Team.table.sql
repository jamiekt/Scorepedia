CREATE TABLE [scorepedia].[Team]
(
	[TeamId]		int				NOT NULL IDENTITY(-2147483648,1),
	[TeamName]		nvarchar(40)	NOT NULL,
	[SportId]		smallint		NOT NULL,
	[CreatedDate]	smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_Team_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT	[PK_Scorepedia_Team]			PRIMARY KEY ([TeamId])
)
