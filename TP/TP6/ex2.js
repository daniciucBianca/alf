"use strict";

var parser = require ('./ex2parser.js').parser;

try {
   console.log(JSON.stringify(parser.parse ('a = 2;'), null, 2));
}
catch (e) {
   console.log (e.message);
}