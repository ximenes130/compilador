# compilador N
Compilador da linguagem de programação que é escrita com números para a disciplina de compiladores do IFB campus Taguatinga

#### Arquivos importantes
- [CompiladorN.jar](/dist/CompiladorN.jar)
- [Gramatica.lex](src/br/com/compiladorn/analisadorsintatico/gramatica.lex)
- [sintaxe.cup](src/br/com/compiladorn/analisadorsintatico/sintaxe.cup)


#### Códigos

###### Lexemas
```jflex
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
```
----
###### sintaxe
```
package br.com.compiladorn.analisadorsintatico;
import java_cup.runtime.Symbol;
import java.util.List;
import java.util.ArrayList;

parser code {:

    public int linha;
    public int coluna;
    public String texto;
    public String token;
    private List<String> erros = new ArrayList<String>();
    private List<String> log = new ArrayList<String>();
    java_cup.runtime.Symbol symAtual;

    public List<String> getErros(){
        return erros;
    }

    public List<String> getLog(){
        return log;
    }

    @Override
    public void report_error(String message, Object info){
        erros.add("Erro("+erros.size()+") Warning - " + message + " - Token - " + Sym.terminalNames[((Symbol) info).sym]);
    }

    @Override
    public void report_fatal_error(String message, Object info)  {
        erros.add("Erro("+erros.size()+") Error - " + message + " - Token - " + Sym.terminalNames[((Symbol) info).sym]);
    }

:};

scan with {:
    symAtual = getScanner().next_token();

    log.add("Log("+log.size()
            +"): Token = "+ Sym.terminalNames[symAtual.sym]
            +" - Left = "+ symAtual.left
            +" - Right = "+ symAtual.right
            +" - Parse State"+ symAtual.parse_state
    );

    return getScanner().next_token();
:};

/* ------------------------ Definindo simbolos terminais ------------------------ */

terminal VARIAVEL, NUMEROS_NATURAIS, EXPOENTE, TEXTO, NUMEROS_REAIS, ELSE,
         L_PARENTESIS, R_PARENTESIS, L_CHAVE, R_CHAVE, ATRIBUICAO, IF, FOR, WHILE,
         FUNCAO_PARAMETRO, DECL_FUNCAO_PARAMETRO, OPERADOR_PROD, OPERADOR_DIV,
         OPERADOR_SOMA, OPERADOR_SUB, PVIRGULA, FUNCAO, OU, E, IGUAL, NAO_IGUAL,
         MENOR, MAIOR, MENOR_IGUAL, MAIOR_IGUAL, NAO;

/* ------------------------ Definindo simbolos não-terminais ------------------------ */

non terminal programa, expressoes, expressao, chamar_funcao, decl_funcao, funcao_parametros,
             decl_funcao_parametros, decl_condicional, condicional, decl_atribuicoes,
             decl_atribuicao, expressao_booleana, op_booleano, expressao_mat,
             decl_variavel, data_tipo, op_mat, decl_repeticao;

/* ------------------------ Definindo preferencia em caso de ambiguidade ------------------------ */

precedence left L_PARENTESIS, R_PARENTESIS,
                VARIAVEL, IF, FOR, WHILE, FUNCAO,
                EXPOENTE, OPERADOR_PROD, OPERADOR_DIV, OPERADOR_SOMA, OPERADOR_SUB,
                E, OU, IGUAL, NAO_IGUAL, MENOR, MAIOR, MENOR_IGUAL, MAIOR_IGUAL, NAO,
                NUMEROS_NATURAIS, TEXTO, NUMEROS_REAIS
                ;

/* ------------------------ Definindo a Gramática ------------------------ */

start with programa;

programa    ::= expressoes;

expressoes  ::=   expressao PVIRGULA expressoes
                | expressao PVIRGULA
                ;

expressao   ::=  L_PARENTESIS expressao R_PARENTESIS
                | decl_variavel
                | chamar_funcao
                | decl_funcao
                | decl_atribuicoes
                | decl_condicional
                | expressao_mat
                | decl_repeticao
                | data_tipo
                ;

chamar_funcao ::= FUNCAO L_PARENTESIS funcao_parametros R_PARENTESIS L_CHAVE expressoes R_CHAVE;

decl_funcao ::= FUNCAO L_PARENTESIS decl_funcao_parametros R_PARENTESIS L_CHAVE expressoes R_CHAVE;

decl_repeticao  ::= FOR L_PARENTESIS decl_variavel PVIRGULA expressao_booleana PVIRGULA expressao R_PARENTESIS L_CHAVE expressoes R_CHAVE
                    | WHILE L_PARENTESIS expressao_booleana R_PARENTESIS L_CHAVE expressoes R_CHAVE
                    ;

funcao_parametros ::= funcao_parametros FUNCAO_PARAMETRO
               | FUNCAO_PARAMETRO
               ;

decl_funcao_parametros ::= data_tipo DECL_FUNCAO_PARAMETRO PVIRGULA decl_funcao_parametros 
                    | data_tipo DECL_FUNCAO_PARAMETRO
                    ;

decl_condicional ::= decl_condicional condicional
                     | condicional
                     ;

condicional     ::= IF expressao_booleana L_CHAVE expressoes R_CHAVE
                    | IF expressao_booleana L_CHAVE expressoes R_CHAVE ELSE L_CHAVE expressoes R_CHAVE;

decl_atribuicoes ::= decl_atribuicoes decl_atribuicao
                     | decl_atribuicao
                     ;

decl_atribuicao ::= VARIAVEL ATRIBUICAO expressao;

expressao_booleana  ::= expressao_booleana op_booleano expressao_booleana
                        | L_PARENTESIS expressao_booleana R_PARENTESIS
                        | expressao op_booleano expressao
                        ;

op_booleano ::= OU
                | E
                | IGUAL
                | NAO_IGUAL
                | MENOR
                | MAIOR
                | MENOR_IGUAL
                | MAIOR_IGUAL
                | NAO expressao_booleana
                | NAO op_booleano
                ;

expressao_mat   ::= expressao op_mat expressao;

op_mat   ::= OPERADOR_SOMA
            | OPERADOR_SUB
            | OPERADOR_PROD
            | OPERADOR_DIV
            | EXPOENTE
            ;

decl_variavel   ::= VARIAVEL data_tipo PVIRGULA;

data_tipo   ::= NUMEROS_NATURAIS
                | TEXTO
                | NUMEROS_REAIS
                ;
```
