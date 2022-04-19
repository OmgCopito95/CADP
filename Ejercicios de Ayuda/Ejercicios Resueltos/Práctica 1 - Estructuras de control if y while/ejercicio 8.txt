// EJERCICIO 8 PRACTICA 1

{
8.	Realizar un programa que lea tres caracteres, 
e informe si los tres eran letras vocales o si al menos uno de ellos no lo era.
}

program TresCaracteres;
var
   car1, car2, car3 : char;
   voc1, voc2, voc3 : boolean;
begin
  writeln('Ingrese los tres caracteres');
  readln(car1); readln(car2); readln(car3);

  voc1 := (car1 = 'a') or (car1 = 'e') or (car1 = 'i') or (car1 = 'o') or (car1 = 'u');
  voc2 := (car2 = 'a') or (car2 = 'e') or (car2 = 'i') or (car2 = 'o') or (car2 = 'u');
  voc3 := (car3 = 'a') or (car3 = 'e') or (car3 = 'i') or (car3 = 'o') or (car3 = 'u');

  if (voc1 and voc2 and voc3) then
       writeln('Los tres caracteres eran vocales')
  else
    writeln('Al menos un caracter no es vocal');
  readln;
end.  