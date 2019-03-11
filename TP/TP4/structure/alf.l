/* Declarations  */
WS            \s+
Operation     [*\-+^%/]
/* TODO 2 declare regex  for Digit, Letter, and Punctuation */


/* TODO 5 declare regex  for key words, function names, float numbers, variables, operators */
/* and add the rules for them in the next section*/





/* Set your rules */
%%

{Operation}+            {  return 'OPERATION';}
{WS}+                   { /*  whitespace */ }

{Digit}+                { return 'NUMBER'; }
TODO 2 - delete this line and add your rules for tokens WORD and PUNCTUATION



%%

