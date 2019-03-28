"use strict";

var parser = require ('./ex3parser.js').parser;

try {
   console.log(JSON.stringify(parser.parse ('a = 2 * 7 + 14;'), null, 2));
}
catch (e) {
   console.log (e.message);
}