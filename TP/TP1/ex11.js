'use strict';

var number = 100;
var divisors = 1;
var i = 2;

while(i <= number) {
    if(number % i === 0) {
        divisors++;
    }
    i++;
}

console.log('I chose the number ' + number + ' which has ' + divisors + ' divisors');

if(divisors <= 2) {
    console.log('The number is prime');
}
else {
    console.log('The number is not prime')
}
