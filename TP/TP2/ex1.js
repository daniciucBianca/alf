'use strict';

var number_array = [1, 2, 3];

console.log(number_array); //a

for(let i = 0; i < number_array.length; i++) {
    console.log(number_array[i]);
} //b


for(let i of number_array) {
    console.log(i);
} //c


for(let i in number_array) {
    console.log(number_array[i]);
} //d
