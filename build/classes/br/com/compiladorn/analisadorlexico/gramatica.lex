
/* Definiçao da linguagem N - Uma linguagem de progamaçao escrita com numeros*/


package br.com.compiladorn.analisadorlexico;
import java_cup.runtime.Symbol;
import br.com.compiladorn.analisadorsintatico.Sym;
import static br.com.compiladorn.analisadorsintatico.Sym.*;
import java_cup.sym;
%%


%cup
%class AnalisadorLexico
%public
%line
%column

%eofval{
    yysym = EOF;        
    return getSymbol();
%eofval}

%{
    public int yysym;
    public String error = "";


    public LexemaPOJO getLexema(){
      LexemaPOJO lexema = new LexemaPOJO();
      
      lexema.setToken(this.yysym);
      lexema.setText(this.yytext());
      lexema.setCaracter(this.yychar);
      lexema.setLinha(this.yyline);
      lexema.setColuna(this.yycolumn);
      
      return lexema;
    }

    public Symbol getSymbol(){
        return new Symbol(yysym);
    }  

    public void printError(){
        LexemaPOJO p = getLexema();
        String s = "Erro léxico encontrado:"
                    + "    Texto = "      +   p.getText()
                    + "  | Linha = "      +   p.getLinha()
                    + "  | Coluna = "     +   p.getColuna()
                    + "\n"
                    ;

        error = error.concat(s);
        System.out.println(s);
   } 
%}

OPERADOR_SOMA       = 20
OPERADOR_SUB        = 21
OPERADOR_PROD       = 22
OPERADOR_DIV        = 23
VARIAVEL            = 1\d+
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
ATRIBUICAO	    = "="
FOR                 = "for"
IF                  = "if"
PVIRGULA            = ";"
BRANCO		    = [\s\t\f]
COMENTARIO          = "/*"[^]*"*/"|"//".*

%%
{IF}                    {yysym = IF;                  return getSymbol();}
{FOR}                   {yysym = FOR;                 return getSymbol();}
"while"                 {yysym = WHILE;               return getSymbol();}
{VARIAVEL}              {yysym = VARIAVEL;            return getSymbol();}
{OPERADOR_SOMA}         {yysym = OPERADOR_SOMA;       return getSymbol();}
{OPERADOR_SUB}          {yysym = OPERADOR_SUB;        return getSymbol();}
{OPERADOR_PROD}         {yysym = OPERADOR_PROD;       return getSymbol();}
{OPERADOR_DIV}          {yysym = OPERADOR_DIV;        return getSymbol();}
{NUMEROS_NATURAIS}      {yysym = NUMEROS_NATURAIS;    return getSymbol();}
{TEXTO}                 {yysym = TEXTO;               return getSymbol();}
{NUMEROS_REAIS}         {yysym = NUMEROS_REAIS;       return getSymbol();}
{EXPOENTE}              {yysym = EXPOENTE;            return getSymbol();}
{OU}                    {yysym = OU;                  return getSymbol();}
{E}                     {yysym = E;                   return getSymbol();}
{IGUAL}                 {yysym = IGUAL;               return getSymbol();}
{NAO_IGUAL}             {yysym = NAO_IGUAL;           return getSymbol();}
{MENOR}                 {yysym = MENOR;               return getSymbol();}
{MAIOR}                 {yysym = MAIOR;               return getSymbol();}
{MAIOR_IGUAL}           {yysym = MAIOR_IGUAL;         return getSymbol();}
{MENOR_IGUAL}           {yysym = MENOR_IGUAL;         return getSymbol();}
{NAO}                   {yysym = NAO;                 return getSymbol();}
{L_PARENTESIS}          {yysym = L_PARENTESIS;        return getSymbol();}
{R_PARENTESIS}          {yysym = R_PARENTESIS;        return getSymbol();}
{L_CHAVE}               {yysym = L_CHAVE;             return getSymbol();}
{R_CHAVE}               {yysym = R_CHAVE;             return getSymbol();}
{ATRIBUICAO}		{yysym = ATRIBUICAO;          return getSymbol();}
{PVIRGULA}		{yysym = PVIRGULA;            return getSymbol();}
{BRANCO}		{}
{COMENTARIO}		{}

[^]                     {printError();}
