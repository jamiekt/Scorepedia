CREATE PROCEDURE [scorepedia].[SetRegion]
	@pRegionName	nvarchar(50),
	@pRegionId		smallint OUTPUT
AS
	DECLARE	@NewId	TABLE (
			Id		smallint NOT NULL PRIMARY KEY
	);
	BEGIN	TRY
			SELECT	@pRegionId = r.[RegionId]
			FROM	[scorepedia].[Region] r 
			WHERE	r.[RegionName] = @pRegionName;
			IF	(@pRegionId IS NULL)
			BEGIN
				INSERT	[scorepedia].[Region]([RegionName])
				OUTPUT	INSERTED.[RegionId] INTO @NewId
				VALUES	(@pRegionName)
				;
				--SET		@pRegionId =	(	SELECT	MAX([Id])
				--							FROM	@NewId);
				SET		@pRegionId	=	SCOPE_IDENTITY();
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