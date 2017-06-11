/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.compiladorn.analisadorlexico;

/**
 *
 * @author ximenes
 */

public enum Token {
    ID("ID"),
    OPERADOR_SOMA("OPERADOR_SOMA"),
    OPERADOR_SUB("OPERADOR_SUB"),
    OPERADOR_PROD("OPERADOR_PROD"),
    OPERADOR_DIV("OPERADOR_DIV"),
    NUMEROS_NATURAIS("NUMEROS_NATURAIS"),
    TEXTO("TEXTO"),
    NUMEROS_REAIS("NUMEROS_REAIS"),
    OPERADOR_LOGICO("OPERADOR_LOGICO"),
    OPERADOR_RELACIONAL("OPERADOR_RELACIONAL"),
    L_PARENTESIS("L_PARENTESIS"),
    R_PARENTESIS("R_PARENTESIS"),
    L_CHAVE("L_CHAVE"),
    R_CHAVE("R_CHAVE"),
    ATRIBUICAO("ATRIBUICAO"),
    THEN("THEN"),
    IF("IF"),
    FOR("FOR"),
    WHILE("WHILE"),
    COMENTARIO("COMENTARIO"),
    LINHA("LINHA"),
    ERROR("ERROR"),
    FIM_COMANDO("FIM_COMANDO"),
    PVIRGULA("PVIRGULA"),
    BRANCO("BRANCO"),
    EXPOENTE("EXPOENTE"),
    FIM_LINHA("FIM_LINHA");
    
    private String name;

    private Token (String s){
        this.name = s;
    }

    public String getName(){
        return this.name;
    }
}
