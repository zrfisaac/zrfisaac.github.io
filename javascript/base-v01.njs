#!/usr/bin/node
// [ zrfisaac ]

// [ about ]
// - author : Isaac Caires
// . - email : zrfisaac@gmail.com
// . - site : zrfisaac.github.io
// version : zrfisaac.javascript.base.v01 : 1.0.0

// [ javascript ]

// - variable
let v_end_error = false;
let v_end_message = "";

// : - about
console.log("# [ about ]");
console.log("# - author : Isaac Caires");
console.log("# . - email : zrfisaac@gmail.com");
console.log("# . - site : zrfisaac.github.io");
console.log("# - version : zrfisaac.javascript.base.v01 : 1.0.0");
console.log("");

// : - main
if (!v_end_error) {
    console.log("# [ main ]");
    try {
        // : - routine
        console.log("# - routine");
    } catch (exception) {
        v_end_error = true;
        v_end_message = String(exception);
    }
    console.log("");
}

// : - end
console.log("# [ end ]");
if (v_end_error) {
    console.log("# - error");
} else {
    console.log("# - success");
}
if (v_end_message !== "") {
    console.log(`# . - message : ${v_end_message}`);
}

// Wait for user input before exiting
process.stdin.resume();
process.stdin.on('data', process.exit.bind(process, 0));
