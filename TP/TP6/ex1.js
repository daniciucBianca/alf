"use strict";

var parser = require ('./ex1parser.js').parser;

try {
   console.log(JSON.stringify(parser.parse ('var a, b; 2 + 3 * 5;'), null, 2));
}
catch (e) {
   console.log (e.message);
}