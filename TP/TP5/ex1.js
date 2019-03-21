"use strict";

var parser = require ('./parserEx1.js').parser;

try {
   parser.parse (' string c <- "alf";');
}
catch (e) {
   console.log (e.message);
   console.log (e.hash);
}