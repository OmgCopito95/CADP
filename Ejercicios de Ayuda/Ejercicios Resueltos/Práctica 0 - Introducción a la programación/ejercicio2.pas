// EJERCICIO 2 PRACTICA 0

{
Modifique el programa anterior para que el mensaje de salida muestre la suma de ambos
números:
a. Utilizando una variable adicional
b. Sin utilizar una variable adicional
}
program invertirValores;
var
   valor1, valor2, suma : integer;
begin
     writeln('Ingrese el primer valor');
     readln(valor1);
     writeln('Ingrese el segundo valor');
     readln(valor2);
     writeln('Los valores ingresados e invertidos son: ',valor2, ' y ',valor1);
     writeln('La suma de los dos numeros es: ', valor2 + valor1); // INCISO A
     suma := valor2 + valor1;
     writeln('La suma de los dos numeros es: ', suma); // INCISO B
     readln;
end.                   