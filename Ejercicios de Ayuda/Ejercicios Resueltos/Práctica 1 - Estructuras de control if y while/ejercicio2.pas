// EJERCICIO 2 PRACTICA 1

{
Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un número X, 
se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero

}

program valorAbsolutoEjercicio;
var
  numero, valorAbsoluto : integer;
begin
  writeln('Ingrese un numero: ');
  readln(numero);
  if (numero >= 0) then
     valorAbsoluto := numero
  else
    valorAbsoluto := numero * (-1);
  writeln('El valor absoluto de ',numero,' es: ',valorAbsoluto);
  readln;
end.  