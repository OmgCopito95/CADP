{program Project1;
type
  sst=String[5];

  var s:sst;
begin
  readln(s);
  writeln(s);
  readln;
  readln;
end.
 }


{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}
program Hello;
type
    rango=1..200;
var
    i,cantidad16: integer;
    codigo, codbarato1, codbarato2: rango;
    precio,min1,min2: real;
begin
    min1:=999;
    min2:=999;
    cantidad16:=0;
    for i:=1 to 6 do begin// use 6 para probar
        writeln ('CÓDIGO:');
        readln(codigo);
        writeln ('PRECIO:');
        readln(precio);
        if (precio < min1) then begin
            min2:=min1;
            codbarato2:=codbarato1;
            min1:=precio;
            codbarato1:=codigo;
        end
        else if (precio < min2) then begin
            min2:=precio;
            codbarato2:=codigo;
        end;
        if ((precio > 16) and ((codigo mod 2) = 0)) then
            cantidad16:=cantidad16 + 1;
    end;
    writeln ('Los códigos de los dos productos más baratos: ', codbarato1, 'y ', codbarato2);
    writeln ('La cantidad de productos de más de 16 pesos con código par es: ',cantidad16);
end.





         //CALCULAR MINIMO

         //primer paso: declarar una variable
         min: integer;

         //segundo paso: inicializar variable (numero muy grande)
         min:=999;

         read(numero);
         while(numero<>0)do begin

           //tercer paso: comparar
           if(numero < min)then
               //cuarto paso: actualizar minimo
               min:=numero;

           read(numero);
         end;




          //CALCULAR MAXIMO

         //primer paso: declarar una variable
         max: integer;

         //segundo paso: inicializar variable (numero muy chico)
         max:=-999;

         read(numero);
         while(numero<>0)do begin

           //tercer paso: comparar
           if(numero > max)then
               //cuarto paso: actualizar maximo
               max:=numero;

           read(numero);

         end;



         //CALCULAR DOS MINIMOS

         //primer paso: declarar dos variable
         min1: integer;
         min2: integer;

         //segundo paso: inicializar variable (numero muy grande)
         min1:=999;
         min2:=999;

         read(numero);
         while(numero<>0)do begin

           //tercer paso: comparar con el min1
           if(numero < min1)then begin
               //cuarto paso: actualizar los minimos
               min2:=min1;
               min1:=numero;
           end
           else
              if(numero < min2)then
                  min2:=numero

           read(numero);
         end;



   {Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}
program Hello;
type
    rango=1..200;
var
    i,cantidad16: integer;
    codigo, codbarato1, codbarato2: rango;
    precio,min1,min2: real;
begin
    min1:=999;
    min2:=999;
    cantidad16:=0;
    for i:=1 to 200 do begin// use 6 para probar
        writeln ('CÓDIGO:');
        readln(codigo);
        writeln ('PRECIO:');
        readln(precio);

        if ((precio > 16) and ((codigo mod 2) = 0)) then
            cantidad16:=cantidad16 + 1;

        if (precio < min1) then begin
            min2:=min1;
            codbarato2:=codbarato1;
            min1:=precio;
            codbarato1:=codigo;
        end
        else
          if (precio < min2) then begin
            min2:=precio;
            codbarato2:=codigo;
          end;


    end;
    writeln ('Los códigos de los dos productos más baratos: ', codbarato1, 'y ', codbarato2);
    writeln ('La cantidad de productos de más de 16 pesos con código par es: ',cantidad16);
end.






    {


       suma:=0;
       cant:=0;
       for i:=1 to 10 do begin
          read(numero);
          suma:= suma+numero;
          if(numero > 5)then
              cant:=cant+1;
       end;
       writeln(suma);
       writeln(cant);

     }



     {Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”

A)_ Modifique el programa anterior para que,
además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia,
en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}
    {
program Practica_1_2_P2;

var
  i,x:integer;
  max:integer;
  pos:integer;
begin
  max:=-9999;
  pos:=0;
  writeln(' ingrese 10 numeros: ');
  for  i:=1 to 10 do begin
    read(x);
     if (max<x) then begin
        max:=x;
        pos:=i;
     end;
  end;
  writeln( ' el mayor numero leido es: ',max, ' en la posocion: ',pos);
  readln;
  readln;
end.

      }


{Realizar un programa que lea desde teclado la información de alumnos ingresantes
a la carrera
Analista en TIC. De cada alumno se lee NOMBRE
y NOTA obtenida en el módulo EPA(la nota es un número entre 1 y 10).
La lectura finaliza cuando se lee el nombre “Zidane Zinedine“,QUE DEBE PROCESARCE
Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota}


program Practica_1_3_P2;

type
  cad30=string[30];
 var
   nombre:cad30;
   nota:1..10;
   cont,mayor:integer;
begin
   mayor:=0;
   cont:=0;
   repeat
     write(' Nombre del ingresante:  ');
     readln(nombre);
      write(' Nota del ingresante en EPA:  ');
     readln(nota);
     writeln;

     if (nota>=8) then
       mayor:=mayor+1
     else
       if(nota=7) then
         cont:=cont+1;

     until (nombre= 'zinade zinedine');

      writeln( ' cantidad de alumnos aprobados (nota 8 o mayor): ',mayor);
      writeln( ' cantidad de alumnos que obtuvieron un 7 como nota: ',cont);
      readln;
end.










