%left '+' '-'
// * and / have higher priority
%left '*' '/' 
 
%{
// function for grammar rule
function rule (rule_name, items, line)
{
  return {
    rule: rule_name,
    items: items,
	  line: line + 1
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
 
start
: expressions 	{ 
					$$ = rule ('start', [$1], yylineno);
					return $$;
				}
;
            
expressions
: statement NEWLINE expressions			{
											$$ = rule ('statement', [$1, token ('NEWLINE', $2), $3], yylineno);
										}
| statement NEWLINE						{
											$$ = rule ('statement', [$1, token ('NEWLINE', $2)], yylineno);
										}
| statement								{
											$$ = rule ('statement', [$1], yylineno);
										};
					
statement
: expr  		{
                    $$ = rule ('statement', [$1], yylineno);
                }
| variable 		{
					$$ = rule ('statement', [$1], yylineno);
				}
| assign 		{
					$$ = rule ('statement', [$1], yylineno);
				}
| function 		{
					$$ = rule ('function', [$1], yylineno);
				}
| function_run 	{
					$$ = rule ('function_run', [$1], yylineno);
				}
;
            		
 
expr
: '(' expr ')'			{
							$$ = rule ('expr', [token ('(', $1), $2, token (')', $3)], yylineno);
						}
| expr '+' expr			{ 
							$$ = rule ('expr', [$1, token ('+', $2), $3], yylineno);
						}
| expr '-' expr 		{
							$$ = rule ('expr', [$1, token ('-', $2), $3], yylineno);
						}
| expr '*' expr			{ 
							$$ = rule ('expr', [$1, token ('*', $2), $3], yylineno);
						}
| expr '/' expr 		{
							$$ = rule ('expr', [$1, token ('/', $2), $3], yylineno);
						}
| NUMBER 				{ 
							// $1 is string so we store its float value
							$$ = token ('NUMBER', parseFloat ($1));
						}
| IDENTIFIER 			{
							// store the variable
							$$ = token ('IDENTIFIER', $1);
						}
| STRING_VALUE 			{
							// store the variable
							// get the value of the string without the quotes
							$$ = token ('STRING_VALUE', $1.substring (1, $1.length-2));
						}
;
		
variable
: VAR variables 		{
							$$ = rule ('variable', [token ('VAR', $1), $2], yylineno);
						}
;
 
variables
: IDENTIFIER ',' variables 			{
										$$ = rule ('variables', 
												[
													token ('IDENTIFIER', $1), 
													token (',', ','), 
													$3
												],
												yylineno
												);
										
									}
| IDENTIFIER 						{
										$$ = token ('IDENTIFIER', $1);
										
									}
| IDENTIFIER OF type ',' variables 	{
										$$ = rule ('variables', 
												[
													token ('IDENTIFIER', $1), 
													token ('OF', 'of'),
													$3,
													token (',', ','), 
													$5
												],
												yylineno
												);
									}
| IDENTIFIER OF type 				{
										$$ = rule ('variables', 
												[
													token ('IDENTIFIER', $1), 
													token ('OF', 'of'),
													$3
												],
												yylineno
												);
										
									}
;
			
type
: INT 		{
				$$ = token ('INT', 'int');
			}
| FLOAT 	{
				$$ = token ('FLOAT', 'float');
			}
| STRING 	{
                $$ = token ('STRING', 'string');
            }
;
			
assign
: IDENTIFIER '=' expr 	{
							$$ = rule ('assign', 
									[
										token ('IDENTIFIER', $1), 
										token ('=', '='), 
										$3
									],
									yylineno
									);
							
						}
;

function
: FUNCTION IDENTIFIER 'LP' parameters 'RP' NEWLINE expressions END_FUNCTION 	{
																				$$ = rule ('function',
																							[
																								token ('FUNCTION', $1),
																								token ('IDENTIFIER', $2),
																								token ('(', $3),
																								$4,
																								token (')', $5),
																								token ('NEWLINE', $6),
																								$7,
																								token ('END_FUNCTION', $8)
																							],
																							yylineno
																						);
																				
																			}
;

parameters
: IDENTIFIER OF type ',' parameters	{
										$$ = rule ('parameters', [$1, token ('OF', 'of'), $3, token (',', $4), $5], yylineno);
									}
| IDENTIFIER OF type 				{
										$$ = rule ('parameters', [$1, token ('OF', 'of'), $3], yylineno);
									}
|									{
										$$ = token ('EMPTY', '');
									}
;

function_run
: IDENTIFIER 'LP' parameters_run 'RP' {
										$$ = rule ('function_run', [
																	token ('IDENTIFIER', $1),
																	token ('(', $2),
																	$3,
																	token (')', $4)
																	],
																	yylineno
													);
									}
;
												
parameters_run
: expr ',' parameters_run 			{
										$$ = rule ('parameters_run', [$1, token (',', $2), $3], yylineno);
									}
| expr 								{
										$$ = rule ('parameters_run', [$1], yylineno);
									}
|									{
										$$ = token ('EMPTY', '');
									}
;