-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.list.object.all : 0.0.1

-- # [ mssql ]
SET NOCOUNT ON
DECLARE @SEARCH VARCHAR(64) = ''
DROP TABLE IF EXISTS #DATA
SELECT
	 CONVERT(VARCHAR(MAX),'')	AS [DATABASE]
	,CONVERT(VARCHAR(MAX),'')	AS [OBJECT]
	,CONVERT(VARCHAR(MAX),'')	AS [TYPE]
INTO #DATA
WHERE 0 <> 0
DECLARE @RUN VARCHAR(MAX) = ''
DECLARE @SCRIPT VARCHAR(MAX) = (''
	+ CHAR(13) + '		USE P_DATABASE'
	+ CHAR(13) + '		INSERT INTO #DATA'
	+ CHAR(13) + '		('
	+ CHAR(13) + '			 [DATABASE]'
	+ CHAR(13) + '			,[OBJECT]'
	+ CHAR(13) + '			,[TYPE]'
	+ CHAR(13) + '		)'
	+ CHAR(13) + '		SELECT'
	+ CHAR(13) + '			 ''P_DATABASE'''
	+ CHAR(13) + '			AS [DATABASE]'
	+ CHAR(13) + '			,[NAME]'
	+ CHAR(13) + '			AS [OBJECT]'
	+ CHAR(13) + '			,(CASE XTYPE'
	+ CHAR(13) + '				WHEN N''D'''
	+ CHAR(13) + '				THEN ''DEFAULT'''
	+ CHAR(13) + '				WHEN N''F'''
	+ CHAR(13) + '				THEN ''FOREIGN'''
	+ CHAR(13) + '				WHEN N''FN'''
	+ CHAR(13) + '				THEN ''FUNCTION'''
	+ CHAR(13) + '				WHEN N''P'''
	+ CHAR(13) + '				THEN ''PROCEDURE'''
	+ CHAR(13) + '				WHEN N''PK'''
	+ CHAR(13) + '				THEN ''KEY'''
	+ CHAR(13) + '				WHEN N''U'''
	+ CHAR(13) + '				THEN ''UNIQUE'''
	+ CHAR(13) + '				WHEN N''V'''
	+ CHAR(13) + '				THEN ''VIEW'''
	+ CHAR(13) + '				ELSE XTYPE'
	+ CHAR(13) + '			END)'
	+ CHAR(13) + '			AS [TYPE]'
	+ CHAR(13) + '		FROM SYSOBJECTS WITH(NOLOCK)'
	+ CHAR(13) + '		WHERE [NAME] LIKE ISNULL(''%P_SEARCH%'',[NAME])'
	+ CHAR(13) + '		ORDER BY [NAME]'
)
DECLARE @NAME VARCHAR(64)
DECLARE CR_CURSOR CURSOR FOR SELECT [NAME]
FROM SYSDATABASES WITH(NOLOCK)
WHERE [NAME] NOT IN ('dbSQL2008','dw','master','tempdb','model','msdb','Northwind','Traces') ORDER BY [NAME]
OPEN CR_CURSOR
FETCH NEXT FROM CR_CURSOR INTO @NAME
WHILE (@@FETCH_STATUS = 0)
BEGIN
	SET @RUN = (
		REPLACE(
		REPLACE(
			@SCRIPT
		,'P_DATABASE',@NAME)
		,'P_SEARCH',@SEARCH)
	)
	EXEC(@RUN)
	FETCH NEXT FROM CR_CURSOR INTO @NAME
END
CLOSE CR_CURSOR
DEALLOCATE CR_CURSOR
SELECT
	 [DATABASE]
	,[OBJECT]
	,[TYPE]
FROM #DATA
ORDER BY
	 [DATABASE]		ASC
	,[OBJECT]		ASC
DROP TABLE IF EXISTS #DATA
