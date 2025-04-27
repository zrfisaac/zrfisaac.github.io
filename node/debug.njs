#!/usr/bin/node
// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io
// # - version : zrfisaac.node.hello : 0.0.1

// # [ shell ]

// # - : npm install express

// [ node ]
const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

app.get('/', (req, res) => {
  res.send('GET request received!');
});

app.post('/', (req, res) => {
  console.log(req.body); // Log the incoming request body
  res.send('POST request received!');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
