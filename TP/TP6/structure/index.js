"use strict";

var parser = require ('./alf.js').parser;

try {
   console.log(JSON.stringify(parser.parse ('var a, b'), null, 2));
}
catch (e) {
   console.log (e.message);
}