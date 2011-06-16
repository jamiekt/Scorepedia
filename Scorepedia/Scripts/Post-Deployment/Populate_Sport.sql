SET NOCOUNT ON;
DECLARE @Sport TABLE (
		SportName	nvarchar(50)
);
INSERT	INTO @Sport([SportName])
SELECT	CAST(N'Football' AS nvarchar(50)) AS [SportName];

INSERT	[scorepedia].[Sport]([SportName])
SELECT	s.[SportName]
FROM	@Sport s
LEFT	OUTER JOIN [scorepedia].[Sport] t
ON		s.[SportName] = t.[SportName]
WHERE	t.[SportName] IS NULL;
PRINT	CAST(@@ROWCOUNT AS CHAR(2)) + ' rows inserted into [scorepedia].[Sport]';
