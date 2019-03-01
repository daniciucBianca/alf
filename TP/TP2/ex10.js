'use strict';

var etudiant = {
    nom: 'Mircea',
    points_credit: 120
};

console.log('test console: ' + Object.values(etudiant) + 'and keys: ' + Object.keys(etudiant));
var array_paires = [];

for(let i = 0; i < Object.keys(etudiant).length; i++) {
    var keyVal = [];
    keyVal.push(Object.keys(etudiant)[i], Object.values(etudiant)[i]);
    array_paires.push(keyVal);
}

console.log(array_paires);
