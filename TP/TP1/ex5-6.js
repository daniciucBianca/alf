'use strict';

var os = require('os');
var fs = require('fs');

var end = os.endianness();
var homedir = os.homedir();
var freeMem_kB = os.freemem()/1024;
var freeMem_MB = os.freemem()/Math.pow(1024, 2);

var result = end + ' ' + homedir + ' ' + freeMem_kB + ' ' + freeMem_MB;
console.log(result);

try {
    fs.writeFileSync('system.info', result, 'utf8');
} catch(err) {
    console.log('Erreur!');
}
