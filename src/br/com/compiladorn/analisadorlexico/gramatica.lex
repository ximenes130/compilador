
/* Definiçao da linguagem N - Uma linguagem de progamaçao escrita com numeros*/


package br.com.compiladorn.analisadorlexico;
import static br.com.compiladorn.analisadorlexico.Token.*;
%%


%class AnalisadorLexico
%public
%line
%column
%function next           /* Renomeando funçao de busca */
%type LexemaPOJO         /* Definindo tipo de retorno da busca */
%cup                     /* Adicionando compatibilidade com CUP */

%{
    public Token yytoken;

    public LexemaPOJO getLexema(){
      LexemaPOJO lexema = new LexemaPOJO();
      
      lexema.setToken(this.yytoken);
      lexema.setText(this.yytext());
      lexema.setLinha(this.yyline);
      lexema.setColuna(this.yycolumn);
      
      return lexema;
  }
%}

LINHA               =  \r|\n|\r\n
OPERADOR_ARITMETICO = 20|21|22|23       /* representando +,-,* e / respectivamente */
ID                  = 1\d+
NUMEROS_NATURAIS    = 0\d+(E[+-]\d+)?
TEXTO               = 7(\d{3})*7        /* cada 3 digitos representa um caracter */
NUMEROS_REIAS       = 0[0-9]+,[0-9]+
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
INICIO_BLOCO        = "{"|"("
FIM_BLOCO           = "}"|")"
FIM_LINHA           = ";"
ATRIBUICAO	    = "="
FOR                 = "for"
IF                  = "if"
BRANCO		    = [\s\t\f]
COMENTARIO          = "/*"[^]*"*/"|"//".*

OPERADOR_RELACIONAL = {IGUAL}|{NAO_IGUAL}|{MENOR}|{MAIOR}|{MENOR_IGUAL}|{MAIOR_IGUAL}
OPERADOR_LOGICO     = {OU}|{E}|{NAO}

%%
"fim"			{yytoken = FIM_COMANDO;         return getLexema();}
"then"                  {yytoken = THEN;                return getLexema();}
"if"                    {yytoken = IF;                  return getLexema();}
"for"                   {yytoken = FOR;                 return getLexema();}
"while"                 {yytoken = WHILE;               return getLexema();}
{ID}                    {yytoken = ID;                  return getLexema();}
{OPERADOR_ARITMETICO}   {yytoken = OPERADOR_ARITMETICO; return getLexema();}
{NUMEROS_NATURAIS}      {yytoken = NUMEROS_NATURAIS;    return getLexema();}
{TEXTO}                 {yytoken = TEXTO;               return getLexema();}
{NUMEROS_REIAS}         {yytoken = NUMEROS_REIAS;       return getLexema();}
{OPERADOR_LOGICO}       {yytoken = OPERADOR_LOGICO;     return getLexema();}
{OPERADOR_RELACIONAL}   {yytoken = OPERADOR_RELACIONAL; return getLexema();}
{EXPOENTE}              {yytoken = EXPOENTE;            return getLexema();}
{INICIO_BLOCO}          {yytoken = INICIO_BLOCO;        return getLexema();}
{FIM_BLOCO}             {yytoken = FIM_BLOCO;           return getLexema();}
{FIM_LINHA}		{yytoken = FIM_LINHA;           return getLexema();}
{ATRIBUICAO}		{yytoken = ATRIBUICAO;          return getLexema();}
{BRANCO}		{yytoken = BRANCO;              return getLexema();}
{LINHA}			{yytoken = LINHA;               return getLexema();}
{COMENTARIO}		{yytoken = COMENTARIO;          return getLexema();}

[^]                     {yytoken = ERROR;               return getLexema();}
