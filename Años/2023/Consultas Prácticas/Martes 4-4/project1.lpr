// PRACTICA 0

program project1;
var
    num: integer;
    precio: real;
begin
       precio:=100;


end.

read() --> leer desde consola
write('hola',3+5) --> para mostrar en pantalla


MOD  --> DEVUELVE EL RESTO DE UNA DIVISION
DIV  --> COCIENTE

// -----------------------------------------------

// PRACTICA 1

// ESTRUCTURAS DE CONTROL

// IF
- se ejecuta 0,1
- se ejecuta cuando la condicion es VERDADERA
- else 0,1 -> cuando la condicion del if es falsa

if (num > 10) then begin
   num:=num+1;
   if(num=5)then
     write('el num es 5');
end
else begin
    ....
end;

num:=0;
if (num>10) then  begin
   write('hola');
   if (edad=5) then
      read
end;

// WHILE

mientras.. ()
cuantas veces se ejecuta? -> 0,1, muchas veces
se ejecuta hasta que la condicion sea false
no se procesa el corte

num:=0;
while(num<10)do begin
   num:=num+1;
   read();
end;
write(num); --> 10
read

//---------------------------------------

// REPEAT UNTIL(num=10)
se ejecuta 1, o muchas
se ejecuta hasta que la condicion sea verdadera
se procesa el corte de control

repeat
 ....
...
until (num=10)

//---------------------------------------

// FOR
SE UTILIZA CUANDO SE EXACTAMENTE LA CANTIDAD DE VECES QUE TENGO QUE EJECUTAR ALGO

for hola:=1 to 500 do begin
   read(dato);
   write(hola)
   ...
   ...
   ...
end;

for i:=500 downto 1

 dobleX:=5;
 read(r); 1
 while (r <> dobleX) do begin
    write('Ingrese otro numero real: ');
 end;
 ...
...

// ----------------------------------------------------------



{ Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era.
Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.
}


program ejercicio8Part1;
var
   condicion1,condicion2,condicion3:boolean; //GUARDA VERDADERO O FALSO
   car1,car2,car3: char;


begin

   read(car1); //lee un caracter
   read(car2);
   read(car3);
                                              V
   if ((car1 = 'a') or (car1 = 'e')or (car1 = 'i')or (car1 = 'o')or (car1 = 'u'))then begin
     writeln('el caracter 1 es una vocal');
     if(car2)
       if(car3)
          los 3 son vocales
       else
           no es vocal
     else
         no es vocal
   else
       no es vocal
   end;
   ...
   ...
   read(car);                                             v     F
   condicion1:=((car = 'a') or (car = 'e')or (car = 'i')or (car = 'o')or (car = 'u'));
   read(car);
   condicion2:=((car2 = 'a') or (car2 = 'e')or (car2 = 'i')or (car2 = 'o')or (car2 = 'u'));
   read(car);
   condicion3:=((car3 = 'a') or (car3 = 'e')or (car3 = 'i')or (car3 = 'o')or (car3 = 'u'));

   IF(condicion1=true and condicion2=true and condicion3=true)then
      writeln('todos los caracteres son vocales');
   else
     writeln('al menos uno no era una vocal');

end.


for i:=1 to 3 do then
    read(car);
    if ((car = 'a') or (car = 'e')or (car = 'i')or (car = 'o')or (car = 'u'))

end;

//-----------------------------------------------------------


{
Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.
}


program ejercicio 5;
var
    num:integer;
    max: integer;
begin
   // CALCULAR UN MAXIMO
   max:=-999;  //1 -> variable con numero muy pequeño
   min:=999;  //1 -> variable con numero muy grande
   repeat
     read(num);

     if(num > max)then //2 comparar num con el maximo
       max:=num;  // 3 actualizo el maximo

     if(num < min)then //2
       min:=num;


   until (num=100); //leo hasta que se ingresa el 100

   ...
   ...
   write('el numero mas grande es', max);
   write('el numero mas chico es', min);

end;


  suma:=0;
  cant5:=0;
  for i:=1 to 10 begin                           3+5+6 ... = X
     read(num);
     suma:=suma+num;
     if(num>5)then
        cant5:=cant5+1;
  end;

  writeln('la suma es:',suma);
  writeln('la cant de numeros mayores a 5 es:',cant5);










