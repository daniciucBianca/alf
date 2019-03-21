"use strict";

var fs = require('fs');
var parser = require ('./parserEx4.js').parser;

try {
    var data = fs.readFileSync('ex6.txt').toString();
    parser.parse (data);
}
catch (e) {
    console.log (e.message);
    console.log (e.hash);
}