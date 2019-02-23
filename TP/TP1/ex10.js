'use strict';

for(let i = 1; i <= 300; i++) {
    console.log(i);
} //a

for(let i = 300; i >= 1; i--) {
    console.log(i);
} //b

for(let i = 1; i <= 300; i++) {
    if(i % 9 === 0) {
        console.log(i);
    }
} //c

for(let i = 1; i <= 300; i++) {
    if(i % 7 === 0 && i % 5 === 0) {
        console.log(i);
    }
} //d

for(let i = 1; i <= 300; i++) {
    if(i % 3 === 0 || i % 7 === 0) {
        console.log(i);
    }
} //e
