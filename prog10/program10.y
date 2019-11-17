%{
      #include <stdio.h>
      #include<stdlib.h>
%}
%union {
			float f;
	   }
%token DIGIT NEWLINE
%type <f> DIGIT expr start
%left '+' '-'
%left '*' '/' '%'
%right UADD UMINUS

%%

start : expr NEWLINE  {
                        	printf("\nResult: %f", $$);
                        	exit(1);
                      };

expr:  expr '+' expr        { $$ = $1 + $3; }
  | expr '-' expr     { $$ = $1 - $3; }
  | expr '*' expr     { $$ = $1 * $3; }
  | expr '/' expr     { if($3==0.0)
  						{
  							yyerror("divide by zero\n");
  					    }
						$$ = $1 / $3; }
  | '(' expr ')'	  { $$ = $2; }
  | '-' expr   %prec UMINUS    { $$ = -$2; }
  | '+' expr   %prec UADD      { $$ = $2;  }
  | DIGIT   ;
  ;

%%

int yyerror(char const *s)
{
    printf(" Invalid Expression  %s\n",s);
    return 0;
}
int main()
{
  yyparse();
  return 1;
}
