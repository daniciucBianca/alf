%left '+' '-'
// * and / have higher priority
%left '*' '/' 
 
%{
// function for grammar rule
function rule (rule_name, items)
{
  return {
    rule: rule_name,
    items: items
  };
}
 
// function for token
function token (token_name, value)
{
  return {
    token: token_name,
    value: value
  };
}
 
 
%}
 
%% 
 
start: expressions { 
				$$ = rule ('start', [$1]);
				return $$; 
				// AST
				// return {
				//    type: 'program',
				//    elements: $1
				// }
            };
 
expressions: statement NEWLINE expressions	{
											$$ = rule ('statement', [$1, token ('NEWLINE', $2), $3]);
											// AST 
											// $3.splice (0, 0, $1); // add the expression to the array produced by expressions ($3)
											// $$ = $3;
										}
			| statement NEWLINE		{
									$$ = rule ('statement', [$1, token ('NEWLINE', $2)]);
									// AST
									// $$ = [$1]; // an array with one element
								}
			| statement	{
						$$ = rule ('statement', [$1]);
						// AST
						// $$ = [$1]; // an array with one element
					};
 
statement:  expr  {
                    $$ = rule ('statement', [$1]);
                }
            | variable {
                        $$ = rule ('statement', [$1]);
                    }
            | assign {
                        $$ = rule ('statement', [$1]);
                    }
            | function {
            			$$ = rule ('function', [$1]);
            		}
			| function_run {
            			$$ = rule ('function_run', [$1]);
            		};
 
 
expr:	'LP' expr 'RP'	{
							$$ = rule ('expr', [token ('(', $1), $2, token (')', $3)]);
						}
	  | expr '+' expr	{ 
				$$ = rule ('expr', [$1, token ('+', $2), $3]);
			}
      | expr '-' expr 	{
    				$$ = rule ('expr', [$1, token ('-', $2), $3]);
      			}
      | expr '*' expr	{ 
    			$$ = rule ('expr', [$1, token ('*', $2), $3]);
			}
      | expr '/' expr 	{
    				$$ = rule ('expr', [$1, token ('/', $2), $3]);
      			}
      | NUMBER 	{ 
	  		// $1 is string so we store its float value
	  		$$ = token ('NUMBER', parseFloat ($1));
	  	}
	  | IDENTIFIER {
			// store the variable
	  		$$ = token ('IDENTIFIER', $1);
		}
	   | STRING_VALUE {
			// store the variable
			// get the value of the string without the quotes
	  		$$ = token ('STRING_VALUE', $1.substring (1, $1.length-2));
		};
 
variable:	VAR variables
			{
				$$ = rule ('variable', [token ('VAR', $1), $2]);
			};
 
variables:	IDENTIFIER ',' variables   
			{
				$$ = rule ('variables', 
				           [
				              token ('IDENTIFIER', $1), 
				              token (',', ','), 
				              $3
				           ]
				          );
 
			}
		| IDENTIFIER 
			{
				$$ = token ('IDENTIFIER', $1);
 
			}
		| IDENTIFIER OF type ',' variables   
			{
				$$ = rule ('variables', 
				           [
				              token ('IDENTIFIER', $1), 
				              token ('OF', 'of'),
				              $3,
				              token (',', ','), 
				              $5
				           ]
				          );
 
			}
		| IDENTIFIER OF type
			{
				$$ = rule ('variables', 
    			           [
    			              token ('IDENTIFIER', $1), 
    			              token ('OF', 'of'),
    			              $3
    			           ]
    			          );
 
			};
 
type:   INT 
            {
                $$ = token ('INT', 'int');
            }
        | FLOAT
            {
                $$ = token ('FLOAT', 'float');
            }
        | STRING
            {
                $$ = token ('STRING', 'string');
            };
 
assign: IDENTIFIER '=' expr
            {
                $$ = rule ('assign', 
				           [
				              token ('IDENTIFIER', $1), 
				              token ('=', '='), 
				              $3
				           ]
				          );
 
            };
 
 
 
function: FUNCTION IDENTIFIER 'LP' parameters 'RP' NEWLINE expressions END_FUNCTION {$$ = rule ('function', [token('FUNCTION', $1), token('IDENTIFIER', $2), token('(', $3), $4, token(')', $5), token('NEWLINE', $6), $7, token('END_FUNCTION', $8)]);};
 
parameters: IDENTIFIER OF type ',' parameters
				{
					$$ = rule ('parameters', [$1, token ('OF', 'of'), $3, token (',', $4), $5]);
				}
			| IDENTIFIER OF type
				{
					$$ = rule ('parameters', [$1, token ('OF', 'of'), $3]);
				}
			|	{
					$$ = token ('EMPTY', '');
				};
 
function_run: IDENTIFIER 'LP' parameters_run 'RP' { $$ = rule ('function_run', [token ('IDENTIFIER', $1), token ('(', $2), $3, token (')', $4)]);
						};
 
parameters_run: expr ',' parameters_run
				{
					$$ = rule ('parameters_run', [$1, token (',', $2), $3]);
				}
			| expr
				{
					$$ = rule ('parameters_run', [$1]);
				}
			|	{
					$$ = token ('EMPTY', '');
				};