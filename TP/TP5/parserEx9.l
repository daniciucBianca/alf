Ws                      \s+
Real_number             [0-9]+\.[0-9]+
Integer_number          [0-9]+
String_value            \"[^\"]+\"|\'[^\']+\'
Identifier              [A-Za-z][A-Za-z0-9]*

%%

"int"                   { return 'INT'; }
"double"                { return 'DOUBLE'; }
"string"                { return 'STRING'; }
"true"                  { return 'TRUE'; }
"false"                 { return 'FALSE'; }
"boolean"               { return 'BOOLEAN'; }
";"                     { return ';'; }
"<-"                    { return 'ATTRIBUTION'; }
"+"                     { return '+'; }
"-"                     { return '-'; }
"*"                     { return '*'; }
"/"                     { return '/'; }
"%"                     { return '%'; }
"("                     { return 'LP'; }
")"                     { return 'RP'; }
"&&"                    { return 'AND'; }
"||"                    { return 'OR'; }
"!"                     { return 'NOT'; }


{Ws}                    { /* empty space */}
{Real_number}           { return 'REAL_NUMBER'; }
{Integer_number}        { return 'INTEGER_NUMBER'; }
{String_value}          { return 'STRING_VALUE'; }
{Identifier}            { return 'IDENTIFIER'; }
