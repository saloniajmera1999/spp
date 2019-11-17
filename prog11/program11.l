%{
  #include "y.tab.h"
  #include<stdlib.h>
  #include<stdio.h>
%}

%%
[a] {
     	return A; 
    }
[b] {
     	return B; 
    }
[\n]  return NEWLINE;

%%

int yywrap()
	{
		return 1;
	}
	

