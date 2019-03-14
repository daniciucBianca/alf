WS              \s+
Float_number    [0-9]+(\.[0-9]+)
Digit           [0-9]+
Function_name   [a-zA-Z_][a-zA-Z0-9_]*
Identifier      \$[a-zA-Z]+


%%

"for"            {return 'FOR';}
"if"             {return 'IF';}
"else"           {return 'ELSE';}
"while"          {return 'WHILE';}
"function"       {return 'FUNCTION';}
"("              {return 'LP'; }
")"              {return 'RP'; }
"{"              {return 'LB'; }
"}"              {return 'RB'; }
","              {return ','; }
";"              {return ';'; }
"+"              {return '+'; }
"-"              {return '-'; }
"*"              {return '*'; }
"/"              {return '/'; }
"%"              {return '%'; }
"="              {return '='; }

{WS}+            { /* whitespace separates tokens */ }
{Float_number}+  { return 'REAL_NUMBER'; }
{Digit}+         { return 'INTEGER_NUMBER'; }
{Function_name}  { return 'FUNCTION_NAME'; }
{Identifier}     { return 'IDENTIFIER'; }

%%