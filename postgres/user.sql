-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.postgres.user : 1.0.0

-- # [ postgres ]
CREATE ROLE debug WITH
	LOGIN
	SUPERUSER
	CREATEDB
	CREATEROLE
	INHERIT
	REPLICATION
	BYPASSRLS
	CONNECTION LIMIT -1
	PASSWORD 'ABcd!@34';
