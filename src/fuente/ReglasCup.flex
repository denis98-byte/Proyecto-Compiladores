package fuente;
import java_cup.runtime.Symbol;
%%
%class ReglasCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
Lenguaje=[a-zA-Z_]+ 
Digitos=[0-9]+
espacios=[ ,\t,\r\n]+
%{
    private Symbol symbol (int tipo, Object value)
    {
        
        return new Symbol(tipo, yyline, yycolumn, value);
    }

     private Symbol symbol (int tipo)
    {
        
        return new Symbol(tipo, yyline, yycolumn);
    }

%}
%%

( byte | int | char | long | float | double ) {return new Symbol(sym.Tip_dato, yychar, yyline, yytext());}/* Tipos de datos */

( byte ) {return new Symbol(sym.Byte, yychar, yyline, yytext());}
( int ) {return new Symbol(sym.Int, yychar, yyline, yytext());}
( char ) {return new Symbol(sym.Char, yychar, yyline, yytext());}
( long ) {return new Symbol(sym.Long, yychar, yyline, yytext());}
( float ) {return new Symbol(sym.Float, yychar, yyline, yytext());}
( double ) {return new Symbol(sym.Double, yychar, yyline, yytext());}

( String ) {return new Symbol(sym.string, yychar, yyline, yytext());} /* Tipo de dato String */

( if ) {return new Symbol(sym.If, yychar, yyline, yytext());} /* Palabra reservada If */

( else ) {return new Symbol(sym.Else, yychar, yyline, yytext());} /* Palabra reservada Else */

( do ) {return new Symbol(sym.Do, yychar, yyline, yytext());} /* Palabra reservada Do */

( while ) {return new Symbol(sym.While, yychar, yyline, yytext());} /* Palabra reservada While */

( for ) {return new Symbol(sym.For, yychar, yyline, yytext());} /* Palabra reservada For */

( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());} /* Operador Igual */

( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());} /* Operador Suma */

( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());} /* Operador Resta */

( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());} /* Operador Multiplicacion */

( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());} /* Operador Division */

( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Logico, yychar, yyline, yytext());} /* Operadores logicos */

( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Relacional, yychar, yyline, yytext());} /*Operadores Relacionales */

( "+=" | "-="  | "*=" | "/=" | "%=" ) {return new Symbol(sym.Atribucion, yychar, yyline, yytext());} /* Operadores Atribucion */

( "++" | "--" ) {return new Symbol(sym.Increment_decrement, yychar, yyline, yytext());} /* Operadores Incremento y decremento */

(true | false)  {return new Symbol(sym.Booleano, yychar, yyline, yytext());} /*Operadores Booleanos*/

( "(" ) {return new Symbol(sym.Parent_a, yychar, yyline, yytext());} /* Parentesis de apertura */

( ")" ) {return new Symbol(sym.Parent_c, yychar, yyline, yytext());} /* Parentesis de cierre */

( "{" ) {return new Symbol(sym.Lla_a, yychar, yyline, yytext());} /* Llave de apertura */

 ( "}" ) {return new Symbol(sym.Lla_c, yychar, yyline, yytext());} /* Llave de cierre */ 

( "[" ) {return new Symbol(sym.Corch_a, yychar, yyline, yytext());}/* Corchete de apertura */

( "]" ) {return new Symbol(sym.Corch_c, yychar, yyline, yytext());}/* Corchete de cierre */

( "main" ) {return new Symbol(sym.Main, yychar, yyline, yytext());} /* Marcador de inicio de algoritmo */

( ";" ) {return new Symbol(sym.Punt_coma, yychar, yyline, yytext());} /* Punto y coma */

{espacios} {/*Ignore*/} /* Espacios en blanco */

( "//"(.)* ) {/*Ignore*/} /* Comentarios */


( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());} /* Comillas */

{Lenguaje}({Lenguaje}|{Digitos})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());} /* Identificador */

("(-"{Digitos}+")")|{Digitos}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());} /* Numero */

 . {return new Symbol(sym.Error, yychar, yyline, yytext());} /* Error de analisis */
