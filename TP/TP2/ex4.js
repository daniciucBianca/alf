'use strict';

function circleArea(d) {
    let r = d / 2;
    console.log(parseInt(Math.PI * Math.pow(r, 2)));
}

function circleCircumference(d) {
    let r = d / 2;
    console.log(parseInt(2 * Math.PI * r));
}


var d = process.argv[2];

circleArea(d);
circleCircumference(d);
