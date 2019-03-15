"use strict";
 
// import the generated Parser
var parser = require ('./alf.js').parser;
 
// add a text to the parser
try
{
    // run the parser using a string
	parser.parse ('120');
}
catch (e)
{
        // display the error message and data
	console.log (e.message);
	console.log (e.hash);
}