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
    ID,OPERADOR_ARITMETICO,NUMEROS_NATURAIS,TEXTO,NUMEROS_REIAS,OPERADOR_LOGICO, 
    OPERADOR_RELACIONAL,INICIO_BLOCO,FIM_BLOCO,ATRIBUICAO,THEN,IF,FOR,WHILE, 
    COMENTARIO,LINHA,ERROR,FIM_COMANDO,BRANCO,EXPOENTE,FIM_LINHA
}
