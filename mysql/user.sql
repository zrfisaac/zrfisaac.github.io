-- # [ zrfisaac ]

-- # [ about ]
-- # - author : isaac caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.web.mysql.user : 0.0.1

-- # [ postgres ]
create schema debug;
create user 'debug' identified by '1234';
create user 'debug'@'localhost' identified by '1234';
-- create user 'debug'@'127.0.0.1' identified by '1234';
-- create user 'debug'@'%' identified by 'password';
grant all privileges on *.* to 'debug'@'localhost';
flush privileges;
