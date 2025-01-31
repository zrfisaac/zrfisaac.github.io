#!/usr/bin/node
// [ zrfisaac ]

// [ about ]
// - author : Isaac Caires
// . - email : zrfisaac@gmail.com
// . - site : zrfisaac.github.io
// version : zrfisaac.node.hello : 1.0.0

// [ shell ]

// # - : npm install express

// [ node ]
const express = require('express');
const app = express();
const port = 3000;

// Middleware for error handling
app.use((err, req, res, next) => {
    console.error(err.message); // Log the error message
    res.status(500).json({ error: err.message }); // Respond with an error message
});

app.get('/', async (req, res) => {
    try {
        // Simulating some processing
        const message = 'Hello, World!';
        res.json({ result: message });
    } catch (error) {
        // If an error occurs, pass it to the error handling middleware
        next(error);
    }
});

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
});
