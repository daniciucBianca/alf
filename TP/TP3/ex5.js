'use strict';

var s = '19;4;BREBU L. Alexandra;1220F';

var regex = /[0-9]+;([A-Za-zÀ-ž-]+) ([A-Za-zÀ-ž.]+ )?([A-Za-zÀ-ž -]+);([0-9]+[A-Z])/;

var match = regex.exec(s);
console.log(match);
console.log(match.splice(1, 5).join('\n'));