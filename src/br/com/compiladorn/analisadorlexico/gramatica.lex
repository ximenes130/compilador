
/* Definiçao da linguagem N - Uma linguagem de progamaçao escrita com numeros*/


package br.com.compiladorn.analisadorlexico;
import static br.com.compiladorn.analisadorlexico.Token.*;
%%


%class AnalisadorLexico
%public
%line
%column
%function next           /* Renomeando funçao de busca */
%cup

%{
    public Token yytoken;

    public LexemaPOJO getLexema(){
      LexemaPOJO lexema = new LexemaPOJO();
      
      lexema.setToken(this.yytoken);
      lexema.setText(this.yytext());
      lexema.setCaracter(this.yychar);
      lexema.setLinha(this.yyline);
      lexema.setColuna(this.yycolumn);
      
      return lexema;
    }

    public Simbol getSymbol(){
        return new Symbol(yytoken.ordinal());
    }   
%}

LINHA               =  \r|\n|\r\n
OPERADOR_SOMA       = 20
OPERADOR_SUB        = 21
OPERADOR_PROD       = 22
OPERADOR_DIV        = 23
VARIAVEL                  = 1\d+
NUMEROS_NATURAIS    = 0\d+(E[+-]\d+)?
TEXTO               = 7(\d{3})*7        /* cada 3 digitos representa um caracter */
NUMEROS_REAIS       = 0[0-9]+,[0-9]+
EXPOENTE            = 24                
OU                  = "||"
E                   = "&&"
IGUAL               = 40
NAO_IGUAL           = 41
MENOR               = 42
MAIOR               = 43
MAIOR_IGUAL         = 44
MENOR_IGUAL         = 45
NAO                 = 46
L_PARENTESIS        = "("
R_PARENTESIS        = ")"
L_CHAVE             = "{"
R_CHAVE             = "}"
FIM_LINHA           = ";"
ATRIBUICAO	    = "="
FOR                 = "for"
IF                  = "if"
PVIRGULA            = ";"
BRANCO		    = [\s\t\f]
COMENTARIO          = "/*"[^]*"*/"|"//".*

OPERADOR_RELACIONAL = {IGUAL}|{NAO_IGUAL}|{MENOR}|{MAIOR}|{MENOR_IGUAL}|{MAIOR_IGUAL}
OPERADOR_LOGICO     = {OU}|{E}|{NAO}

%%
"fim"			{yytoken = FIM_COMANDO;         return getSymbol();}
"then"                  {yytoken = THEN;                return getSymbol();}
{IF}                    {yytoken = IF;                  return getSymbol();}
{FOR}                   {yytoken = FOR;                 return getSymbol();}
"while"                 {yytoken = WHILE;               return getSymbol();}
{VARIAVEL}              {yytoken = VARIAVEL;            return getSymbol();}
{OPERADOR_SOMA}         {yytoken = OPERADOR_SOMA;       return getSymbol();}
{OPERADOR_SUB}          {yytoken = OPERADOR_SUB;        return getSymbol();}
{OPERADOR_PROD}         {yytoken = OPERADOR_PROD;       return getSymbol();}
{OPERADOR_DIV}          {yytoken = OPERADOR_DIV;        return getSymbol();}
{NUMEROS_NATURAIS}      {yytoken = NUMEROS_NATURAIS;    return getSymbol();}
{TEXTO}                 {yytoken = TEXTO;               return getSymbol();}
{NUMEROS_REAIS}         {yytoken = NUMEROS_REAIS;       return getSymbol();}
{OPERADOR_LOGICO}       {yytoken = OPERADOR_LOGICO;     return getSymbol();}
{OPERADOR_RELACIONAL}   {yytoken = OPERADOR_RELACIONAL; return getSymbol();}
{EXPOENTE}              {yytoken = EXPOENTE;            return getSymbol();}
{L_PARENTESIS}          {yytoken = L_PARENTESIS;        return getSymbol();}
{R_PARENTESIS}          {yytoken = R_PARENTESIS;        return getSymbol();}
{L_CHAVE}               {yytoken = L_CHAVE;             return getSymbol();}
{R_CHAVE}               {yytoken = R_CHAVE;             return getSymbol();}
{FIM_LINHA}		{yytoken = FIM_LINHA;           return getSymbol();}
{ATRIBUICAO}		{yytoken = ATRIBUICAO;          return getSymbol();}
{PVIRGULA}		{yytoken = PVIRGULA;            return getSymbol();}
{BRANCO}		{yytoken = BRANCO;              return getSymbol();}
{LINHA}			{yytoken = LINHA;               return getSymbol();}
{COMENTARIO}		{yytoken = COMENTARIO;          return getSymbol();}

[^]                     {yytoken = ERROR;               return getSymbol();}
