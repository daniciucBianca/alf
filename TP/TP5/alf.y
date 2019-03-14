/* TODO 1 -- write the parser between start: and ; */
/* TODO 2 -- write the grammar for the mathematical expressions - it has to
             respect the correct order of the operations. Between strings only 
             + is accepted. */
/* TODO 3 --  modify your grammar in order to return the result or display 
              the variables */
/* TODO 4 --  add the paranthesis in your grammar */
/* TODO 5 --  display with console.log the errors for the user */
/* TODO 6 --  modify your grammar so it will accept multiple expressions
              separated by ; */
/* TODO 7 --  display with console.log the operations (see the example 
              on the site) */
%%

start:
    expr {
                $$ = $1;
                return $$;
             }; 
expr: 
    NUMBER  {
                console.log( $1 );
            }
;