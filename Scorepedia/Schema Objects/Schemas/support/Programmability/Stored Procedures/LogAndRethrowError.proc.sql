CREATE PROCEDURE [support].[LogAndRethrowError]
	@pErrorProcedure	nvarchar(126),
	@pErrorLine			int,
	@pErrorMessage		nvarchar(2048),
	@pErrorNumber		int,
	@pErrorSeverity		int,
	@pErrorState		int
AS
	INSERT	[support].[ErrorLog]([ErrorMessage],[ErrorNumber],[ErrorProcedure],[ErrorLine],[ErrorSeverity],[ErrorState])
	VALUES	(@pErrorMessage,@pErrorNumber,@pErrorProcedure,@pErrorLine,@pErrorSeverity,@pErrorState);

	--Rethrow
	RAISERROR(@pErrorMessage,@pErrorSeverity,@pErrorState);
RETURN 0