-- # [ zrfisaac ]

-- # [ about ]
-- # - author : Isaac Caires
-- # . - email : zrfisaac@gmail.com
-- # . - site : zrfisaac.github.io
-- # - version : zrfisaac.mysql.user : 1.0.0

-- # [ mysql ]
CREATE USER 'debug'@'%' IDENTIFIED BY 'ABcd!@34';
GRANT ALL PRIVILEGES ON *.* TO 'debug'@'%';
FLUSH PRIVILEGES;
