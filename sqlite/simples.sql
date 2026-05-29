-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires Santana
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.sqlite.simples : 26.5.29.1

-- # [ sqlite ]

-- # : TB_DUMMY
CREATE TABLE IF NOT EXISTS TB_DUMMY (
    CL_ID INTEGER PRIMARY KEY AUTOINCREMENT,
    CL_NOME TEXT NOT NULL,
    CL_CRIACAO DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


-- # : TB_DUMMY - CL_NOME
ALTER TABLE TB_DUMMY
ADD COLUMN CL_NOME TEXT NOT NULL DEFAULT '';

-- # : TB_DUMMY - CL_CRIACAO
ALTER TABLE TB_DUMMY
ADD COLUMN CL_CRIACAO DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP;
