"use strict";
 
// import the generated Parser
var Parser = require ('./alf.js').Parser;
 
// use the lexer from the generated Parser
var lexer = new Parser ().lexer;
 
// add a text to the lexer
//TODO 3 - set the input : 'Hello, the ALF TP is from 12 PM to 2 PM.'
lexer.setInput ('alf example');

//TODO 4 - read from text_and_numbers.txt into a variable and set
// the new input using setInput()

//TODO 6 - read the program.php file into a variable and set the new input
 
var s = null;
 
var tokens = [];
 
// repeat while you get an EOF token
do 
{
    try
    {
        // get the next token
        s = lexer.next ();
    }
    catch (e)
    {
        // if there is an error
        // print the line number (lexer.yylineno+1)
        // print the error position (lexer.showPosition ())
        console.log ('Error line '+(lexer.yylineno+1)+'\n'+lexer.showPosition());
        process.exit (-1);
    }
    if (s && s!== lexer.EOF)
    {
        // print the token (s)
        // print the token text (lexer.yytext)
        console.log (s+' '+lexer.yytext);
        // add them to an array
        //TODO 6 - add a new property (line) to the object with the value lexer.yylineno
        tokens.push ({type: s, value: lexer.yytext});
    }
} while (s !== lexer.EOF); 
 
console.log (tokens);

//TODO 7 -  write 'tokens' array into a file as a json (JSON.stringify)
