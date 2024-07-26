#!/usr/bin/node
// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.web.nodejs.simple : 0.0.2

// # [ nodejs ]

// # : - variable
v_http = require('node:http');

// # - function
function fn_date(date) {
    const pad = (num, size = 2) => String(num).padStart(size, '0');
    const year = date.getFullYear();
    const month = pad(date.getMonth() + 1);
    const day = pad(date.getDate());
    const hours = pad(date.getHours());
    const minutes = pad(date.getMinutes());
    const seconds = pad(date.getSeconds());
    const milliseconds = pad(date.getMilliseconds(), 3);
    return `${year}-${month}-${day} ${hours}.${minutes}.${seconds}.${milliseconds}`;
}

// # - function
fn_http = function (_p_request, _p_response) {
	console.log(`# : request ${fn_date(new Date())}`);
	_p_response.writeHead(200, {'Content-Type': 'text/html'});
	_p_response.end('<h2 style="text-align: center;">Hello World</h2>');
};

// # - routine
server = v_http.createServer(fn_http);
server.listen(3000);
console.log('Server running at http://127.0.0.1:3000/');
