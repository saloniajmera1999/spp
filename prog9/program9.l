%{
  #include "y.tab.h"
  #include<stdlib.h>
  #include<stdio.h>
%}

%%
[a-z][0-9]+   {
     			  		return VAR; 
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
	

