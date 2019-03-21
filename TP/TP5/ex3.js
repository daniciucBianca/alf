"use strict";

var parser = require ('./parserEx3.js').parser;

try {
   parser.parse ('a + b % 3;');
}
catch (e) {
   console.log (e.message);
   console.log (e.hash);
}