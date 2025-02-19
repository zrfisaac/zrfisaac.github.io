#!/usr/bin/node
// [ zrfisaac ]

// [ about ]
// - author : Isaac Caires
// . - email : zrfisaac@gmail.com
// . - site : zrfisaac.github.io
// version : zrfisaac.local : 0.0.1

// [ shell ]

// # - : npm install express

// [ node ]
const express = require("express");
const path = require("path");
const app = express();
const PORT = 3000;
app.use(express.static(path.join(__dirname)));
app.listen(PORT, () => {
	console.log(`Server running at http://localhost:${PORT}`);
});
