"use strict";

var parser = require ('./parserEx4.js').parser;

try {
   parser.parse ('(2 + 5) % 3;');
}
catch (e) {
   console.log (e.message);
   console.log (e.hash);
}