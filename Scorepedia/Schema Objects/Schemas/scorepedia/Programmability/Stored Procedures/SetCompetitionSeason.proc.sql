CREATE PROCEDURE [scorepedia].[SetCompetitionSeason]
	@pCompetitionId			smallint,  
	@pSeasonId				smallint,
	@pCompetitionSeasonId	int OUTPUT
AS
BEGIN
	BEGIN	TRY
		DECLARE	@NewId	TABLE (
				Id		int NOT NULL PRIMARY KEY
		);
		--This assumes 2 teams don't play against each other in the same competition on the same day (unless they swap home and away)
		SELECT	@pCompetitionSeasonId = f.[CompetitionSeasonId]
		FROM	[scorepedia].[CompetitionSeason] f
		WHERE	f.[CompetitionId]	= @pCompetitionId
		AND		f.[SeasonId]		= @pSeasonId;
		IF (@pCompetitionSeasonId IS NULL)
		BEGIN
			INSERT	[scorepedia].[CompetitionSeason]([CompetitionId],[SeasonId])
			OUTPUT	INSERTED.[CompetitionSeasonId] INTO @NewId
			SELECT	@pCompetitionId AS [CompetitionId],@pSeasonId AS [SeasonId]
			;
			--SET		@pCompetitionSeasonId =	(SELECT	MAX([Id])
			--								FROM	@NewId);
			SET		@pCompetitionId	=	SCOPE_IDENTITY();
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
	RETURN;
END