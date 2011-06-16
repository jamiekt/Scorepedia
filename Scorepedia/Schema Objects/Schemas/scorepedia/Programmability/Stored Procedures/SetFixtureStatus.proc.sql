CREATE PROCEDURE [scorepedia].[SetFixtureStatus]
	@pFixtureStatusName		nvarchar(10),
	@pFixtureStatusId		tinyint OUTPUT
AS
	DECLARE	@NewId	TABLE (
			Id		tinyint NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
			SELECT	@pFixtureStatusId = t.[FixtureStatusId]
			FROM	[scorepedia].[FixtureStatus] t
			WHERE	t.[FixtureStatusName] = @pFixtureStatusName;
			IF (@pFixtureStatusId IS NULL)
			BEGIN
				INSERT	[scorepedia].[FixtureStatus]([FixtureStatusName])
				OUTPUT	INSERTED.[FixtureStatusId] INTO @NewId
				VALUES	(@pFixtureStatusName)
				;
				--SET		@pFixtureStatusId =	(	SELECT	MAX([Id])
				--								FROM	@NewId);
				SET		@pFixtureStatusId	=	SCOPE_IDENTITY();
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