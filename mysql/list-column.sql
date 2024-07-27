-- # [ zrfisaac ]

-- # [ about ]
-- # - author : isaac caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.web.mysql.list.column : 0.0.1

-- # [ mssql ]
select
	 upper(al_table.table_name)
	as `table`
	,upper(al_column.column_name)
	as `column`
	,upper(al_column.data_type)
	as `type`
	,(case
		when upper(al_column.data_type) in ('char','nvarchar','varbinary','varchar')
			and	al_column.character_maximum_length = -1
		then concat('(','max',')')
		when upper(al_column.data_type) in ('char','nvarchar','varbinary','varchar')
		then concat('(',cast(al_column.character_maximum_length as char(20)),')')
		when upper(al_column.data_type) in ('decimal','double')
		then concat(''
			,'('
			,cast(al_column.numeric_precision as char(10))
			,','
			,cast(al_column.numeric_scale as char(10))
			,')'
		)
		when upper(al_column.data_type) in (
			 'bigint'
			,'blob'
			,'date'
			,'datetime'
			,'enum'
			,'float'
			,'image'
			,'int'
			,'json'
			,'longblob'
			,'longtext'
			,'mediumblob'
			,'mediumtext'
			,'set'
			,'smallint'
			,'text'
			,'time'
			,'timestamp'
			,'tinyint'
		)
		then ''
		else null
	end)
	as `size`
	,(case upper(al_column.is_nullable)
		when 'yes'
		then 'null'
		else 'not null'
	end)
	as `null`
	,ifnull(al_column.column_default,'')
	as `default`
from
	information_schema.tables as al_table
	inner join information_schema.columns as al_column
		on al_column.table_name = al_table.table_name
where 0 = 0
	and al_table.table_type = 'base table'
	 /*
	and not upper(al_column.data_type) in (
		 'bigint'
		,'blob'
		,'char'
		,'date'
		,'datetime'
		,'decimal'
		,'double'
		,'enum'
		,'float'
		,'image'
		,'int'
		,'json'
		,'longblob'
		,'longtext'
		,'mediumblob'
		,'mediumtext'
		,'nvarchar'
		,'set'
		,'smallint'
		,'text'
		,'time'
		,'timestamp'
		,'tinyint'
		,'varbinary'
		,'varchar'
	)
	-- */
order by
	 `table`
	-- ,`column`
	,al_column.ordinal_position
;
