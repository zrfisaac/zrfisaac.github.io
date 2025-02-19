#!/usr/bin/node
// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.node.page : 0.0.1

// [ node ]
const http = require('http');
const server = http.createServer((req, res) => {
	res.writeHead(200, { 'Content-Type': 'text/html' });
	res.end('<html><body><p>zrfisaac.node.page : 3000</p></body></html>');
});
const port = 3000;
server.listen(port, () => {
	console.log(`localhost:${port}`);
});
