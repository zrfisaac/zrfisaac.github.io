-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.postgres.list.database : 1.0.0

-- # [ postgres ]
DO
$$
DECLARE
    DB RECORD;
	P_TEXT TEXT := E'\n\n';
BEGIN
    FOR DB IN
		SELECT
			DATNAME
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
			DATNAME ASC
    LOOP
		P_TEXT := P_TEXT || 'DROP DATABASE ' || DB.DATNAME || E';\n';
    END LOOP;
   	RAISE NOTICE '%',P_TEXT;
END
$$;
