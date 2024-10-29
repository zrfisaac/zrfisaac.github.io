-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.table : 1.0.0

-- # [ mssql ]
IF NOT EXISTS (
	SELECT TOP 1 NULL
	FROM INFORMATION_SCHEMA.TABLES
	WHERE INFORMATION_SCHEMA.TABLES.TABLE_TYPE = 'BASE TABLE'
	AND INFORMATION_SCHEMA.TABLES.TABLE_NAME = 'TB_DUMMY'
)
BEGIN
	CREATE TABLE TB_DUMMY
	(
		-- # : - column
		 CL_ID			INT	IDENTITY(1, 1)	NOT NULL
		,CL_DUMMY		INT						NULL
		,CL_NAME		VARCHAR		( 400)	NOT NULL
		,CL_CHECK		VARCHAR		(   1)		NULL
			CONSTRAINT DF_TB_DUMMY_CL_CHECK
				DEFAULT('N')
			,CONSTRAINT CT_TB_DUMMY_CL_CHECK
				CHECK(CL_CHECK  IN ('Y','N'))

		-- # : - primary
		,CONSTRAINT PK_TB_DUMMY_CL_ID
		PRIMARY KEY (CL_ID)

		-- # : - foreign
		,CONSTRAINT FK_TB_DUMMY_CL_DUMMY
			FOREIGN KEY (CL_DUMMY)
			REFERENCES TB_DUMMY(CL_ID)
	)
END
GO
