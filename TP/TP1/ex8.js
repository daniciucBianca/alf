'use strict';

var os = require('os');
var chalk = require('chalk');

var end = os.endianness();
var homedir = os.homedir();
var freeMem_kB = os.freemem()/1024;
var freeMem_MB = os.freemem()/Math.pow(1024, 2);

console.log(chalk.blue(end));
console.log(chalk.red(homedir));
console.log(chalk.green(freeMem_kB));
console.log(chalk.magenta(freeMem_MB));
