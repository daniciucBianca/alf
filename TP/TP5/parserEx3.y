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
: expr '+' expr                                 {
                                                    console.log($1 + ' + ' + $3);
                                                    var variables = [];
                                                    if(isNaN($1)) {
                                                        variables.push($1);
                                                    }
                                                    if(isNaN($3)) {
                                                        variables.push($3);
                                                    }
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) + parseFloat($3);
                                                        console.log($$);
                                                    }
                                                }
| expr '-' expr                                 {
                                                    console.log($1 + ' - ' + $3);
                                                    var variables = [];
                                                    if(isNaN($1)) {
                                                        variables.push($1);
                                                    }
                                                    if(isNaN($3)) {
                                                        variables.push($3);
                                                    }
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) - parseFloat($3);
                                                        console.log($$);
                                                    }
                                                }
| expr '*' expr                                 {
                                                    console.log($1 + ' * ' + $3);
                                                    var variables = [];
                                                    if(isNaN($1)) {
                                                        variables.push($1);
                                                    }
                                                    if(isNaN($3)) {
                                                        variables.push($3);
                                                    }
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) * parseFloat($3);
                                                        console.log($$);
                                                    }
                                                }
| expr '/' expr                                 {
                                                    console.log($1 + ' / ' + $3);
                                                    var variables = [];
                                                    if(isNaN($1)) {
                                                        variables.push($1);
                                                    }
                                                    if(isNaN($3)) {
                                                        variables.push($3);
                                                    }
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) / parseFloat($3);
                                                        console.log($$);
                                                    }
                                                }
| expr '%' expr                                 {
                                                    console.log($1 + ' % ' + $3);
                                                    var variables = [];
                                                    if(isNaN($1)) {
                                                        variables.push($1);
                                                    }
                                                    if(isNaN($3)) {
                                                        variables.push($3);
                                                    }
                                                    if(variables.length !== 0) {
                                                        console.log('The expression contains variables : ' + variables.toString());
                                                    }
                                                    else {
                                                        $$ = parseFloat($1) % parseFloat($3);
                                                        console.log($$);
                                                    }
                                                }
| INTEGER_NUMBER                                {
                                                    $$ = $1;
                                                }
| REAL_NUMBER                                   {
                                                    $$ = $1;
                                                }
| IDENTIFIER                                    {
                                                    $$ = $1;
                                                }
;

expr_string
: expr_string '+' expr_string                   {
                                                    $$ = $1 + $3;
                                                }
| STRING_VALUE                                  {
                                                    $$ = JSON.parse($1);
                                                }
;