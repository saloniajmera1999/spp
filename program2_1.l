%{
	#include<stdio.h>
	char ch;
%}

%%
[a-zA-Z] {
	ch=yytext[0];
	if(ch<=90)
	printf("%c",((ch - 'A' + 3 ) % 26 + 65));
	else
	printf("%c",((ch - 'a' + 3 ) % 26 + 97));
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
