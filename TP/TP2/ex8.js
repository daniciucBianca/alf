'use strict';

function hasProp(obj, prop) {
    
    let properties = Object.keys(obj);
    
    if(properties.indexOf(prop) >= 0) {
        return true;
    }

    return false;
}

var etudiant = {
    nom: 'Popescu',
    prenom: 'Andrei',
    points_credit: 20
};

console.log(hasProp(etudiant, 'points_credit'));
console.log(hasProp(etudiant, 'addresse'));
