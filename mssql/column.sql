-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.column : 26.5.19.1

-- # [ mssql ]
IF NOT EXISTS (
	SELECT TOP 1 NULL
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE INFORMATION_SCHEMA.COLUMNS.TABLE_NAME = 'TB_DUMMY'
	AND INFORMATION_SCHEMA.COLUMNS.COLUMN_NAME = 'CL_NAME'
)
BEGIN
	ALTER TABLE TB_DUMMY
	ADD CL_NAME VARCHAR ( 400) NOT NULL
END
