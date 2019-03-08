'use strict';

var fs = require('fs');

try {
    var table = fs.readFileSync('students1220f.csv').toString();

    var students = table.split('\n'); //a

    console.log(students);

    for(let i in students) {
        console.log(students[i].split(';')[2]);
        console.log(students[i].split(';')[1].split(' ').join('\r\n'));
        console.log();
    }

} catch(err) {
    console.error(err);
}