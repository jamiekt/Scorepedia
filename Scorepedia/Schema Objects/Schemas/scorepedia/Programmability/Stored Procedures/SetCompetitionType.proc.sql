CREATE PROCEDURE [scorepedia].[SetCompetitionType]
	@pCompetitionTypeName			nvarchar(20),
	@pCompetitionTypeDescription	nvarchar(500),
	@pCompetitionTypeId				tinyint OUTPUT
AS
	DECLARE	@NewId	TABLE (
			Id		tinyint NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
			SELECT	@pCompetitionTypeId = ct.[CompetitionTypeId]
			FROM	[scorepedia].[CompetitionType] ct
			WHERE	ct.[CompetitionTypeName] = @pCompetitionTypeName;
			IF (@pCompetitionTypeId IS NULL)
			BEGIN
				INSERT	[scorepedia].[CompetitionType]([CompetitionTypeName],[CompetitionTypeDescription])
				OUTPUT	INSERTED.[CompetitionTypeId] INTO @NewId
				VALUES	(@pCompetitionTypeName,@pCompetitionTypeDescription)
				;
				--SET		@pCompetitionTypeId =	(	SELECT	MAX([Id])
				--									FROM	@NewId);
				SET		@pCompetitionTypeId	=	SCOPE_IDENTITY();
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