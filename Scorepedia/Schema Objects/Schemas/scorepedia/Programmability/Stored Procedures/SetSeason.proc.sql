CREATE PROCEDURE [scorepedia].[SetSeason]
	@pSeasonName	nvarchar(50),
	@pSeasonId		smallint OUTPUT
AS
	DECLARE	@NewId	TABLE (
			Id		smallint NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
			SELECT	@pSeasonId = r.[SeasonId]
			FROM	[scorepedia].[Season] r 
			WHERE	r.[SeasonName] = @pSeasonName;
			IF	(@pSeasonId IS NULL)
			BEGIN
				INSERT	[scorepedia].[Season]([SeasonName])
				OUTPUT	INSERTED.[SeasonId] INTO @NewId
				VALUES	(@pSeasonName)
				;
				--SET		@pSeasonId =	(	SELECT	MAX([Id])
				--							FROM	@NewId);
				SET		@pSeasonId	=	SCOPE_IDENTITY();
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