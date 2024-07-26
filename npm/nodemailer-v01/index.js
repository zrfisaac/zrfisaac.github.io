#!/usr/bin/node
// # [ zrfisaac ]

// # [ about ]
// # - author : Isaac Caires
// # . - email : zrfisaac@gmail.com
// # . - site : zrfisaac.github.io

// # [ nodejs ]
const nodemailer = require('nodemailer');
var transport = nodemailer.createTransport({
   host: "smtp.outlook.com",
   port: 587,
   auth: {
      user: "zrfisaac@outlook.com",
      pass: "1234"
   }
});

message = {
   from: "zrfisaac@outlook.com",
   to: "zrfisaac@gmail.com",
   subject: "Subject",
   text: "Hello SMTP Email"
}
transport.sendMail(message, function(err, info) {
   if (err) {
      console.log(err);
   } else {
   console.log(info);
   }
});
