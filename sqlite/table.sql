-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.sqlite.table : 1.0.1

-- # [ sqlite ]
-- Drop table if it exists
DROP TABLE IF EXISTS TB_DUMMY;

-- Create the table if it doesn't exist
CREATE TABLE IF NOT EXISTS TB_DUMMY (
    CL_ID INTEGER PRIMARY KEY AUTOINCREMENT,    -- Auto-increment column
    CL_DUMMY INTEGER,                           -- Foreign key column
    CL_NAME TEXT NOT NULL,                      -- Name column
    CL_VALUE REAL,                              -- Value column
    CL_PASSWORD BLOB,                           -- Password column (Stored as BLOB, no hashing in SQLite)
    CL_CHECK TEXT NOT NULL DEFAULT 'N',         -- Check column with default 'N'
    CL_DATE DATETIME,                           -- Date column
    FOREIGN KEY (CL_DUMMY) REFERENCES TB_DUMMY (CL_ID) -- Foreign key constraint
);

-- Insert default data if it doesn't already exist
INSERT INTO TB_DUMMY (CL_NAME, CL_VALUE, CL_PASSWORD, CL_CHECK, CL_DATE, CL_DUMMY)
SELECT 'Alice Johnson', 100.50, NULL, 'N', '2023-05-01 14:23:00', NULL
UNION ALL
SELECT 'Bob Smith', 200.75, NULL, 'Y', '2004-08-23 06:02:00', NULL
UNION ALL
SELECT 'Charlie Brown', 150.00, NULL, 'N', '2015-04-10 17:48:00', NULL
UNION ALL
SELECT 'Diana Ross', 175.30, NULL, 'Y', '2020-07-02 09:01:00', NULL
UNION ALL
SELECT 'Edward King', 120.00, NULL, 'N', '2007-05-14 13:43:00', NULL
WHERE NOT EXISTS (
    SELECT 1
    FROM TB_DUMMY
    WHERE CL_NAME = 'Alice Johnson' AND CL_VALUE = 100.50 AND CL_CHECK = 'N'
)
AND NOT EXISTS (
    SELECT 1
    FROM TB_DUMMY
    WHERE CL_NAME = 'Bob Smith' AND CL_VALUE = 200.75 AND CL_CHECK = 'Y'
)
AND NOT EXISTS (
    SELECT 1
    FROM TB_DUMMY
    WHERE CL_NAME = 'Charlie Brown' AND CL_VALUE = 150.00 AND CL_CHECK = 'N'
)
AND NOT EXISTS (
    SELECT 1
    FROM TB_DUMMY
    WHERE CL_NAME = 'Diana Ross' AND CL_VALUE = 175.30 AND CL_CHECK = 'Y'
)
AND NOT EXISTS (
    SELECT 1
    FROM TB_DUMMY
    WHERE CL_NAME = 'Edward King' AND CL_VALUE = 120.00 AND CL_CHECK = 'N'
);

-- Select data from the table
SELECT
    CL_ID,
    CL_NAME,
    CL_VALUE,
    HEX(CL_PASSWORD) AS CL_PASSWORD,   -- Convert BLOB password to hexadecimal string
    CL_CHECK,
    DATETIME(CL_DATE) AS CL_DATE,      -- Convert DATETIME format
    CL_DUMMY
FROM TB_DUMMY;
