/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.compiladorn;

import br.com.compiladorn.analisadorlexico.GeradorAnalisadorLexico;
import br.com.compiladorn.analisadorsintatico.GeradorParser;
import br.com.compiladorn.gui.MainGui;
import java.io.File;
import java.util.Arrays;

/**
 *
 * @author ximenes
 */
public class Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        System.out.println("\n\n------  Gerando Aanalisador Léxico   ------\n");
        GeradorAnalisadorLexico.gerar(new File("/home/ximenes130/Dev/compiladores/compilador/src/br/com/compiladorn/analisadorlexico/gramatica.lex"));

        System.out.println("\n\n------  Gerando Aanalisador Sintático   ------\n");
        try {
            GeradorParser.gerar(new File("/home/ximenes130/Dev/compiladores/compilador/src/br/com/compiladorn/analisadorsintatico/sintaxe.cup"));
        } catch (Exception ex) {
            System.out.println(Arrays.toString(ex.getStackTrace()));
        }
/*
        try {
            Parser p = new Parser(new AnalisadorLexico(new StringReader("01 20 02;")));
            
            Object result = p.parse().value;

            System.out.println("Compilacao concluida com sucesso..."+ result.toString());
        } catch (Exception e) {
            e.printStackTrace();
        }
*/
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainGui().setVisible(true);
            }
        });
    }

}
