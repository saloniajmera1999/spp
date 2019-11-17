%{
  #include "y.tab.h"
  #include<stdlib.h>
  #include<stdio.h>
%}

%%
[0-9]+  {
     		return DIGIT; 
        }
"+"  return *yytext;
"-"  return *yytext;
"*"  return *yytext;
"%"  return *yytext;
"/"  return *yytext;
"("  return *yytext;
")"  return *yytext;
[\n]  return NEWLINE;

%%

int yywrap()
	{
		return 1;
	}
	

