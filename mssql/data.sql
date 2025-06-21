-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.data : 0.0.1

-- # [ mssql ]
SELECT * FROM (
	SELECT
		 ''			AS	CL_NAME
		,0.00		AS	CL_VALUE
		,NULL		AS	CL_PASSWORD
		,'N'		AS	CL_CHECK
		,GETDATE()	AS	CL_DATE
		,NULL		AS	CL_DUMMY
	WHERE 0 <> 0
	--					CL_NAME				CL_VALUE			CL_PASSWORD								CL_CHECK	CL_DATE											CL_DUMMY
	UNION ALL SELECT	'Alice Johnson'		,100.50				,HASHBYTES('MD5', 'password123')		,'N'		,CONVERT(DATETIME,'05/01/2023 14:23',103)		,NULL
	UNION ALL SELECT	'Bob Smith'			,200.75				,HASHBYTES('MD5', 'securepassword456')	,'Y'		,CONVERT(DATETIME,'23/08/2004 06:02',103)		,NULL
	UNION ALL SELECT	'Charlie Brown'		,150.00				,HASHBYTES('MD5', 'mypassword789')		,'N'		,CONVERT(DATETIME,'10/04/2015 17:48',103)		,NULL
	UNION ALL SELECT	'Diana Ross'		,175.30				,HASHBYTES('MD5', 'diana123')			,'Y'		,CONVERT(DATETIME,'02/07/2020 09:01',103)		,NULL
	UNION ALL SELECT	'Edward King'		,120.00				,HASHBYTES('MD5', 'kingpassword')		,'N'		,CONVERT(DATETIME,'14/05/2007 13:43',103)		,NULL
) AS AL_DATA
