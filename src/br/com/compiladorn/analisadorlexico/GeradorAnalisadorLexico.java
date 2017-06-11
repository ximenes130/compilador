/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.compiladorn.analisadorlexico;

import java.io.File;

public class GeradorAnalisadorLexico {

    public static void gerar(File file) {

        jflex.Main.generate(file);

    }
}
