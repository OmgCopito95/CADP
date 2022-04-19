// EJERCICIO 3 PRACTICA 0

{
Implemente un programa que lea dos números reales e imprima el resultado de la división
de los mismos con una precisión de dos decimales. Por ejemplo, si se ingresan los valores
4,5 y 7,2 , debe imprimir: El resultado de dividir 4,5 por 7,2 es 0,62
}
program divisionDeValores;
var
   valor1, valor2: real;
begin
     // RECORDAR QUE SE INGRESAN CON PUNTO
     writeln('Ingrese el primer valor');
     readln(valor1);
     writeln('Ingrese el segundo valor');
     readln(valor2);
     writeln('La division de los dos valores es: ', (valor1/valor2):4:2);
     readln;
end.                         