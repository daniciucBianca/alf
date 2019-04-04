%left '+' '-'
%left '*' '/' 
 
%{
// function for grammar rule
var variables = [];

function isDefined (variable) {
	if(variables.indexOf(variable) >= 0) {
		return true;
	}
	return false;
}

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
						elements: $1,
						line: yylineno + 1
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
| variable
| assign
| function
| function_run
;
            		
 
expr
: '(' expr ')'			{
							$$ = {
								type: 'expr',
								value: $2,
								line: yylineno + 1
							};
						}
| expr '+' expr			{
							$$ = {
								type: 'expr',
								op: $2,
								left: $1,
								right: $3,
								line: yylineno + 1
							};
						}
| expr '-' expr 		{
							$$ = {
								type: 'expr',
								op: $2,
								left: $1,
								right: $3,
								line: yylineno + 1
							};
						}
| expr '*' expr			{ 
							$$ = {
								type: 'expr',
								op: $2,
								left: $1,
								right: $3,
								line: yylineno + 1
							};
						}
| expr '/' expr 		{
							$$ = {
								type: 'expr',
								op: $2,
								left: $1,
								right: $3,
								line: yylineno + 1
							};
						}
| NUMBER 				{ 
							$$ = {
									type: 'int',
									value: $1,
									line: yylineno + 1
							};
						}
| IDENTIFIER 			{
							if(!isDefined($1)) {
								return 'ERROR at line ' + (yylineno + 1) + ': ' + $1 + ' is not defined';
							}

							$$ = {
								type: 'variable',
								value: $1,
								line: yylineno + 1
							};
						}
| STRING_VALUE 			{
							$$ = {
									type: 'string',
									value: $1,
									line: yylineno + 1
							};
						}
;
		
variable: VAR variables {
							$$ = {
								type: 'var',
								variables: $2,
								line: yylineno + 1
							};
						}
;
 
variables
: variables ',' IDENTIFIER			{
										variables.push($3);

										$1.push({
											id: $3,
											line: yylineno + 1
										});
										$$ = $1;
									}
| IDENTIFIER 						{
										variables.push($1);

										$$ = [];
										$$.push({
											id: $1,
											line: yylineno + 1
										})	
									}
| variables ',' IDENTIFIER OF type 	{
										variables.push($3);

										$1.push({
											id: $3,
											type: $5,
											line: yylineno + 1
										});
										$$ = $1;
									}
| IDENTIFIER OF type 				{
										variables.push($1);

										$$ = [];
										$$.push({
											id: $1,
											type: $3,
											line: yylineno + 1
										});	
									}
;
			
type
: INT 
| FLOAT
| STRING
;
			
assign
: IDENTIFIER '=' expr 	{
							if(!isDefined($1)) {
								return 'ERROR at line ' + (yylineno + 1) + ': ' + $1 + ' is not defined';
							}

							$$ = {
								type: 'assign',
								to: {
									id: $1,
									line: yylineno + 1
								},
								from: $3,
								line: yylineno + 1
							};
						}
;

function
: FUNCTION IDENTIFIER '(LP' parameters 'RP' NEWLINE expressions NEWLINE END_FUNCTION 	{
																						$$ = {
																							type: 'function_declaration',
																							id: $2,
																							parameters: $4,
																							expressions: $7,
																							line: yylineno + 1
																						};																			
																					}
;

parameters
: parameters ',' IDENTIFIER OF type 	{
											$1.push({
												id: $3,
												type: $5,
												line: yylineno + 1
											});
											$$ = $1;
										}
| IDENTIFIER OF type 					{
											$$ = [];
											$$.push({
												id: $1,
												type: $3,
												line: yylineno + 1
											});
										}
|										{
											$$ = [];
										}
;

function_run
: IDENTIFIER 'LP' parameters_run 'RP' 	{
											$$ = {
												type: 'function_run',
												id: $1,
												parameters: $3,
												line: yylineno + 1
											};
										}
;
												
parameters_run
: parameters_run ',' expr  				{
											$1.push($3);
											$$ = $1;
										}
| expr 									{
											$$ = [];
											$$.push($1);
										}
|										{
											$$ = [];
										}
;