CREATE PROCEDURE [scorepedia].[SetScore]
	@pPlayerId		int,
	@pFixtureTeamId	int,
	@pNumberOfGoals	tinyint,
	@pScoreId		int		OUTPUT
AS
BEGIN
	BEGIN	TRY
		DECLARE	@NewId	TABLE (
				Id		int NOT NULL PRIMARY KEY
		);
		DECLARE	@vNumberOfGoals	tinyint;
		SELECT	@pScoreId		= s.[ScoreId],
				@vNumberOfGoals	= s.[NumberOfGoals]
		FROM	[scorepedia].[Score] s
		WHERE	s.[FixtureTeamId]	=	@pFixtureTeamId
		AND		s.[PlayerId]		=	@pPlayerId;

		IF (@pScoreId IS NULL)
		BEGIN
			INSERT	[scorepedia].[Score]([PlayerId],[FixtureTeamId],[NumberOfGoals])
			OUTPUT	INSERTED.[ScoreId] INTO @NewId
			SELECT	@pPlayerId AS [PlayerId], @pFixtureTeamId AS [FixtureTeamId], @pNumberOfGoals AS [NumberOfGoals]
			;
			--SET		@pScoreId =	(SELECT	MAX([Id])
			--					FROM	@NewId);
			SET		@pScoreId	=	SCOPE_IDENTITY();
		END
		ELSE
		BEGIN
			IF	(@pNumberOfGoals = 0)
			BEGIN
				DELETE
				FROM	[scorepedia].[Score]
				WHERE	[ScoreId] = @pScoreId;
				SET		@pScoreId = NULL; --Score record no longer exists so get rid of it
			END
			ELSE
			BEGIN
				IF	(@vNumberOfGoals <> @pNumberOfGoals) --Only do an update if number of goals has changed!
					UPDATE	[scorepedia].[Score]
					SET		[NumberOfGoals] = @pNumberOfGoals
					WHERE	[ScoreId] = @pScoreId;
			END
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