-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.procedure : 0.0.1

-- # [ mssql ]
IF  EXISTS (
	SELECT TOP 1 NULL
	FROM SYSOBJECTS WITH(NOLOCK)
	WHERE XTYPE = N'P'
	AND NAME = N'PR_DEBUG'
) DROP PROCEDURE PR_DEBUG
GO
CREATE PROCEDURE PR_DEBUG
	@P_DATA VARCHAR(32)
AS
	SELECT @P_DATA AS P_DEBUG
GO
EXEC PR_DEBUG @P_DATA = 'DEBUG'
