CREATE PROCEDURE [scorepedia].[SetCompetition]
	@pCompetitionName		nvarchar(50), 
	@pCompetitionTypeId		tinyint,  --Considered passing CompetitionTypeName & @RegionName instead but that would require an extra round-trip to the DB
	@pRegionId				smallint,
	@pCompetitionId			smallint OUTPUT
AS
BEGIN
	DECLARE	@NewId	TABLE (
			Id		smallint NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
		SELECT	@pCompetitionId = c.[CompetitionId]
		FROM	[scorepedia].[Competition] c 
		WHERE	c.CompetitionName = @pCompetitionName;
		IF (@pCompetitionId IS NULL)
		BEGIN
			INSERT	[scorepedia].[Competition]([CompetitionName],[CompetitionTypeId],[RegionId])
			OUTPUT	INSERTED.[CompetitionId] INTO @NewId
			SELECT	@pCompetitionName AS [CompetitionName], @pCompetitionTypeId AS [CompetitionTypeId],@pRegionId AS [RegionId]
			;
			--SET		@pCompetitionId =	(SELECT	MAX([Id])
			--							FROM	@NewId);
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