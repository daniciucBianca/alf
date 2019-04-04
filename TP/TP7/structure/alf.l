Newline               \r?\n
Ws                    [ \t]
Number                [0-9]+("."[0-9]+)?
String_value          \"[^\"]*\"
Identifier            [A-Za-z][A-Za-z0-9]*


%%


"var"                 { return 'VAR'; }
"of"                  { return 'OF'; }
"int"                 { return 'INT'; }
"float"               { return 'FLOAT'; }
"string"              { return 'STRING'; }
"function"            { return 'FUNCTION'; }
"endfunction"         { return 'END_FUNCTION'; }
"="				      { return '='; }
"-"                   { return '-'; }
"+"                   { return '+'; }
"*"                   { return '*'; }
"/"                   { return '/'; }
"("                   { return 'LP'; }
")"	                  { return 'RP'; }
','				      { return ','; }
{Ws}                  { /*skip whitespace*/ }
{Newline}             { return 'NEWLINE'; }
{Number}              { return 'NUMBER'; }
{String_value}        { return 'STRING_VALUE'; }
{Identifier}          { return 'IDENTIFIER'; }