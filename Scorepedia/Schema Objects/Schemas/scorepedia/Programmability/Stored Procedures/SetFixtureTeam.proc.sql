CREATE PROCEDURE [scorepedia].[SetFixtureTeam]
	@pFixtureId		int,
	@pHomeTeamYesNo	bit,
	@pTeamId		int,
	@pFixtureTeamId	int		OUTPUT
AS
BEGIN
	BEGIN	TRY
		DECLARE	@NewId	TABLE (
				[Id]		int NOT NULL PRIMARY KEY
		);
		DECLARE	@FixtureTeams	TABLE (
				[FixtureTeamId]	int,
				[HomeTeamYesNo]	int,
				[TeamId]		int);
		DECLARE	@vTeamId	int;
		--First, find out if there are ANY teams for this fixture
		INSERT	@FixtureTeams([FixtureTeamId],[HomeTeamYesNo],[TeamId])
		SELECT	ft.[FixtureTeamId],ft.[HomeTeamYesNo],ft.[TeamId]
		FROM	[scorepedia].[FixtureTeam] ft
		WHERE	ft.[FixtureId]		=	@pFixtureId;

		IF (@@ROWCOUNT = 0) --No existing teams for this fixture
		BEGIN
			INSERT	[scorepedia].[FixtureTeam]([FixtureId],[HomeTeamYesNo],[TeamId])
			OUTPUT	INSERTED.[FixtureTeamId] INTO @NewId
			SELECT	@pFixtureId AS [FixtureId], @pHomeTeamYesNo AS [HomeTeamYesNo], @pTeamId AS [TeamId]
			;
			--SET		@pFixtureTeamId =	(SELECT	MAX([Id])
			--							FROM	@NewId);
			SET		@pFixtureTeamId	=	SCOPE_IDENTITY();
		END
		ELSE
		BEGIN
			--Is there an existing team for this fixture playing in the specified Home/Away
			SELECT	@pFixtureTeamId = ft.[FixtureTeamId],
					@vTeamId		= ft.[TeamId]
			FROM	@FixtureTeams ft
			WHERE	ft.[HomeTeamYesNo]	= @pHomeTeamYesNo;
			IF	(@pFixtureTeamId IS NULL)
			BEGIN
				INSERT	[scorepedia].[FixtureTeam]([FixtureId],[HomeTeamYesNo],[TeamId])
				OUTPUT	INSERTED.[FixtureTeamId] INTO @NewId
				VALUES	(@pFixtureId,@pHomeTeamYesNo,@pTeamId);
				SET		@pFixtureTeamId = 	(SELECT	MAX([Id])
											FROM	@NewId);
			END
			ELSE --There is already a team in this fixture at the defined Home/Away
			BEGIN
				IF(@pTeamId <> @vTeamId) --Team has changed
					UPDATE	[scorepedia].[FixtureTeam]
					SET		[TeamId] = @pTeamId
					WHERE	[FixtureTeamId] = @pFixtureTeamId;
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