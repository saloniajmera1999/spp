%{
	#include<stdio.h>
	int num_words=0;
	int num_chars=0;
	int num_space=0;
	int num_lines=0;
	
%}

%%
[ \t]  {num_chars++; num_space++;}
[\n]  {num_chars++; num_lines++;}
[a-zA-Z]+  {num_words++; num_chars+=yyleng;}
. {num_chars++;}
%%

int main()
{
	yyin=fopen("input.txt", "r");
	yylex();
	printf("\nCharacters: %d\nWords: %d\nSpaces: %d\nLines: %d\n", num_chars, num_words, num_space, num_lines);
	return 0;
}

int yywrap()
{
	return 1;
}
