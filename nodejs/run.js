// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires Santana
// # - email : zrfisaac@gmail.com
// # - site : zrfisaac.github.io
// # - version : zrfisaac.nodejs.run : 25.8.12.1

// # [ nodejs ]
const express = require("express");
const path = require("path");
const app = express();
const PORT = 8080;
const staticFolder = path.join(__dirname, "../");
app.use(express.static(staticFolder));
app.listen(PORT, () => {
	console.log(`Server running at http://localhost:${PORT}`);
});
