/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.compiladorn.analisadorsintatico;

import java.io.File;
import java.io.IOException;

/**
 *
 * @author ximenes130
 */
public class GeradorParser {
    public static void gerar(File file) throws IOException, Exception {
        String arguments[] = {
            "-parser",
            "Parser",
            "-symbols",
            "Sym",
            "-expect",
            "2",
            "-destdir",
            file.getParent(),
            file.getCanonicalPath()
        };
        
        java_cup.Main.main(arguments);
    }
}
