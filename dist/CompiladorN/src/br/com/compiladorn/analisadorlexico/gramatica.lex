
/* Definiçao da linguagem N - Uma linguagem de progamaçao escrita com numeros*/


package br.com.compiladorn.analisadorlexico;
import static br.com.compiladorn.analisadorlexico.Token.*;
%%

%{
public String lexeme;
%}


%class AnalisadorLexicon
%type Token

LINHA               =  \r|\n|\r\n
OPERADOR_ARITMETICO = 20|21|22|23       /* +,-,* e / */
ID                  = 1\d+
NUMEROS_NATURAIS    = 0\d+
TEXTO               = 7(\d{3})*7        /* cada 3 digitos representa um caracter */
NUMEROS_REIAS       = 0[0-9]+,[0-9]+
EXPOENTE            = 24                
OU                  = "||"
E                   = "&&"
IGUAL               = "40"
NAO_IGUAL           = "41"
MENOR               = "42"
MAIOR               = "43"
MAIOR_IGUAL         = "44"
MENOR_IGUAL         = "45"
NAO                 = "46"
INICIO_BLOCO        = "{"
FIM_BLOCO           = "}"
FIM_LINHA           = ";"
ATRIBUICAO	    = "="
BRANCO		    = [\s\t\f]

OPERADOR_RELACIONAL = {IGUAL}|{NAO_IGUAL}|{MENOR}|{MAIOR}|{MENOR_IGUAL}|{MAIOR_IGUAL}
OPERADOR_LOGICO     = {OU}|{E}|{NAO}

%%
"fim"			{ lexeme = yytext(); return FIM_COMANDO;}
"then"                  { lexeme = yytext(); return THEN; }
"if"                    { lexeme = yytext(); return IF; }
"for"                   { lexeme = yytext(); return FOR; }
"while"                 { lexeme = yytext(); return WHILE; }
{ID}                    { lexeme = yytext(); return ID; }
{OPERADOR_ARITMETICO}   { lexeme = yytext(); return OPERADOR_ARITMETICO; }
{NUMEROS_NATURAIS}      { lexeme = yytext(); return NUMEROS_NATURAIS; }
{TEXTO}                 { lexeme = yytext(); return TEXTO; }
{NUMEROS_REIAS}         { lexeme = yytext(); return NUMEROS_REIAS; }
{OPERADOR_LOGICO}       { lexeme = yytext(); return OPERADOR_LOGICO; }
{OPERADOR_RELACIONAL}   { lexeme = yytext(); return OPERADOR_RELACIONAL; }
{EXPOENTE}              { lexeme = yytext(); return EXPOENTE; }
{INICIO_BLOCO}          { lexeme = yytext(); return INICIO_BLOCO; }
{FIM_BLOCO}             { lexeme = yytext(); return FIM_BLOCO; }
{FIM_LINHA}		{ lexeme = yytext(); return FIM_LINHA;}
{ATRIBUICAO}		{ lexeme = yytext(); return ATRIBUICAO; }
{BRANCO}		{ lexeme = yytext(); return BRANCO;}
{LINHA}			{ lexeme = yytext(); return LINHA;}
(["$$"].*)		{ lexeme = yytext(); return COMENTARIO;}

.                       { lexeme = yytext(); return ERROR; }
