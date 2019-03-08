'use strict';

var fs = require('fs');

try {
    var passwd = fs.readFileSync('passwd').toString();
    var users = passwd.split('\n');

    console.log(users);

    for(let u of users) {
        let userData = u.split(':');
        let user = {
            username: userData[0],
            password: userData[1],
            userID: userData[2],
            groupID: userData[3],
            userIDInfo: userData[4],
            homeDir: userData[5],
            command: userData[6]
        };

        console.log(user);
    }
} catch(err) {
    console.error(err);
}