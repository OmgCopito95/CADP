// EJERCICIO 4 PRACTICA 1

{
Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se ingrese uno 
cuyo valor sea exactamente el doble de X (el primer número leído)
}

program leerHastaElDoble;
var
  numX, otroNumero : real;
begin
   writeln('Ingrese el valor de X');
   readln(numX);
   writeln('Ahora se leeran numeros hasta que ingrese el doble de ',numX:4:2);
   writeln('Ingrese un numero');
   readln(otroNumero);
   while (2*numX <> otroNumero) do
   begin
      writeln('Ingrese otro numero');
      readln(otroNumero);
   end;
   readln;
end.
          