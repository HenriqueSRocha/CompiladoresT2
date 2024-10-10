%{
#include <stdio.h>
#include "tokens.h"
#include "tabsimb.h"
int linha = 1;
%}
dig [0-9]
letra [a-zA-Z_]
nletra [^\"]
%%
"int"  	{return INT;}
"float"	{return FLOAT;}
"if"	{return IF;}	
">="  	{return GE;} 
"<="	{return LE;}
"=="	{return EQ;}
"for"	{return FOR;}
"while"	{return WHILE;}	
"&&"	{return AND;}	
"void"	{return VOID;}
"or"	{return OR;}	
"!"		{return '!';}	
"("	  	{return '(';}
")"   	{return ')';}
"{"	  	{return '{';}
"}"   	{return '}';}
";"   	{return ';';}
"="   	{return '=';}
","   	{return ',';}
"+"		{return '+';}
"-"		{return '-';}
"*"		{return '*';}
"/"		{return '/';}
">"		{return '>';}
"<"		{return '<';}
"else"	{return ELSE;}
"return" {return RETURN;}
"\""	{return ASPAS;}

{dig}+("."{dig}+)?	{return NUM;}
{letra}({letra}|{dig})*  { insere(yytext); return ID;}  
[ \t\r] {}
\"{nletra}+\"	{return STRING;}



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
