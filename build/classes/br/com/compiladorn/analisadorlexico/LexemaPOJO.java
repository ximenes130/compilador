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
public class LexemaPOJO {
    private int token;
    private String text;
    private int linha;
    private int coluna;
    private int caracter;

    public LexemaPOJO() {
    }

    public int getCaracter() {
        return caracter;
    }

    public void setCaracter(int caracter) {
        this.caracter = caracter;
    }

    public int getToken() {
        return token;
    }

    public void setToken(int token) {
        this.token = token;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public int getLinha() {
        return linha;
    }

    public void setLinha(int linha) {
        this.linha = linha;
    }

    public int getColuna() {
        return coluna;
    }

    public void setColuna(int coluna) {
        this.coluna = coluna;
    }
    
    
}
