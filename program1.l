%{
	#include<stdio.h>
	int num_chars=0;
	int num_lines=0;
	
%}

%%
\n {num_chars++; num_lines++;}
. {num_chars++;}
%%

int main()
{
	yyin=fopen("input.txt","r");
	yylex();
	printf("\nThere are %d number of lines and %d number of characters...", num_lines, num_chars);
	return 0;
}

int yywrap()
{
	return 1;
}
