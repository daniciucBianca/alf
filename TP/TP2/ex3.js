'use strict';

function multiply(a, b) {
    console.log(a * b);
} 

multiply(3,4); //a

function multiply2(a, b) {
    return a * b;
} 

console.log(multiply2(3, 4));//b

var mul = multiply2(3, 4);
console.log(mul); //c
