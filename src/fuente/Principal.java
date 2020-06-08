/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fuente;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;


/**
 *
 * @author Denis Bances
 */
public class Principal {
    public static void main(String[] args) throws Exception {
        String direccion1 = "D:\\Analizador\\src\\fuente\\Reglas.flex";
        String direccion2 = "D:\\Analizador\\src\\fuente\\ReglasCup.flex";
        String[] direccionS = {"-parser", "Sintaxis", "D:\\Analizador\\src\\fuente\\Sintaxis.cup"};
        hacersintac(direccion1, direccion2, direccionS);
    }
    
    public static void hacersintac(String direccion1, String direccion2, String[] direccionS) throws IOException, Exception{ 
        
    File doc;
    doc = new File(direccion1);
    JFlex.Main.generate(doc);
    doc = new File(direccion2);
    JFlex.Main.generate(doc);
    
    
    java_cup.Main.main(direccionS);
    
    Path direccionSym = Paths.get("D:\\Analizador\\src\\fuente\\sym.java");
        if (Files.exists(direccionSym)){
             Files.delete(direccionSym);
                   
        }
        
        Files.move(
            Paths.get("D:\\Analizador\\sym.java"),
            Paths.get("D:\\Analizador\\src\\fuente\\sym.java")
        );
        
        
        Path direccionSintac = Paths.get("D:\\Analizador\\src\\fuente\\Syntax.java");
            if (Files.exists(direccionSintac)){
                    Files.delete(direccionSintac);
            }
        
         Files.move(
                   Paths.get("D:\\Analizador\\Syntax.java"),
                   Paths.get("D:\\Analizador\\src\\fuente\\Syntax.java")
        ); 
    }
  
    
}
