Ws         \s+
Digit      [0-9]
/*TODO 1 -- declare regular expressions for Strings and real numbers */



/* set your rules */
/*TODO 2 -- set your rules for math expressions */
/*TODO 4 -- set rules for '(' -> LP(left paranthesis) and ')' -> RP(right paranthesis)*/
%%
"-"        { return '-'; }
"+"        { return '+'; }
{Ws}       { /* empty space */ }
{Digit}+   { return 'NUMBER'; }