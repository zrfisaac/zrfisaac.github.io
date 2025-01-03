-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.oracle.search.table : 1.0.0

-- # [ oracle ]
SELECT 
    UPPER(AL_TABLE.TABLE_NAME) AS "TABLE", 
    UPPER(AL_COLUMN.COLUMN_NAME) AS "COLUMN", 
    AL_COLUMN.DATA_TYPE AS "DATA TYPE", 
    AL_COLUMN.DATA_LENGTH AS "LENGTH", 
    AL_COLUMN.DATA_PRECISION AS "PRECISION", 
    AL_COLUMN.DATA_SCALE AS "SCALE"
FROM 
    ALL_TABLES AL_TABLE
    INNER JOIN ALL_TAB_COLUMNS AL_COLUMN 
        ON UPPER(AL_COLUMN.TABLE_NAME) = UPPER(AL_TABLE.TABLE_NAME)
WHERE 
    UPPER(AL_TABLE.OWNER) = UPPER(USER)
    AND UPPER(AL_TABLE.TABLE_NAME) LIKE UPPER('%%')
    AND UPPER(AL_COLUMN.COLUMN_NAME) LIKE UPPER('%%')
ORDER BY 
    UPPER(AL_TABLE.TABLE_NAME), 
    AL_COLUMN.COLUMN_ID;
