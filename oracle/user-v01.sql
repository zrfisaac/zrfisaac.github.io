-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.oracle.user.v01 : 1.0.1

-- # [ shell ]

-- # - : C:\app\%USERNAME%\product\21c\dbhomeXE\bin\sqlplus.exe / as sysdba
-- # - : C:\app\%USERNAME%\virtual\product\12.2.0\dbhome_1\bin\sqlplus.exe / as sysdba
-- # - : C:\oraclexe\app\oracle\product\10.2.0\server\BIN\sqlplus.exe sys as sysdba
-- # - : C:\XEClient\bin\sqlplus.exe / as sysdba

-- # [ oracle ]

-- # : - destroy
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
-- # : The REVOKE command removes specific privileges or roles from a user, and if not executed before dropping an administrative user, the error ORA-28014 will occur.
-- REVOKE DBA FROM DEBUG;
-- # : CASCADE Ensures that all objects owned by the user are also deleted. Without CASCADE, Oracle will not allow you to drop a user if they own any objects.
DROP USER DEBUG CASCADE;

-- # : - create
ALTER SESSION SET "_ORACLE_SCRIPT"=TRUE;
CREATE USER "DEBUG" IDENTIFIED BY "ABcd!@34" DEFAULT TABLESPACE USERS TEMPORARY TABLESPACE TEMP PROFILE "DEFAULT" ACCOUNT UNLOCK;
GRANT UNLIMITED TABLESPACE TO "DEBUG";
GRANT "CONNECT" TO "DEBUG";
GRANT DBA TO "DEBUG";
GRANT "RESOURCE" TO "DEBUG";
GRANT CREATE SESSION,CREATE TABLE,CREATE VIEW TO DEBUG;
GRANT SELECT ON SYS.USER$ TO DEBUG;
GRANT SELECT ON SYS.OBJ$ TO DEBUG;
