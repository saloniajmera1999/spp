%{
      	#include<stdlib.h>
    	#include<stdio.h>
%}

%token  NEWLINE DIGIT

%left '-' '+'  
%left '*' '/' '%' 

%%

start: expr NEWLINE { printf("Valid Arithmetic Expression");
                      exit(1);}
	;

expr:  expr '+' expr    
  | expr '-' expr     
  | expr '*' expr    
  | expr '/' expr   
  | expr '%' expr      
  | '(' expr ')'        
  | '-' expr    
  | '+' expr         
  | DIGIT           
  ;

%%

int yyerror(char const *s)
{
    printf("yyerror  %s\n",s);
    return 1;
}
int main()
{
  printf("Enter the expression: \n");
  yyparse();
  return 1;
}

