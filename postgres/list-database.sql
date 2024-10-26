-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.postgres.list.database : 1.0.0

-- # [ postgres ]
SELECT
	DATNAME
	AS "DATABASE"
FROM
	PG_DATABASE
WHERE
	DATISTEMPLATE = FALSE
	AND DATALLOWCONN = TRUE
	AND DATNAME NOT IN (
		 'postgres'
		,'template0'
		,'template1'
	)
ORDER BY
	"DATABASE" ASC
;
