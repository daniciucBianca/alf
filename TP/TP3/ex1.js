'use strict';

var s = '4;BREBU L. Alexandra;1220F';

console.log(s.indexOf('Alexandra')); //a
console.log(s.lastIndexOf(';')); //b

var a = s.split(';');
var name = a[1].split(' ');

for(let i of name) {
    console.log(i);
} //c