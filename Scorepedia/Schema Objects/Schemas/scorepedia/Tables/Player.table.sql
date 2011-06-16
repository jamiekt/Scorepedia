CREATE TABLE [scorepedia].[Player]
(
	[PlayerId]		int				NOT NULL IDENTITY(-2147483648,1), 
	[PlayerName] 	nvarchar(30)	NOT NULL,
	[CreatedDate]	smalldatetime	NOT NULL CONSTRAINT [DF_Scorepedia_Player_CreatedDate] DEFAULT CURRENT_TIMESTAMP,
	CONSTRAINT		[PK_Scorepedia_PlayerId]	PRIMARY KEY	([PlayerId]),
	CONSTRAINT		[UK_Scorepedia_PlayerName]	UNIQUE		([PlayerName])
)
