"use strict";

var parser = require ('./parserEx2.js').parser;

try {
   parser.parse ('3 + 10 % 5 - 3;');
}
catch (e) {
   console.log (e.message);
   console.log (e.hash);
}