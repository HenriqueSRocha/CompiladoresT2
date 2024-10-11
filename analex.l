%{
#include <stdio.h>
#include "tokens.h"
#include "tabsimb.h"
int linha = 1;
%}
digt [1-9]
dig [0-9]
letra [a-zA-Z_]
nstring [^\"] 
%%
"int"  	 {return INT;}
"float"	 {return FLOAT;}
"char"	 {return CHAR;}
"if"	 {return IF;}	
">="  	 {return GE;} 
"<="	 {return LE;}
"=="	 {return EQ;}
"for"	 {return FOR;}
"while"	 {return WHILE;}	
"&&"	 {return AND;}	
"void"	 {return VOID;}
"||"	 {return OR;}	
"else"	 {return ELSE;}
"return" {return RETURN;}
"\""	 {return ASPAS;}
"!"		 {return '!';}	
"("	  	 {return '(';}
")"   	 {return ')';}
"{"	  	 {return '{';}
"}"   	 {return '}';}
";"   	 {return ';';}
"="   	 {return '=';}
","   	 {return ',';}
"+"		 {return '+';}
"-"		 {return '-';}
"*"		 {return '*';}
"/"		 {return '/';}
">"		 {return '>';}
"<"		 {return '<';}

{dig}+("."{dig}+)?	{return NUM;}
{letra}({letra}|{dig})*  { insere(yytext); return ID;}  
[ \t\r] {}
\"{nstring}+\"	{return STRING;}



\n	{ linha++; }
.	{printf("erro lexico na linha %d - %s\n",
             linha, yytext); }
%%
#ifndef yywrap
int yywrap() { return 1; }
#endif
void main(int argc, char **argv) {
int token,i=1;	
	yyin = fopen(argv[1],"r");
	token = yylex();
	while(token) {
		printf("%d) %d %s\n", i++, token, yytext);
		token = yylex();
	}
	imprime();
}
