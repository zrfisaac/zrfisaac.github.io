-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mssql.field : 26.5.19.1

-- # [ mssql ]

-- # - : TB_DEBUG - CL_ID
IF NOT EXISTS(SELECT TOP 1 NULL FROM INFORMATION_SCHEMA.TABLES WITH(NOLOCK) WHERE TABLE_NAME = 'TB_DEBUG')
CREATE TABLE [TB_DEBUG] ([CL_ID] [INT]  NULL )
IF NOT EXISTS(SELECT TOP 1 NULL FROM INFORMATION_SCHEMA.COLUMNS WITH(NOLOCK) WHERE TABLE_NAME = 'TB_DEBUG' AND COLUMN_NAME = 'CL_ID')
ALTER TABLE [TB_DEBUG] ADD [CL_ID] [INT]  NULL
