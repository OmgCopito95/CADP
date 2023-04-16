// EJERCICIO 1 PRACTICA 0

{
Implemente un programa que lea por teclado dos números enteros e imprima en pantalla
los valores leídos en orden inverso. Por ejemplo, si se ingresan los números 4 y 8, debe
mostrar el mensaje: Se ingresaron los valores 8 y 4
}

program invertirValores;
var
   valor1, valor2 : integer;
begin
     writeln('Ingrese el primer valor');
     readln(valor1);
     writeln('Ingrese el segundo valor');
     readln(valor2);
     writeln('Los valores ingresados e invertidos son: ',valor2, ' y ',valor1);
     readln;
end.                   