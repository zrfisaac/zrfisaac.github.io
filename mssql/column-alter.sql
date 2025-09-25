-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.column.alter : 25.9.22.1

-- # [ mssql ]
IF EXISTS(
	SELECT TOP 1 NULL
	FROM INFORMATION_SCHEMA.COLUMNS WITH(NOLOCK)
	WHERE TABLE_NAME = 'TB_TABLE'
	AND COLUMN_NAME = 'CL_COLUMN'
	AND IS_NULLABLE = 'NO'
)
BEGIN
	ALTER TABLE TB_TABLE
	ALTER COLUMN CL_COLUMN INT NULL
END
