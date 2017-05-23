/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.compiladorn;

import br.com.compiladorn.analisadorlexico.GeradorAnalisadorLexico;
import br.com.compiladorn.gui.AnalisadorLexicoGui;
import java.io.File;

/**
 *
 * @author ximenes
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        //GeradorAnalisadorLexico.gerar(new File("/home/ximenes/Dev/compiladores/compilador/src/br/com/compiladorn/analisadorlexico/gramatica.lex"));
        
        javax.swing.SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new AnalisadorLexicoGui().setVisible(true);
            }
        });
    }
    
}
