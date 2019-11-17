%{
      #include <stdio.h>
      #include<stdlib.h>
%}

%token DIGIT NEWLINE
%left '+' '-'
%left '*' '/' '%'

%%

start : expr NEWLINE  {
                        	printf("\nResult: %d", $$);
                        	exit(1);
                      };

expr:  expr '+' expr        { $$ = $1 + $3; }
  | expr '-' expr     { $$ = $1 - $3; }
  | expr '*' expr     { $$ = $1 * $3; }
  | expr '/' expr     { $$ = $1 / $3; }
  | expr '%' expr     { $$ = $1 % $3; }
  | '(' expr ')'	  { $$ = $2; }
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
