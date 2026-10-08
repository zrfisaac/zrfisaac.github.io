-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.python.mssql.backup.column. : 0.0.1

-- # [ mssql ]
SELECT
	 AL_TABLE.TABLE_CATALOG
	AS [CL_DATABASE]
	,AL_TABLE.TABLE_NAME
	AS [CL_TABLE]
	,AL_COLUMN.COLUMN_NAME
	AS [CL_COLUMN]
	,UPPER(AL_COLUMN.DATA_TYPE)
	AS [CL_TYPE]
	,(CASE
		WHEN UPPER(AL_COLUMN.DATA_TYPE) IN (''
			,'DECIMAL'
			,'NUMERIC'
		)
		THEN '(' + CONVERT(VARCHAR,AL_COLUMN.NUMERIC_PRECISION) + ',' + CONVERT(VARCHAR,AL_COLUMN.NUMERIC_SCALE) + ')'
		WHEN UPPER(AL_COLUMN.DATA_TYPE) IN (''
			,'BINARY'
			,'CHAR'
			,'NCHAR'
			,'NVARCHAR'
			,'VARBINARY'
			,'VARCHAR'
		)
		THEN '(' + REPLACE(CONVERT(VARCHAR,AL_COLUMN.CHARACTER_MAXIMUM_LENGTH),'-1','MAX') + ')'
		ELSE ''
	END)
	AS [CL_SIZE]
	,(CASE UPPER(AL_COLUMN.IS_NULLABLE)
		WHEN 'YES'
		THEN 'NULL'
		ELSE 'NOT NULL'
	END)
	AS [CL_NULL]
	,ISNULL('DEFAULT' + ' ' + AL_COLUMN.COLUMN_DEFAULT,'')
	AS [CL_DEFAULT]
	,AL_COLUMN.ORDINAL_POSITION
	AS [CL_ORDER]
FROM
	INFORMATION_SCHEMA.TABLES AL_TABLE WITH(NOLOCK)
	INNER JOIN INFORMATION_SCHEMA.COLUMNS AS AL_COLUMN WITH(NOLOCK)
		ON AL_COLUMN.TABLE_NAME = AL_TABLE.TABLE_NAME
WHERE 0 = 0
	AND AL_TABLE.TABLE_TYPE = N'BASE TABLE'
	AND AL_TABLE.TABLE_CATALOG = DB_NAME()
	AND AL_TABLE.TABLE_SCHEMA = SCHEMA_NAME()
	AND AL_TABLE.TABLE_NAME NOT IN (''
		,'autoadmin_managed_databases'
		,'autoadmin_master_switch'
		,'autoadmin_system_flags'
		,'backupfile'
		,'MSreplication_options'
		,'spt_fallback_db'
		,'spt_fallback_dev'
		,'spt_fallback_usg'
		,'spt_monitor'
	)
ORDER BY
	 [CL_DATABASE]
	,[CL_TABLE]
	,[CL_ORDER]
