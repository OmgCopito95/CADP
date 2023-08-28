{program Project1;

var
  i, numero, pos :integer;
  max: integer;      //primer paso
begin
    max:=-999; //segundo paso

    for(i:=1 to 10)do begin
      read(numero);
      if(numero > max)then begin   //tercer paso
        max:=numero; //cuarto paso
        pos:=i;
      end;
    end;
    writeln('el numero maximo es:',max, 'y esta en la pos:', pos);
end.
 }


 {5- Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}


program project1;
type
    c30=string[150];
var
  numero, max, min, suma: integer;

  s: c30;
  nombre: c30;
begin
  max:= -999; //muy chico
  min:= 999;  // muy grande

  suma:=0; //variable contadora

  repeat
     read(numero);

     suma:=suma+numero;     //suma todos los numeros leidos

     if(numero > max)then   //CALCULO DEL MAXIMO
       max:=numero;

     if(numero < min)then   //CALCULO DEL MINIMO
       min:=numero;

  until (numero = 100);

  writeln('maximo: ', max);
  writeln('minimo: ', min);
  writeln('suma: ', suma);

end;










{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota }



program ej3;

type
   c30 = string[30]
   subrango = 1..10;

var
  //nombre: string; //la long max de nombre es 255 caracteres
  nombre: c30;  //la long max de nombre es 30

  nota: subrango;
  cant,aprob:integer;
begin
     cant:=0;
     aprob:=0;

     repeat //repetir
        read(nombre);
        read(nota);

        if(nota >= 8)then
          cant:=cant+1;
        else
          if(nota=7)then
            aprob:=aprob+1;

     until(nombre = 'Zidane Zinedine'); //hasta que se cumpla la condicion

     //informar

end;






{7-Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.  }



program eje7;
type
   c30 = String[30];

var
  tiempo: real;
  nombre: c30;
  i: integer;
  min1,min2: real; //1
  max1,max2: real;
  nombreMin1, nombreMin2: c30;
  nombreMax1, nombreMax2: c30;
begin
     min1 := 999;
     min2 := 999;  //2

     nombreMin1:='';
     nombreMin2:='';

     max1 := -999;
     max2 := -999;

     nombreMax1:='';
     nombreMax2:='';

     for(i:=1 to 100)do begin
       read(nombre);
       read(tiempo);

       //CALCULA LOS DOS MINIMOS    -> los que terminaron en los primeros 2 puestos
       if(tiempo < min1)then begin
         min2:=min1;                 //4
         min1:=tiempo; //tiempo que leo

         nombreMin2:=nombreMin1;
         nombreMin1:=nombre //nombre que leo
       end
       else
          if(tiempo < min2)then begin
            min2:=tiempo;
            nombreMin2:=nombre;
          end;
      // --------------------------------------------- //

      //CALCULA LOS DOS MAXIMOS  -> los que terminaron en los ultimos 2 puestos
       if(tiempo > max1)then begin
         max2:=max1;                 //4
         max1:=tiempo; //tiempo que leo

         nombreMax2:=nombreMax1;
         nombreMax1:=nombre //nombre que leo
       end
       else
          if(tiempo > max2)then begin
            max2:=tiempo;
            nombreMax2:=nombre;
          end;

     end; //end del for

     writeln ('Los dos pilotos que finalizaron en los dos primeros puestos:', nombreMin1, 'y', nombreMin2);
     writeln ('Los dos pilotos que finalizaron en los dos últimos puestos: ', nombreMax1, 'y ',nombreMax2);
end;









    cuando me doy cuenta de inicializar las variables adentro o afuera




{Realizar un programa que analice las inversiones de las empresas más grandes del país.
Para cada empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones.
La lectura finaliza al ingresar la empresa con código 100, que debe procesarse.  }
//informar el monto maximo de cada empresa

    repeat     //cada iteracion es una empresa
       max := 999;

       read(codigo);
       read(cantInversiones);

       for(i:=1 to cantInversiones)do begin
         read(monto);

         if(monto > max)then
           max:=monto;

       end;

       writeln('monto max:', max);

    until (codigo=100);





























