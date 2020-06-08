package fuente;
import static fuente.Tokens.*;
%%
%class Reglas
%type Tokens
Lenguaje=[a-zA-Z_]+ 
Digitos=[0-9]+
espacios=[ ,\t,\r]+
%{
    public String reglas;
%}
%%

( byte | int | char | long | float | double ) {reglas=yytext(); return Tip_dato;} /* Tipos de datos */

( String ) {reglas=yytext(); return Cadena;} /* Tipo de dato String */

( if ) {reglas=yytext(); return If;} /* Palabra reservada If */

( else ) {reglas=yytext(); return Else;} /* Palabra reservada Else */

( do ) {reglas=yytext(); return Do;} /* Palabra reservada Do */

( while ) {reglas=yytext(); return While;} /* Palabra reservada While */

( for ) {reglas=yytext(); return For;} /* Palabra reservada For */

( "=" ) {reglas=yytext(); return Igual;} /* Operador Igual */

( "+" ) {reglas=yytext(); return Suma;} /* Operador Suma */

( "-" ) {reglas=yytext(); return Resta;} /* Operador Resta */

( "*" ) {reglas=yytext(); return Multiplicacion;} /* Operador Multiplicacion */

( "/" ) {reglas=yytext(); return Division;} /* Operador Division */

( "&&" | "||" | "!" | "&" | "|" ) {reglas=yytext(); return logico;} /* Operadores logicos */

( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {reglas = yytext(); return relacional;} /*Operadores Relacionales */

( "+=" | "-="  | "*=" | "/=" | "%=" ) {reglas = yytext(); return atribucion;} /* Operadores Atribucion */

( "++" | "--" ) {reglas = yytext(); return increment_decrement;} /* Operadores Incremento y decremento */

(true | false)      {reglas = yytext(); return booleano;} /*Operadores Booleanos*/

( "(" ) {reglas=yytext(); return Parent_a;} /* Parentesis de apertura */

( ")" ) {reglas=yytext(); return Parent_c;} /* Parentesis de cierre */

( "{" ) {reglas=yytext(); return Lla_a;} /* Llave de apertura */

( "}" ) {reglas=yytext(); return Lla_c;} /* Llave de cierre */

( "[" ) {reglas = yytext(); return Corch_a;} /* Corchete de apertura */

( "]" ) {reglas = yytext(); return Corch_c;} /* Corchete de cierre */

( "main" ) {reglas=yytext(); return Main;} /* Marcador de inicio de algoritmo */

( ";" ) {reglas=yytext(); return Punt_coma;} /* Punto y coma */

{espacios} {/*Ignore*/} /* Espacios en blanco */

( "//"(.)* ) {/*Ignore*/} /* Comentarios */

( "\n" ) {return Linea;} /* Salto de linea */

( "\"" ) {reglas=yytext(); return Comillas;} /* Comillas */

{Lenguaje}({Lenguaje}|{Digitos})* {reglas=yytext(); return Identificador;} /* Identificador */

("(-"{Digitos}+")")|{Digitos}+ {reglas=yytext(); return Numero;} /* Numero */

 . {return ERROR;}  /* Error de analisis */
