-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.python.mssql.backup.all.procedure : 0.0.1

-- # [ mssql ]
SELECT
	 DB_NAME() AS [DATABASE]
	,NAME AS [TRIGGER]
FROM
	SYSOBJECTS WITH(NOLOCK)
WHERE 0 = 0
	AND TYPE = 'TR'
	AND NAME NOT LIKE N'dt_%'
ORDER BY
	[TRIGGER]
