CREATE FUNCTION [scorepedia].[GetPlayerById]
(
	@pPlayerId		int
)
RETURNS TABLE 
AS
RETURN
		(
		SELECT	p.[PlayerId],p.[PlayerName]
		FROM	[Scorepedia].[Player] p
		WHERE	p.[PlayerId] = @pPlayerId
		)