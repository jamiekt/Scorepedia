CREATE PROCEDURE [scorepedia].[SetFixture]
	@pHomeTeamId			int,  
	@pAwayTeamId			int,  
	@pCompetitionSeasonId	int,  
	@pFixtureDate			date,
	@pFixtureStatusId		tinyint	= NULL,
	@pFixtureId				int OUTPUT,
	@pHomeFixtureTeamId		int OUTPUT,
	@pAwayFixtureTeamId		int OUTPUT
AS
BEGIN
	BEGIN	TRY
		IF	(@pHomeTeamId = @pAwayTeamId)
			RAISERROR(50001,16,1);
		IF	(@pFixtureStatusId IS NULL)
		BEGIN
			IF (	CAST(@pFixtureDate AS DATE) = CAST(CURRENT_TIMESTAMP AS DATE)	) --If on the same day
				SET	@pFixtureStatusId = 1;	--Latest
			ELSE
				SET	@pFixtureStatusId = 2;	--Result
		END

		DECLARE	@NewId	TABLE (
				Id		int NOT NULL PRIMARY KEY
		);
		DECLARE	@vHomeTeamId		int,
				@vAwayTeamId		int;
		BEGIN TRAN
				--Find a match in same CompetitionSeason, on same day, involving either same home team or same away team
				SELECT	@pFixtureId			= q.[FixtureId],
						@vHomeTeamId		= MAX(q.[HomeTeamId]),
						@vAwayTeamId		= MAX(q.[AwayTeamId]),
						@pHomeFixtureTeamId	= MAX(q.[HomeFixtureTeamId]),
						@pAwayFixtureTeamId	= MAX(q.[AwayFixtureTeamId])
				FROM	(
						SELECT	f.[FixtureId],
								CASE	WHEN ft.[HomeTeamYesNo] = 1 THEN ft.[TeamId] ELSE NULL END AS [HomeTeamId],
								CASE	WHEN ft.[HomeTeamYesNo] = 0 THEN ft.[TeamId] ELSE NULL END AS [AwayTeamId],
								CASE	WHEN ft.[HomeTeamYesNo] = 1 THEN ft.[FixtureTeamId] ELSE NULL END AS [HomeFixtureTeamId],
								CASE	WHEN ft.[HomeTeamYesNo] = 0 THEN ft.[FixtureTeamId] ELSE NULL END AS [AwayFixtureTeamId]
						FROM	[scorepedia].[Fixture] f
						INNER	JOIN [scorepedia].[FixtureTeam] ft
						ON		f.[FixtureId] = ft.[FixtureId]
						WHERE	f.[CompetitionSeasonId]	= @pCompetitionSeasonId
						AND		f.[FixtureDate]			= @pFixtureDate
						AND		(	(ft.[HomeTeamYesNo]	= 1	AND	ft.[TeamId]	= @pHomeTeamId)
								OR	(ft.[HomeTeamYesNo]	= 0	AND	ft.[TeamId]	= @pAwayTeamId))
						)q
				GROUP	BY q.[FixtureId];

				IF (@pFixtureId IS NULL)
				BEGIN
					INSERT	[scorepedia].[Fixture]([CompetitionSeasonId],[FixtureDate],[FixtureStatusId])
					OUTPUT	INSERTED.[FixtureId] INTO @NewId
					SELECT	@pCompetitionSeasonId AS [CompetitionSeasonId],@pFixtureDate AS [FixtureDate],@pFixtureStatusId AS [FixtureStatus]
					;
					--SET		@pFixtureId =	(SELECT	MAX([Id])
					--						FROM	@NewId);
					SET		@pFixtureId	=	SCOPE_IDENTITY();
				END
				
				IF	(@pHomeFixtureTeamId IS NULL OR @pHomeTeamId <> @vHomeTeamId)
					EXEC	[scorepedia].[SetFixtureTeam] 
							@pFixtureId		=	@pFixtureId,
							@pHomeTeamYesNo	=	1,
							@pTeamId		=	@pHomeTeamId,
							@pFixtureTeamId	=	@pHomeFixtureTeamId	OUTPUT;
				IF	(@pAwayFixtureTeamId IS NULL OR @pAwayTeamId <> @vAwayTeamId)
					EXEC	[scorepedia].[SetFixtureTeam] 
							@pFixtureId		=	@pFixtureId,
							@pHomeTeamYesNo	=	0,
							@pTeamId		=	@pAwayTeamId,
							@pFixtureTeamId	=	@pAwayFixtureTeamId	OUTPUT;
		COMMIT TRAN
	END		TRY
	BEGIN	CATCH
			IF	(@@TRANCOUNT > 0)
				ROLLBACK;
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