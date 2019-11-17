%{
      	#include<stdlib.h>
    	#include<stdio.h>
%}

%token  NEWLINE A B

%%

start: expr NEWLINE { printf("Accepted");
                      exit(1);}
	;

expr:  A A A A A A A A A X B          
  ;
X: A X
   |A 
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

