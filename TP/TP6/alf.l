Ws                      \s+
Identifier              [A-Za-z\$_][A-Za-z\$_0-9]*
 
%% 
"var" 		                            { return 'VAR'; }
","				                        { return ','; }
{Ws}                                    { /* skip whitespace */ }
{Identifier}		                    { return 'IDENTIFIER'; }