-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.select : 0.0.1

-- # [ mssql ]
SELECT
	 TB_DUMMY.CL_ID
	AS CL_ID
	,TB_DUMMY.CL_NAME
	AS CL_NAME
	,TB_DUMMY.CL_VALUE
	AS CL_VALUE
	,CONVERT(VARCHAR(32),TB_DUMMY.CL_PASSWORD,2)
	AS CL_PASSWORD
	,TB_DUMMY.CL_CHECK
	AS CL_CHECK
	,CONVERT(VARCHAR(10),TB_DUMMY.CL_DATE,103) + ' ' + CONVERT(VARCHAR(5),TB_DUMMY.CL_DATE,114)
	AS CL_DATE
	,TB_DUMMY.CL_DUMMY
	AS CL_DUMMY
FROM
	TB_DUMMY
