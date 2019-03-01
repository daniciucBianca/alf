'use strict';

function compare(prop) {
    
    return function(e1, e2) {

        if(e1[prop] < e2[prop]) {
            return -1;
        }

        if (e1[prop] > e2[prop]) {
            return 1;
        }

        return 0;
    }
}

var etudiants = [
    { nom: 'Ion', prenom: 'Mihai', points_credit: 35},
    { nom: 'Popescu', prenom: 'Stefan', points_credit: 120},
    { nom: 'Dumitru', prenom: 'Ana-Maria', points_credit: 200},
    { nom: 'Vasile', prenom: 'Anca', points_credit: 170},
    { nom: 'Stanescu', prenom: 'George', points_credit: 100}
];

console.log(etudiants.sort(compare('points_credit')));
console.log(etudiants.sort(compare('prenom')));
