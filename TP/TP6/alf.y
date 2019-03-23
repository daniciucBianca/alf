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
 
start: variable 
		{
			return $1;
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
			};
