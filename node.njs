// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.node : 25.6.14.2

// # [ node ]
const http = require('http');
const fs = require('fs');
const path = require('path');
const url = require('url');

const port = 3000;

http.createServer((req, res) => {
  const parsedUrl = url.parse(req.url);
  let pathname = `.${parsedUrl.pathname}`;

  // Se for uma pasta, tenta carregar o index.html dentro dela
  fs.stat(pathname, (err, stats) => {
    if (!err && stats.isDirectory()) {
      pathname = path.join(pathname, 'index.html');
    }

    const ext = path.extname(pathname).toLowerCase();
    const contentType = {
      '.html': 'text/html',
      '.js': 'text/javascript',
      '.css': 'text/css',
      '.json': 'application/json',
      '.png': 'image/png',
      '.jpg': 'image/jpeg',
      '.jpeg': 'image/jpeg',
      '.gif': 'image/gif',
      '.svg': 'image/svg+xml',
      '.wav': 'audio/wav',
      '.mp3': 'audio/mpeg',
    }[ext] || 'application/octet-stream';

    fs.readFile(pathname, (err, data) => {
      if (err) {
        res.writeHead(404, { 'Content-Type': 'text/plain' });
        res.end(`404 Not Found: ${pathname}`);
      } else {
        res.writeHead(200, { 'Content-Type': contentType });
        res.end(data);
      }
    });
  });

}).listen(port);

console.log(`📡 Server running at: http://localhost:${port}/`);
