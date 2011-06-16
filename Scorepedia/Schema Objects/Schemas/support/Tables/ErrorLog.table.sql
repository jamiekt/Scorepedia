CREATE TABLE [support].[ErrorLog]
(
	[ErrorLogId]		int 			NOT NULL 	IDENTITY(-2147483648,1), 
	[ErrorProcedure]	nvarchar(126)	NOT NULL,
	[ErrorLine]			int				NOT NULL,
	[ErrorMessage]		nvarchar(2048)	NOT NULL,
	[ErrorNumber]		int				NOT NULL,
	[ErrorSeverity]		int				NOT NULL,
	[ErrorState]		int				NOT NULL,
	[CreatedDate]		smalldatetime	NOT NULL CONSTRAINT [DF_Support_ErrorLog_CreatedDate] DEFAULT CURRENT_TIMESTAMP
	CONSTRAINT	[PK_support_ErrorLog] PRIMARY KEY ([ErrorLogId])
)
