# <img src="/wiki/icon/mssql.png" alt="Ícone" width="24"> SQL Server

> *Última atualização: 2025-08-09*

O SQL Server é um sistema de gerenciamento de banco de dados relacional (SGBDR) desenvolvido pela Microsoft. Ele é amplamente utilizado em ambientes corporativos para armazenar, gerenciar e recuperar dados.

- [📦 SQL Server 2022 Developer](https://download.microsoft.com/download/c/c/9/cc9c6797-383c-4b24-8920-dc057c1de9d3/SQL2022-SSEI-Dev.exe)
- [📦 SQL Server Management Studio 21](https://download.visualstudio.microsoft.com/download/pr/f55fba7b-3f02-49b7-9aca-a075049a807d/c2d75555c4674948771dd1bb9433103560dbf7ad7bccb1d822818e7af59494cc/vs_SSMS.exe)

## 📦 Banco

- Lista os arquivos internos contidos no backup.

```sql
RESTORE FILELISTONLY
FROM DISK = '/BANCO.bak';
```

- Restaura o banco usando caminhos especificados para MDF e LDF.

```sql
RESTORE DATABASE BANCO
FROM DISK = '/BANCO.bak'
WITH
    MOVE 'BANCO_Data' TO '/var/opt/mssql/data/BANCO.mdf',
    MOVE 'BANCO_Log' TO '/var/opt/mssql/data/BANCO.ldf',
    REPLACE;
```

- Oculta todos os outros bancos do usuário informado.

```sql
USE master;
DENY VIEW ANY DATABASE TO zrfisaac;
REVOKE VIEW ANY DATABASE TO zrfisaac;
```

## 👤 Usuário

- Desativa senha forte e define nova senha para o login.

```sql
ALTER LOGIN SeuLogin WITH CHECK_POLICY = OFF;
ALTER LOGIN SeuLogin WITH PASSWORD = 'ABcd!@34';
```
