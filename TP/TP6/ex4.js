"use strict";

var parser = require ('./ex4parser.js').parser;

try {
   console.log(JSON.stringify(parser.parse ('print (a, 2.5, 40*5/2);'), null, 2));
}
catch (e) {
   console.log (e.message);
}