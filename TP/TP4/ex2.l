WS              \s+
Letter          [A-Za-z]
Punctuation     [\!\?\.,;:]
Float           [0-9]+(\.[0-9]+)
Digit           [0-9]+


%%

"INPUT"          {return 'INPUT'; }
"OUTPUT"         {return 'OUTPUT'; }

{Letter}+        { return 'WORD'; }
{WS}+            { /* whitespace separates tokens */ }
{Punctuation}+   { return 'PUNCTUATION'; }
{Float}+         { return 'FLOAT NUMBER'; }
{Digit}+         { return 'NUMBER'; }


%%
