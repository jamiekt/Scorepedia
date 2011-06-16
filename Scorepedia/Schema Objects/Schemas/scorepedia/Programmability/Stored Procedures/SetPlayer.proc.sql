CREATE PROCEDURE [scorepedia].[SetPlayer]
	@pPlayerName	nvarchar(50),
	@pPlayerId		int OUTPUT
AS
	DECLARE	@NewId	TABLE (
			Id		int NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
			SELECT	@pPlayerId = r.[PlayerId]
			FROM	[scorepedia].[Player] r 
			WHERE	r.[PlayerName] = @pPlayerName;
			IF	(@pPlayerId IS NULL)
			BEGIN
				INSERT	[scorepedia].[Player]([PlayerName])
				OUTPUT	INSERTED.[PlayerId] INTO @NewId
				VALUES	(@pPlayerName)
				;
				--SET		@pPlayerId =	(	SELECT	MAX([Id])
				--							FROM	@NewId);
				SET		@pPlayerId	=	SCOPE_IDENTITY();
			END
	END		TRY
	BEGIN	CATCH
			DECLARE		@vErrorProcedure	nvarchar(126),
						@vErrorLine			int,
						@vErrorMessage		nvarchar(2048),
						@vErrorNumber		int,
						@vErrorSeverity		int,
						@vErrorState		int;
			SELECT		@vErrorProcedure	= ERROR_PROCEDURE(),
						@vErrorLine 		= ERROR_LINE(),
						@vErrorMessage 		= ERROR_MESSAGE(),
						@vErrorNumber 		= ERROR_NUMBER(),
						@vErrorSeverity 	= ERROR_SEVERITY(),
						@vErrorState 		= ERROR_STATE();

			EXEC	[support].[LogAndRethrowError]
							@pErrorProcedure = @vErrorProcedure,
							@pErrorLine	= @vErrorLine,
							@pErrorMessage = @vErrorMessage,
							@pErrorNumber = @vErrorNumber,
							@pErrorSeverity = @vErrorSeverity,
							@pErrorState = @vErrorState;
			RETURN;	
	END		CATCH
	RETURN