%left '+' '-'
%left '*' '/'

/* Grammar part, for this lab */
 
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
 
start: statements
		{
			return $1;
		};
 
statements: statement ';' statements
            {
                $$ = rule ('statements', 
                        [
                            $1, 
                            token (';', ';'), 
                            $3
                        ]
                    );
            }
            | statement ';'
            {
                $$ = rule ('statements', [$1, token(';', ';')]);
            }
;

statement: variable
            {
                $$ = rule ('statement', [$1]);
            }
        | expr
            {
                $$ = rule ('statement', [$1]);
            }
        | attribution
            {
                $$ = rule ('statement', [$1]);
            }
        | functionRun
            {
                $$ = rule ('statement', [$1]);
            }
;

expr: expr '+' expr
        {
            $$ = rule ('expr', 
                        [
                            $1, 
                            token ('+', '+'), 
                            $3
                        ]
                    );
        }
    | expr '-' expr
        {
            $$ = rule ('expr', 
                        [
                            $1, 
                            token ('-', '-'), 
                            $3
                        ]
                    );
        }
    | expr '*' expr
        {
            $$ = rule ('expr', 
                        [
                            $1, 
                            token ('*', '*'), 
                            $3
                        ]
                    );
        }
    | expr '/' expr
        {
            $$ = rule ('expr', 
                        [
                            $1, 
                            token ('/', '/'), 
                            $3
                        ]
                    );
        }
    | value
;
 
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
			};

attribution: IDENTIFIER '=' expr
                {
                    $$ = rule ('attribution', 
				           [
				              token ('IDENTIFIER', $1), 
				              token ('=', '='), 
				              $3
				           ]
				          );
                };

value:  INTEGER {$$ = token ('INTEGER', $1);}
        | REAL  {$$ = token ('REAL', $1);}
        | IDENTIFIER  {$$ = token ('IDENTIFIER', $1);}
;

parameters: expr ',' parameters
            {
				$$ = rule ('parameters', 
				           [
				              $1, 
				              token (',', ','), 
				              $3
				           ]
				          );
			}
            | expr
            {
				$$ = $1;
			};

functionRun: IDENTIFIER 'LP' parameters 'RP'
                {
                    $$ = rule ('functionRun', 
				           [
				              token ('IDENTIFIER', $1), 
				              token ('(', 'LP'), 
				              $3,
                              token (')', 'RP')
				           ]
				          );
                };