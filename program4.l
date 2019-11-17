%{
	#include<stdio.h>
	int in=0;
	int flt=0;
	int kw=0;
	int idt=0;
	int sl=0;
	int ml=0;
	int oper=0;
%}

knostar [^*]*
pstar \*+
nostarfwdslash [^*/]

%%
\"([\\\"]|[^"])*\"  {;}
#.*    {;}
"/*"{knostar}{pstar}({nostarfwdslash}{knostar}{pstar})*"/"  {ml++; printf("\nMultiline comment: %s",yytext);}
(\/\/.*)  {sl++;printf("\nSingleline comment: %s",yytext);}
and|bool|break|case|catch|char|class|const|continue|do|double|else  {kw++; printf("\nKeyword: %s",yytext);}
false|float|for|if|int|long|namespace|new|not|operator|or|private|protected|public|return  {kw++; printf("\nKeyword: %s",yytext);}
sizeof|static|switch|this|throw|true|try|union|using|void|while   {kw++; printf("\nKeyword: %s",yytext);}
[a-zA-Z_][a-zA-Z_0-9]*  {idt++; printf("\nIdentifier: %s",yytext);}
"+"|"-"|"*"|"%"|"/"|"++"|"--"|"="|"=="|"<"|">"|"<="|">="|"+="|"<<"|">>"|"-="|"*="|"%="|"/="  {oper++; printf("\nOperator: %s", yytext);}
[-+]?[0-9]+  {in++; printf("\nInteger: %s", yytext);}
[-+]?[0-9]*\.[0-9]+ {flt++; printf("\nFloat: %s", yytext);}
. {;}
\n {;}
%%

int main()
{
	yyin=fopen("prog4.cpp", "r");
	yylex();
	printf("\n\nNumber of single line comments: %d", sl);
	printf("\nNumber of multiline comments: %d", ml);
	printf("\nNumber of keywords: %d", kw);
	printf("\nNumber of identifiers: %d", idt);
	printf("\nNumber of integers: %d", in);
	printf("\nNumber of floats: %d", flt);
	printf("\nNumber of operators: %d", oper);
	return 0;
}

int yywrap()
{
	return 1;
}


