CREATE PROCEDURE [scorepedia].[SetSport]
	@pSportName		nvarchar(50),
	@pSportId		smallint OUTPUT
AS
	DECLARE	@NewId	TABLE (
			Id		smallint NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
			SELECT	@pSportId = t.[SportId]
			FROM	[scorepedia].[Sport] t
			WHERE	t.[SportName] = @pSportName;
			IF	(@pSportId IS NULL)
			BEGIN
				INSERT	[scorepedia].[Sport]([SportName])
				OUTPUT	INSERTED.[SportId] INTO @NewId
				VALUES	(@pSportName)
				;
				--SET		@pSportId =	(	SELECT	MAX([Id])
				--						FROM	@NewId);
				SET		@pSportId = SCOPE_IDENTITY();
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