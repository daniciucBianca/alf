%% 
 
start
: declaration ';'   { 
                        return $$; 
                    };

declaration
: INT IDENTIFIER ATTRIBUTION INTEGER_NUMBER     { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| DOUBLE IDENTIFIER ATTRIBUTION REAL_NUMBER     { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
| STRING IDENTIFIER ATTRIBUTION STRING_VALUE    { console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4); }
;