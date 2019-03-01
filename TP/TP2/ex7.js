'use strict';

var etudiants = [
    { nom: 'Ion', prenom: 'Mihai', points_credit: 35},
    { nom: 'Popescu', prenom: 'Stefan', porints_credit: 100},
    { nom: 'Dumitru', prenom: 'Ana-Maria', points_credit: 120},
    { nom: 'Vasile', prenom: 'Anca', points_credit: 200},
    { nom: 'Stanescu', prenom: 'George', points_credit: 150}
];
var nom = process.argv[2];
var addresse = {
    ville: process.argv[3],
    rue: process.argv[4],
    numero: process.argv[5]
};

for(let e of etudiants) {
    if(e.nom === nom) {
        e.addresse = addresse;
        console.log(e);
        break;
    }
}
