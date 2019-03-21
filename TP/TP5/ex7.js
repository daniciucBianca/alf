"use strict";

var parser = require ('./parserEx7.js').parser;

try {
   parser.parse (' 2 + 3 * 5;');
}
catch (e) {
   console.log (e.message);
   console.log (e.hash);
}