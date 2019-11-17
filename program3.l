%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	int count=0;
	char *str;

%}

%%

[a-zA-Z]+  {
	if( yyleng>count )
	{
		count=yyleng;
		if(str!=0)
			free(str);
		str=malloc(yyleng+1);
		strcpy(str,yytext);
	}
} 
[\n] {	
	printf("\nThe longest string of size %d is: %s\n", count, str);
	exit(0);
}
%%
int main()
{
	yylex();
	return 0;
}

int yywrap()
{
	return 1;
}
