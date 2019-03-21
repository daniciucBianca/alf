"use strict";

var fs = require('fs');
var parser = require ('./parserEx8.js').parser;

try {
    parser.parse ('true && !false || false; boolean b <- true;');
}
catch (e) {
    console.log (e.message);
    console.log (e.hash);
}