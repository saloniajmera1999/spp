%{
      	#include<stdlib.h>
    	#include<stdio.h>
%}

%token  NEWLINE A B

%%

start: expr NEWLINE { printf("Accepted");
                      exit(1);}
	;

expr:  A expr B B          
     |A B B
  ;
  
%%

int yyerror(char const *s)
{
    printf("Not accepted: Error  %s\n",s);
    return 1;
}
int main()
{
  yyparse();
  return 1;
}

