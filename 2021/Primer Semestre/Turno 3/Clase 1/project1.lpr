{program Project1;

begin
end.


dolar: real;
montoTotal: real;
porcentaje: real;
resultado: real
begin
  read(dolar);
  read(montoTotal);
  read(porcentaje);

  resultado:= dolar*montoTotal*porcentaje;

  write('La transacción será de',resultado,'pesos argentinos ');

end.  }


{

var
  x: integer; //cant caramelos
  y: integer; // cant clientes
begin
  readln(x);
  readln(y);

  writeln('la cantidad de caramelos para cada cliente es:',x div y);
  writeln('el kiosquero se queda con', x mod y ,'caramelos');
end; }


 {
program ejemplo;
var
numA, numB : integer;
begin
    write('Ingrese el primer numero: ');
    read(numA);
    write('Ingrese el segundo numero: ');
    read(numB);

    if (numB > numA) then
       writeln ('El segundo numero es mas grande.')
    else
        if (numA > numB) then begin
           writeln('hola');
           writeln ('El primer numero es mas grande.')
        end
        else
            writeln ('Los numeros son iguales');
end.



writeln('introducir numero');
readln(num);

if (num<0) then
   writeln(num*-1:1:2)
else
   writeln(num:1:2);


 if(num>7)then begin
    writeln('hola');
    writeln('chau');
 end;  }




{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído)}


  for -> cant exacta de iteraciones.
  while -> no se cuantas veces se ejecuta. 0,1,muchas. NO DEBE PROCESARSE
  repeat until -> 1, muchas veces. DEBE PROCESARSE
  IF ELSE -> 0,1




 var
   x,num: real;

   cant: integer;
 begin
   readln(x); //no cambia su valor  5
   cant:=0; // cant es la cant de numeros que lei

   readln(num);
   cant:=cant+1;


   while(( num <> x*2 ) and (cant<=10)) do  begin
     cant:=cant+1;
     read(num)
   end;

   if(num=x*2)then
     writeln('se ingreso el doble de x')
   else
     writeln('no se ingreso el doble de x')




 end.






   var
     legajo,cantAlumnos,cantAlumnosMayoPromedio:integer;
     prom:real;
   begin
     cantAlumnos:=0;
     cantAlumnosMayoPromedio:=0;
     read(legajo);
     while(legajo <> -1) do begin
       read(prom);
       if(prom>=6.5)then
         cantAlumnosMayoPromedio:=cantAlumnosMayoPromedio+1;

       cantAlumnos:=cantAlumnos+1;
       //-----------------
       read(legajo);

     end;

     writeln('la cantidad de alumnos es:',cantAlumnos ); //a
     writeln('la cant de alumnos con prom mayor a 6.5 es',cantAlumnosMayoPromedio); //b

   end.



















