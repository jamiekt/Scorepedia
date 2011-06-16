SET NOCOUNT ON;
DECLARE	@vCompetitionTypeName			nvarchar(20),
		@vCompetitionTypeId				tinyint,
		@vCompetitionTypeDescription	nvarchar(500);
DECLARE	competitionTypeCursor	CURSOR FOR
		SELECT	CAST('League' AS nvarchar(20)) AS CompetitionTypeName,'' AS CompetitionTypeDescritpion
		UNION
		SELECT	CAST('Knockout' AS nvarchar(20)) AS CompetitionTypeName,'' AS CompetitionTypeDescritpion
		UNION
		SELECT	CAST('Other' AS nvarchar(20)) AS CompetitionTypeName,'' AS CompetitionTypeDescritpion;
OPEN	competitionTypeCursor;
FETCH	NEXT FROM competitionTypeCursor
INTO	@vCompetitionTypeName,@vCompetitionTypeDescription;

WHILE	@@FETCH_STATUS = 0
BEGIN
		SET		@vCompetitionTypeId = NULL;
		EXEC	[scorepedia].[SetCompetitionType] @vCompetitionTypeName, @vCompetitionTypeDescription, @vCompetitionTypeId OUT;
		PRINT	'@vCompetitionTypeId for ' + @vCompetitionTypeName + ' is ' + cast(@vCompetitionTypeId as nvarchar(4));
				
		FETCH	NEXT FROM competitionTypeCursor
		INTO	@vCompetitionTypeName,@vCompetitionTypeDescription;
END
CLOSE		competitionTypeCursor;
DEALLOCATE	competitionTypeCursor;
