-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.postgres.fn.consulta : 1.0.0

-- # [ postgres ]
CREATE OR REPLACE FUNCTION fn_consulta(p_consulta VARCHAR)
RETURNS TABLE (
    objeto VARCHAR,
    nome VARCHAR,
    coluna VARCHAR,
    tipo VARCHAR,
    tamanho INTEGER,
    nulo VARCHAR
) AS $$
BEGIN
    RETURN QUERY
    SELECT
        CASE c.relkind
            WHEN 'f' THEN 'FOREIGN KEY'
            WHEN 'r' THEN 'TABLE'
            WHEN 'd' THEN 'DEFAULT'
            WHEN 'p' THEN 'PROCEDURE'
            WHEN 'i' THEN 'INDEX'
            WHEN 'c' THEN 'CONSTRAINT'
            WHEN 'S' THEN 'SEQUENCE'
            WHEN 'v' THEN 'VIEW'
            ELSE 'OTHER'
        END::VARCHAR AS objeto,  
        c.relname::VARCHAR AS nome,  
        a.attname::VARCHAR AS coluna,  
        t.typname::VARCHAR AS tipo,  
        COALESCE(NULLIF(t.typlen, -1), 0)::INTEGER AS tamanho,  -- Handle length correctly for variable-length types
        CASE WHEN a.attnotnull THEN 'NAO' ELSE 'SIM' END::VARCHAR AS nulo  
    FROM
        pg_catalog.pg_class c
    JOIN
        pg_catalog.pg_attribute a ON a.attrelid = c.oid
    JOIN
        pg_catalog.pg_type t ON a.atttypid = t.oid
    WHERE
        c.relkind IN ('f', 'r', 'i', 'c', 'S', 'v')
        AND (a.attname ILIKE '%' || p_consulta || '%' OR c.relname ILIKE '%' || p_consulta || '%')
    ORDER BY
        objeto, nome, coluna;
END;
$$ LANGUAGE plpgsql;
-- /*
SELECT * FROM fn_consulta('');
-- */
