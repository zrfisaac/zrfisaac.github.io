-- # [ zrfisaac ]

-- # [ about ]
-- # - author : isaac caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.web.mysql.procedure : 0.0.1

-- # [ mysql ]
drop procedure if exists pr_procedure;
delimiter //
create procedure pr_procedure
(
    in p_id int,
    in p_name varchar(100)
) begin
	select
		 p_id
		as id
		,p_name
		as name
	;
end;
//
-- /*
call pr_procedure(
	 1
	,'blue'
);
-- */
