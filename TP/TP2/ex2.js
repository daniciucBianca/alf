'use strict';

console.log(test);
var parameters = process.argv.splice(2, process.argv.length - 1);

console.log(parameters); //a

console.log(parameters.length);; //b

for(let param of parameters) {
    console.log(param);
} //c
