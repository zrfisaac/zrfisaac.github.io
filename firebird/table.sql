-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.firebird.table : 1.0.0

-- # [ firebird ]
-- Step 1: Create the table
CREATE TABLE TB_DUMMY (
    CL_ID       INT NOT NULL,
    CL_DUMMY    INT,
    CL_NAME     VARCHAR(400) NOT NULL,
    CL_CHECK    VARCHAR(1) DEFAULT 'N',

    -- Primary Key constraint
    CONSTRAINT PK_TB_DUMMY_CL_ID PRIMARY KEY (CL_ID),
    
    -- Check constraint
    CONSTRAINT CT_TB_DUMMY_CL_CHECK CHECK (CL_CHECK IN ('Y', 'N'))
);

-- Step 2: Create the sequence for auto-incrementing CL_ID
CREATE SEQUENCE SEQ_TB_DUMMY_CL_ID;

-- Step 3: Create a trigger to auto-increment CL_ID on insert
CREATE TRIGGER BI_TB_DUMMY_CL_ID FOR TB_DUMMY
ACTIVE BEFORE INSERT POSITION 0
AS
BEGIN
    IF (NEW.CL_ID IS NULL) THEN
        NEW.CL_ID = NEXT VALUE FOR SEQ_TB_DUMMY_CL_ID;
END;

-- Step 4: Add the foreign key constraint for CL_DUMMY referencing CL_ID
ALTER TABLE TB_DUMMY
ADD CONSTRAINT FK_TB_DUMMY_CL_DUMMY
FOREIGN KEY (CL_DUMMY)
REFERENCES TB_DUMMY (CL_ID);
