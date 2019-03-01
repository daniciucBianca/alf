'use strict';

var etudiant = {
    nom: process.argv[2],
    prenom: process.argv[3],
    points_credit: process.argv[4]
};

console.log(etudiant); //a

console.log(Object.keys(etudiant)); //b

var etudiants = [
    { nom: 'Ion', prenom: 'Mihai', points_credit: 35},
    { nom: 'Popescu', prenom: 'Stefan', points_credit: 100},
    { nom: 'Dumitru', prenom: 'Ana-Maria', points_credit: 120},
    { nom: 'Vasile', prenom: 'Anca', points_credit: 200},
    { nom: 'Stanescu', prenom: 'George', points_credit: 150}
]; //c

var max = etudiants[0];
for(let e of etudiants) {
    if(max.points_credit < e.points_credit) {
        max = e;
    }
}
console.log(max); //d

var mul = 1;
for(let e of etudiants) {
    mul *= e.points_credit;
}
console.log(Math.sqrt(mul)); //e

var etud = etudiants[0];
for(let e of etudiants) {
    if(e.prenom.length > etud.prenom.length) {
        etud = e;
    }
}
console.log(etud); //f

console.log(etudiants.sort(function(e1, e2) {
    if(e1.nom < e2.nom) {
        return -1;
    }

    if(e1.nom > e2.nom) {
        return 1;
    }

    return 0;
})); //g
