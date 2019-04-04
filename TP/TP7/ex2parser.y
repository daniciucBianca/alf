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
						return {
						type: 'program',
						elements: $1
					};
            	}
;
            
expressions
: expressions NEWLINE statement		{
										$1.push($3); // add the expression to the array produced by expressions ($1)
										$$ = $1;
									}
| statement							{
										$$ = [];
										$$.push($1); // an array with one element
									}
;
					
statement
: expr
| variable 			{
                        $$ = rule ('statement', [$1], yylineno);
                    }
| assign 			{
                        $$ = rule ('statement', [$1], yylineno);
                    }
| function 			{
            			$$ = rule ('function', [$1], yylineno);
            		}
| function_run 		{
            			$$ = rule ('function_run', [$1], yylineno);
            		}
;
            		 
expr
: '(' expr ')'		{
						$$ = {
							type: 'expr',
							value: $2
						};
					}
| expr '+' expr		{
						$$ = {
							type: 'expr',
							op: $2,
							left: $1,
							right: $3
						};
					}
| expr '-' expr 	{
						$$ = {
							type: 'expr',
							op: $2,
							left: $1,
							right: $3
						};
					}
| expr '*' expr		{
						$$ = {
							type: 'expr',
							op: $2,
							left: $1,
							right: $3
						};
					}
| expr '/' expr 	{
						$$ = {
							type: 'expr',
							op: $2,
							left: $1,
							right: $3
						};
					}
| NUMBER 			{
						$$ = {
								type: 'int',
								value: $1
						};
					}
| IDENTIFIER 		{
						$$ = {
							type: 'variable',
							value: $1
						};
					}
| STRING_VALUE 		{
						$$ = {
								type: 'string',
								value: $1
						};
					}
;
		
variable
: VAR variables 	{
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
| IDENTIFIER  						{
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
: FUNCTION IDENTIFIER '(' parameters ')' NEWLINE expressions END_FUNCTION 	{
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
																			};

parameters: IDENTIFIER OF type ',' parameters 	{
													$$ = rule ('parameters', [$1, token ('OF', 'of'), $3, token (',', $4), $5], yylineno);
												}
| IDENTIFIER OF type 							{
													$$ = rule ('parameters', [$1, token ('OF', 'of'), $3], yylineno);
												}
|												{
													$$ = token ('EMPTY', '');
												}
;

function_run
: IDENTIFIER '(' parameters_run ')' 			{
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
: expr ',' parameters_run 		{
									$$ = rule ('parameters_run', [$1, token (',', $2), $3], yylineno);
								}
| expr 							{
									$$ = rule ('parameters_run', [$1], yylineno);
								}
|								{
									$$ = token ('EMPTY', '');
								}
;