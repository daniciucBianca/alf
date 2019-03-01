'use strict';

var a = [];
var diff = Math.floor(Math.random() * 50);

for(let i = 0; i < 9; i++) {
    a.push(Math.floor(Math.random() * 50));
    diff -= a[i];
}

console.log(diff);
