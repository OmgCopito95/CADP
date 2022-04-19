// EJERCICIO 5 PRACTICA 1

{
Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 número reales. 
La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo número, 
en cuyo caso deberá informarse “No se ha ingresado el doble de X”.
}

program leerHastaElDobleContinuacion;
var
  numX, otroNumero : real;
  cantNumeros : integer;
begin
   writeln('Ingrese el valor de X');
   readln(numX);
   writeln('Ahora se leeran numeros hasta que ingrese el doble de ',numX:4:2);
   writeln('Ingrese un numero');
   readln(otroNumero);
   cantNumeros := 1;
   while ((2*numX <> otroNumero) and (cantNumeros < 10)) do
   begin
      writeln('Ingrese otro numero');
      readln(otroNumero);
      cantNumeros := cantNumeros + 1;
   end;
   if (otroNumero <> 2*numX) then
     writeln('No se ha ingresado el doble de ',numX:4:2);
   readln;
end.

         