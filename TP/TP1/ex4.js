'use strict';

var os = require('os');

console.log(os.endianness());
console.log(os.homedir());
console.log(os.freemem()/Math.pow(1024, 2));
