//CECILIA

{Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
? Para cada empresa, el monto promedio de sus inversiones
? Código de la empresa con mayor monto total invertido
? Cantidad de empresas con inversiones de más de $50000}
{
program Hello;
var
    codigo, i, cantInversiones,codMax,cantEmpresas:integer;
    monto,montoTotal,montoPromedio,montoMax:real;
begin
    montoMax:=-1;
    cantEmpresas:=0;
    repeat  // CADA ITERACION ES UNA EMPRESA DISTINTA
        montoTotal:=0;
        writeln('Ingrese el código de la empresa:');
        readln(codigo);
        writeln('Ingrese la cantidad de inversiones:');
        readln(cantInversiones);

        for  i:=1 to cantInversiones do begin
            writeln('Ingrese el monto:');
            readln(monto);
            montoTotal:=montoTotal+monto;
        end;

        //CALCULA EL COD MAXIMO DE LA EMPRESA QUE MAS INVIRTIO
        if (montoTotal>montoMax) then begin
                montoMax:=montoTotal;
                codMax:=codigo;
        end;

        if (montoTotal>= 50000) then
            cantEmpresas:=cantEmpresas+1;

        montoPromedio:= montoTotal/cantInversiones;
        writeln('De la empresa se obtuvo el monto promedio:',montoPromedio:5:2);

    until (codigo= 100);
    //PROCESO TODAS LAS EMPRESAS

    writeln('Código de la empresa con mayor monto total invertido:',codMax, 'con monto invertido:',montoMax:6:2);
    writeln('Cantidad de empresas con inversiones de más de $50000:',cantEmpresas);

end.


 }




  {

        resultado:=0;
        READ(OPERADOR);
        if(operador = '+') or (operador='-')then
                read(num);
                while(num<>0)do begin
                    if(operador='+')then
                       resultado:=resultado+num;
                    else
                        resultado:=resultado-num;
                    read(num);
                    //ACA NO IMPRIMO EL RESULTADO
                end;
                // terminó la secuencia de numeros
                writeln('el resultado es:', resultado);
        else
           writeln('error');

      }




    {
                                                  10  5  15


          READ(NUMERO);
          WHILE(NUMERO<>0)DO BEGIN


            IF(NUMERO>MAX)THEN
                MAX:=NUMERO;
            READ(NUMERO)
            ...
          END;
          // TERMINO DE LEER TODOS LOS NUMEROS
          ...

          WRITELN('EL NUMERO MAS GRANDE ES', MAX);  15


  }






  {

     FUNCIONES -> function
          NO READ()
          NO WRITE()
          CANT VALORES QUE DEVUELVE: 1
          TIPOS DE DATOS QUE DEVUELVE: SIMPLE (NO STRING)


     PROCEDIMIENTOS ->  procedure
         READ()
         WRITE()
         CANT VALORES QUE DEVUELVE: 0,1, MAS
         TIPOS DE DATOS QUE DEVUELVE: CUALQUIERA


   }


  {

program alcance1;
var a,b: integer;

procedure uno;
var b: integer;
begin
b := 3;
writeln(b);
end;

begin
a:= 1;
b:= 2;
uno;
writeln(b,' ', a);

READLN()
end.
  }

   program project1;
function cuatro: integer;
begin
cuatro:= 4;
end;
var a: integer;
begin
cuatro;
writeln(a);
READLN();
end.

          {a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo.
Al finalizar la lectura el módulo debe imprimir en pantalla
cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a. }


program Practica2_ejer6_P1;


procedure parAlto;

var
    num:integer;
    max:integer;
begin
max:=-999;
writeln('ingrese un numero (para finalizar un n. negativo): ');
readln(num);
    while( num >= 0) do begin
      if(num mod 2 = 0) and (num > max) then begin
           max:=num;
       end;
      readln(num);
    end;
    //termino la secuencia de numeros
    writeln('el numero par mas grande es',max);
end;

var
begin
  parAlto;

end.



      writeln(suma/2);
               x    y z





