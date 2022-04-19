{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”}


program ejercicio1;

var
   num1,num2: integer;
begin
   writeln('Ingrese un numero entero: ');
   readln(num1);
   writeln('Ingrese otro numero entero: ');
   readln(num2);

   if(num1 > num2)then
     writeln('El primer numero es el mayor')
   else
     if (num2 > num1)then
       writeln('El segundo numero es el mayor')
     else
       writeln('Los dos numeros son iguales');
   readln;
end.

