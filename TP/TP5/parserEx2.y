%left '+' '-'
%left '*' '/' '%'
%% 
 
start
: statements    { 
                        console.log('Parsed with no errors');
                        return $$; 
                    };
statements
: statement ';' statements
| statement ';'
;

statement
: declaration
| expr
| expr_string
;

declaration
: INT IDENTIFIER ATTRIBUTION INTEGER_NUMBER     { 
                                                    console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4);
                                                }
| DOUBLE IDENTIFIER ATTRIBUTION REAL_NUMBER     {
                                                    console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4);
                                                }
| STRING IDENTIFIER ATTRIBUTION STRING_VALUE    { 
                                                    console.log($1 + ' ' + $2 + ' ' + $3 + ' ' + $4);
                                                }
;

expr
: expr '+' expr
| expr '-' expr
| expr '*' expr
| expr '/' expr
| expr '%' expr
| INTEGER_NUMBER
| REAL_NUMBER
;

expr_string
: expr_string '+' expr_string
| STRING_VALUE
;