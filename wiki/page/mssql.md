# 🗄️ SQL Server

> *Última atualização: 2025-07-27*

SQL Server é um sistema de gerenciamento de banco de dados relacional (SGBD) desenvolvido pela Microsoft, projetado para armazenar, gerenciar e recuperar dados de forma eficiente. Utiliza a linguagem SQL (Structured Query Language) para manipulação e consulta de dados, sendo amplamente usado em aplicações corporativas, financeiras e web. Oferece recursos avançados como transações seguras, alta disponibilidade, integração com ferramentas da Microsoft e suporte a análise de dados, sendo compatível com ambientes Windows e, mais recentemente, também com Linux.

- 🔗 Links
  - 🔗 [`SQL Server 2022 Developer`](https://download.microsoft.com/download/c/c/9/cc9c6797-383c-4b24-8920-dc057c1de9d3/SQL2022-SSEI-Dev.exe)
  - 🔗 [`SQL Server Management Studio 21`](https://download.visualstudio.microsoft.com/download/pr/f55fba7b-3f02-49b7-9aca-a075049a807d/c2d75555c4674948771dd1bb9433103560dbf7ad7bccb1d822818e7af59494cc/vs_SSMS.exe)
- 🏷️ Padrão
  - 🏷️ Banco : `master`
  - 🏷️ Porta : `1433`
  - 🏷️ Usuário : `sa`

## 📚 Índice

- [🛠️ Comandos](#🛠️-comandos)
  - [🧩 Comandos - Restaurar banco de dados](#🧩-comandos---restaurar-banco-de-dados)
- [🔍 Consultas](#🔍-consultas)
  - [🔍 Consultas - Ligações - Buscar](#🔍-consultas---ligações---buscar)
  - [🔍 Consultas - Tabelas - Buscar](#🔍-consultas---tabelas---buscar)
- [💡 Exemplos](#💡-exemplos)
  - [💡 Exemplos - Banco - Criar](#💡-exemplos---banco---criar)
  - [💡 Exemplos - Campo - Criar](#💡-exemplos---campo---criar)
  - [💡 Exemplos - Tabela - Criar](#💡-exemplos---tabela---criar)
  - [💡 Exemplos - Usuário - Criar](#💡-exemplos---usuário---criar)
- [📦 Instalação](#-instalação)
  - [🐳 Instalação - Docker](#-instalação---docker)
  - [🐧 Instalação - Manjaro](#🐧-instalação---manjaro)
  - [🪟 Instalação - Windows](#-instalação---windows)
- [📐 Modelo](#📐-modelo)
  - [📄 Modelo - Dados](#📄-modelo---dados)


## [🛠️ Comandos](#📚-índice)

### [🧩 Comandos - Restaurar banco de dados](#📚-índice)

```sql
RESTORE DATABASE nome_do_banco
FROM DISK = 'C:\caminho\para\arquivo.bak'
WITH REPLACE;
```

## [🔍 Consultas](#📚-índice)

### [🔍 Consultas - Ligações - Buscar](#📚-índice)

### [🔍 Consultas - Tabelas - Buscar](#📚-índice)

## [💡 Exemplos](#📚-índice)

### [💡 Exemplos - Banco - Criar](#📚-índice)

```sql
-- Criar banco se não existir
IF DB_ID('debug') IS NULL
BEGIN
    CREATE DATABASE debug;
END
GO

USE debug;
GO

-- Criar tabela tb_grupo se não existir
IF OBJECT_ID('dbo.tb_grupo', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.tb_grupo (
         cl_id    INT IDENTITY PRIMARY KEY
        ,cl_nome  NVARCHAR(100) NOT NULL
    )
END
GO

-- Criar tabela tb_usuario se não existir
IF OBJECT_ID('dbo.tb_usuario', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.tb_usuario (
         cl_id     INT IDENTITY PRIMARY KEY
        ,cl_nome   NVARCHAR(100) NOT NULL
        ,cl_senha  VARBINARY(128) NOT NULL
    )
END
GO

-- Criar tabela tb_usuario_grupo se não existir
IF OBJECT_ID('dbo.tb_usuario_grupo', 'U') IS NULL
BEGIN
    CREATE TABLE dbo.tb_usuario_grupo (
         cl_id      INT IDENTITY PRIMARY KEY
        ,cl_usuario INT NOT NULL FOREIGN KEY REFERENCES dbo.tb_usuario(cl_id)
        ,cl_grupo    INT NOT NULL FOREIGN KEY REFERENCES dbo.tb_grupo(cl_id)
    )
END
GO

-- Inserir dados exemplo na tb_usuario, usando padrão pedido

INSERT INTO dbo.tb_usuario (
     cl_nome
    ,cl_senha
)
SELECT * FROM (
    SELECT 
         '' AS cl_nome
        ,CAST(NULL AS VARBINARY(128)) AS cl_senha
    WHERE 0 <> 0
    --               ;cl_nome          ;cl_senha
    UNION ALL SELECT 'Alice Johnson'   ,HASHBYTES('MD5', 'password123')
    UNION ALL SELECT 'Bob Smith'       ,HASHBYTES('MD5', 'securepassword456')
    UNION ALL SELECT 'Charlie Brown'   ,HASHBYTES('MD5', 'mypassword789')
    UNION ALL SELECT 'Diana Ross'      ,HASHBYTES('MD5', 'diana123')
    UNION ALL SELECT 'Edward King'     ,HASHBYTES('MD5', 'kingpassword')
) AS AL_DATA
WHERE NOT EXISTS(
    SELECT TOP 1 NULL
    FROM dbo.tb_usuario WITH(NOLOCK)
    WHERE dbo.tb_usuario.cl_nome = AL_DATA.cl_nome
)
GO

-- Inserir dados exemplo na tb_grupo

INSERT INTO dbo.tb_grupo (
     cl_nome
)
SELECT * FROM (
    SELECT 
        '' AS cl_nome
    WHERE 0 <> 0
    --               ;cl_nome
    UNION ALL SELECT 'Admins'
    UNION ALL SELECT 'Users'
) AS AL_DATA
WHERE NOT EXISTS(
    SELECT TOP 1 NULL
    FROM dbo.tb_grupo WITH(NOLOCK)
    WHERE dbo.tb_grupo.cl_nome = AL_DATA.cl_nome
)
GO

-- Exemplo de associação na tb_usuario_grupo

INSERT INTO dbo.tb_usuario_grupo (
     cl_usuario
    ,cl_grupo
)
SELECT
     cl_usuario = dbo.tb_usuario.cl_id
    ,cl_grupo = dbo.tb_grupo.cl_id
FROM (
    SELECT 
         '' AS cl_usuario
        ,'' AS cl_grupo
    WHERE 0 <> 0
    --               ;cl_usuario       ;cl_grupo
    UNION ALL SELECT 'Alice Johnson'   ,'Admins'
    UNION ALL SELECT 'Bob Smith'       ,'Users'
    UNION ALL SELECT 'Charlie Brown'   ,'Users'
    UNION ALL SELECT 'Diana Ross'      ,'Admins'
    UNION ALL SELECT 'Edward King'     ,'Users'
) AS AL_DATA
INNER JOIN dbo.tb_usuario WITH(NOLOCK)
    ON dbo.tb_usuario.cl_nome = AL_DATA.cl_usuario
INNER JOIN dbo.tb_grupo WITH(NOLOCK)
    ON dbo.tb_grupo.cl_nome = AL_DATA.cl_grupo
WHERE NOT EXISTS(
    SELECT TOP 1 NULL
    FROM dbo.tb_usuario_grupo WITH(NOLOCK)
    WHERE dbo.tb_usuario_grupo.cl_usuario = dbo.tb_usuario.cl_id
    AND dbo.tb_usuario_grupo.cl_grupo = dbo.tb_grupo.cl_id
)
GO

-- Consultas de verificação
SELECT * FROM dbo.tb_usuario WITH(NOLOCK)
SELECT * FROM dbo.tb_grupo WITH(NOLOCK)
SELECT * FROM dbo.tb_usuario_grupo WITH(NOLOCK)
```

### [💡 Exemplos - Campo - Criar](#📚-índice)

### [💡 Exemplos - Tabela - Criar](#📚-índice)

### [💡 Exemplos - Usuário - Criar](#📚-índice)

```sql
-- Cria o login no nível do servidor
CREATE LOGIN debug WITH PASSWORD = 'ABcd!@34';

-- Adicione o login ao role de servidor sysadmin
ALTER SERVER ROLE sysadmin ADD MEMBER debug;

-- Cria o banco (se ainda não existir) e define o owner como 'debug'
CREATE DATABASE debug;
ALTER AUTHORIZATION ON DATABASE::debug TO debug;

-- Entra no banco e cria o user
USE debug;
CREATE USER debug FOR LOGIN debug;

-- Dá permissão de leitura/escrita se quiser
ALTER ROLE db_datareader ADD MEMBER debug;
ALTER ROLE db_datawriter ADD MEMBER debug;

-- Nega visualização dos outros bancos
USE master;
DENY VIEW ANY DATABASE TO debug;

-- Garante que ele pode ver e conectar no banco dele
USE debug;
GRANT CONNECT ON DATABASE::debug TO debug;

-- Remova a permissão VIEW ANY DEFINITION do usuário debug (que permite ver metadados do servidor)
DENY VIEW ANY DEFINITION TO debug;
```

## [📦 Instalação](#📚-índice)

### [🐳 Instalação - Docker](#📚-índice)

### [🐧 Instalação - Manjaro](#📚-índice)

```bash
yay -Syy mssql-server --noconfirm
yay -Syy mssql-tools --noconfirm
sudo /opt/mssql/bin/mssql-conf setup
systemctl status mssql-server.service
sudo pacman -Syy dbeaver --noconfirm
```

### [🪟 Instalação - Windows](#📚-índice)

## [📐 Modelo](#📚-índice)

### [📄 Modelo - Dados](#📚-índice)

```sql
SELECT * FROM (
    SELECT
         ''         AS nome
        ,0.00       AS valor
        ,NULL       AS senha
        ,'N'        AS checado
        ,GETDATE()  AS data
        ,NULL       AS reserva
    WHERE 0 <> 0
    --                    nome               valor              senha                                   checado     data                                              reserva
    UNION ALL SELECT    'Alice Johnson'     ,100.50             ,HASHBYTES('MD5', 'password123')        ,'N'        ,CONVERT(DATETIME,'05/01/2023 14:23',103)        ,NULL
    UNION ALL SELECT    'Bob Smith'         ,200.75             ,HASHBYTES('MD5', 'securepassword456')  ,'Y'        ,CONVERT(DATETIME,'23/08/2004 06:02',103)        ,NULL
    UNION ALL SELECT    'Charlie Brown'     ,150.00             ,HASHBYTES('MD5', 'mypassword789')      ,'N'        ,CONVERT(DATETIME,'10/04/2015 17:48',103)        ,NULL
    UNION ALL SELECT    'Diana Ross'        ,175.30             ,HASHBYTES('MD5', 'diana123')           ,'Y'        ,CONVERT(DATETIME,'02/07/2020 09:01',103)        ,NULL
    UNION ALL SELECT    'Edward King'       ,120.00             ,HASHBYTES('MD5', 'kingpassword')       ,'N'        ,CONVERT(DATETIME,'14/05/2007 13:43',103)        ,NULL
) AS al_dado
```
