%{
	#include<stdio.h>
	int idt=0;
%}

knostar [^*]*
pstar \*+
nostarfwdslash [^*/]

%%
\"([\\\"]|[^"])*\"  {;}
"/*"{knostar}{pstar}({nostarfwdslash}{knostar}{pstar})*"/"  {;}
(\/\/.*)  {;}
and|bool|break|case|catch|char|class|const  ;
continue|default|delete|do|double|else  ;
extern|false|float|for|if|int|long|new|not  ;
operator|or|private|protected|public|return|short  ;
sizeof|static|switch|this|throw|true|try  ;
union|unsigned|using|void|while   ;
include|iostream|namespace|std|cout|endl	;
[a-zA-Z_][a-zA-Z_0-9]*  {idt++; printf(yytext); printf("\n");}
. {;}
\n {;}
%%

int main()
{
	yyin=fopen("input.cpp", "r");
	yylex();
	printf("There are %d number of identifiers.", idt);
	return 0;
}

int yywrap()
{
	return 1;
}


