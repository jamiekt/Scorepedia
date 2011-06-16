CREATE PROCEDURE [scorepedia].[SetTeam]
	@pTeamName	nvarchar(40),
	@pSportId	smallint,
	@pTeamId	int	OUTPUT
AS
	DECLARE	@NewId	TABLE (
			Id		int NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
			SELECT	@pTeamId = r.[TeamId]
			FROM	[scorepedia].[Team] r
			WHERE	r.[TeamName] = @pTeamName
			AND		r.[SportId] = @pSportId;
			IF	(@pTeamId IS NULL)
			BEGIN
				SELECT	1
				FROM	[scorepedia].[Sport] s
				WHERE	s.SportId = @pSportId;
				IF	(@@ROWCOUNT = 0)
					RAISERROR('No sport exists with SportId=%d',16,1,@pSportId);

				INSERT	[scorepedia].[Team]([TeamName],[SportId])
				OUTPUT	INSERTED.[TeamId] INTO @NewId
				VALUES	(@pTeamName,@pSportId)
				;
				--SET		@pTeamId =	(	SELECT	MAX([Id])
				--						FROM	@NewId);
				SET		@pTeamId	=	SCOPE_IDENTITY();
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