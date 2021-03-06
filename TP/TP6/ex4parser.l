Ws                      \s+
Real_number             [0-9]+\.[0-9]+
Integer_number          [0-9]+
Identifier              [A-Za-z][A-Za-z0-9]*

%%

"var"                   { return 'VAR'; }
";"                     { return ';'; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
","                     { return ','; }
"="                     { return '='; }
"("                     { return 'LP'; }
")"                     { return 'RP'; }

{Ws}                    { /* empty space */}
{Real_number}           { return 'REAL'; }
{Integer_number}        { return 'INTEGER'; }
{Identifier}            { return 'IDENTIFIER'; }