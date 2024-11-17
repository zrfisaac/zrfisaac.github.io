unit debug_unit;

{$mode ObjFPC}
{$H+}

interface

uses
  Classes,
  SysUtils;

const
  SQL_SUCCESS = 0;
  SQL_HANDLE_ENV = 1;
  SQL_FETCH_FIRST = 2;
  SQL_FETCH_NEXT = 1;
  SQL_MAX_DSN_LENGTH = 255;
  SQL_ATTR_ODBC_VERSION = 200;
  SQL_OV_ODBC3 = 3;

type
  SQLHENV = Pointer;
  SQLCHAR = AnsiChar;
  PSQLCHAR = PAnsiChar;
  SQLRETURN = SmallInt;
  SQLSMALLINT = SmallInt;
  SQLPOINTER = Pointer;

procedure ListODBCDataSources;
procedure ListODBCDrivers;

function SQLAllocHandle(HandleType: SmallInt; InputHandle: SQLHENV; var OutputHandle: SQLHENV): SQLRETURN; stdcall; external 'odbc32.dll' name 'SQLAllocHandle';
function SQLSetEnvAttr(EnvironmentHandle: SQLHENV; Attribute: SQLSMALLINT; ValuePtr: SQLPOINTER; StringLength: SQLSMALLINT): SQLRETURN; stdcall; external 'odbc32.dll' name 'SQLSetEnvAttr';
function SQLDataSources(EnvironmentHandle: SQLHENV; Direction: SQLSMALLINT; ServerName: PSQLCHAR; BufferLength1: SQLSMALLINT; var NameLength1: SQLSMALLINT;
                        Description: PSQLCHAR; BufferLength2: SQLSMALLINT; var NameLength2: SQLSMALLINT): SQLRETURN; stdcall; external 'odbc32.dll' name 'SQLDataSources';
function SQLDrivers(EnvironmentHandle: SQLHENV; Direction: SQLSMALLINT; DriverDescription: PSQLCHAR; BufferLength1: SQLSMALLINT; var DescriptionLength: SQLSMALLINT;
                    DriverAttributes: PSQLCHAR; BufferLength2: SQLSMALLINT; var AttributesLength: SQLSMALLINT): SQLRETURN; stdcall; external 'odbc32.dll' name 'SQLDrivers';
function SQLFreeHandle(HandleType: SmallInt; Handle: SQLHENV): SQLRETURN; stdcall; external 'odbc32.dll' name 'SQLFreeHandle';

implementation

procedure ListODBCDataSources;
var
  Env: SQLHENV;
  RetCode: SQLRETURN;
  Name, Desc: array[0..SQL_MAX_DSN_LENGTH] of SQLCHAR;
  NameLen, DescLen: SQLSMALLINT;
begin
  // Allocate an environment handle
  RetCode := SQLAllocHandle(SQL_HANDLE_ENV, nil, Env);
  if RetCode = SQL_SUCCESS then
  try
    // Set the environment attribute to use ODBC version 3
    SQLSetEnvAttr(Env, SQL_ATTR_ODBC_VERSION, Pointer(SQL_OV_ODBC3), 0);

    WriteLn('ODBC Data Sources:');
    // Enumerate DSNs
    RetCode := SQLDataSources(Env, SQL_FETCH_FIRST, @Name, SQL_MAX_DSN_LENGTH, NameLen,
                              @Desc, SQL_MAX_DSN_LENGTH, DescLen);
    while RetCode = SQL_SUCCESS do
    begin
      WriteLn('Name: ', PChar(@Name), ' - Description: ', PChar(@Desc));
      RetCode := SQLDataSources(Env, SQL_FETCH_NEXT, @Name, SQL_MAX_DSN_LENGTH, NameLen,
                                @Desc, SQL_MAX_DSN_LENGTH, DescLen);
    end;
  finally
    SQLFreeHandle(SQL_HANDLE_ENV, Env);
  end;
end;

procedure ListODBCDrivers;
var
  Env: SQLHENV;
  RetCode: SQLRETURN;
  DriverName, Attr: array[0..SQL_MAX_DSN_LENGTH] of SQLCHAR;
  NameLen, AttrLen: SQLSMALLINT;
begin
  // Allocate an environment handle
  RetCode := SQLAllocHandle(SQL_HANDLE_ENV, nil, Env);
  if RetCode = SQL_SUCCESS then
  try
    // Set the environment attribute to use ODBC version 3
    SQLSetEnvAttr(Env, SQL_ATTR_ODBC_VERSION, Pointer(SQL_OV_ODBC3), 0);

    WriteLn('ODBC Drivers:');
    // Enumerate Drivers
    RetCode := SQLDrivers(Env, SQL_FETCH_FIRST, @DriverName, SQL_MAX_DSN_LENGTH, NameLen,
                          @Attr, SQL_MAX_DSN_LENGTH, AttrLen);
    while RetCode = SQL_SUCCESS do
    begin
      WriteLn('Driver: ', PChar(@DriverName), ' - Attributes: ', PChar(@Attr));
      RetCode := SQLDrivers(Env, SQL_FETCH_NEXT, @DriverName, SQL_MAX_DSN_LENGTH, NameLen,
                            @Attr, SQL_MAX_DSN_LENGTH, AttrLen);
    end;
  finally
    SQLFreeHandle(SQL_HANDLE_ENV, Env);
  end;
end;

end.

