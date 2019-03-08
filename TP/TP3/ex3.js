'use strict';

var fs = require('fs');

try {
    var table = fs.readFileSync('students1220f.csv').toString();

    var students = table.split('\n'); //a

    console.log(students);

    for(let s of students) {
        let student = {};
        if(s.split(';')[1].split(' ').length < 3) {
            student = {
                lastName: s.split(';')[1].split(' ')[0],
                firstName: s.split(';')[1].split(' ')[1],
                group: s.split(';')[2]
            }; 
        }
        else {
            student = {
                lastName: s.split(';')[1].split(' ')[0],
                initials: s.split(';')[1].split(' ')[1],
                firstName: s.split(';')[1].split(' ')[2],
                group: s.split(';')[2]
            };
        }

        console.log(student);
    } //b

} catch(err) {
    console.error(err);
}