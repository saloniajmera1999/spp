%{
      	#include<stdlib.h>
    	#include<stdio.h>
%}

%token  NEWLINE VAR

%left '-' '+'  
%left '*' '/' '%' 

%%

start: expr NEWLINE { printf("Valid Expression");
                      exit(1);}
	;

expr:  expr '+' expr    
  | expr '-' expr     
  | expr '*' expr    
  | expr '/'expr   
  | expr '%'expr      
  | '(' expr ')'        
  |'-'expr             
  | VAR           
  ;

%%

int yyerror(char const *s)
{
    printf("yyerror  %s\n",s);
    return 1;
}
int main()
{
  yyparse();
  return 1;
}

