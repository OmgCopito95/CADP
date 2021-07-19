program project1;
var
	num,cant,total,i:integer;

	//"cant" es la cantidad de numeros mayores a 5, total es la suma de los numeros ingresados.

begin
	total:=0;
	cant:=0; // inciso (A)
	for i:=1 to 10 do begin
		readln(num);
		total:=total+num;
                if (num > 5) then // inciso (A)
		  cant:=cant+1;
	end;
        //TERMINO LA LECTURA
	writeln('la suma total de numeros leidos es de: ',total);
	writeln('la cantidad de numeros leidos mayores a 5 es de: ',cant);
end.














program divisiones;
var
  num: integer;
  suma: real;
begin
  readln(num);
  suma := 0;
  while (num <> 0) do
    begin
        if ((num mod 2) = 0) then
             suma:= suma + (num MOD 10)
        else
            suma:= suma + 1;
        num:= num DIV 10;
    end;
  writeln(suma:1:2);
end.


PROCESAR UN NUMERO Y SUS DIGITOS
numero 12345
 el digito de mas atras -> dig:=numero mod 10 -> 5
 achicar el numero -> numero:= numero div 10  -> 1234








program ej1;
var
	num,max,i,cant,pos:integer;


begin
	max:=-999;
	for i:=1 to 10 do begin
		readln(num);
                pos:=i;

                //calcula el maximo
		if (num > max) then begin
		   max:=num;
		end;
	end;
	writeln('el maximo numero ingresado es: ',max);
	writeln('la posicion del maximo numero ingresado es: ',pos);
end.



      //PASO 1 DECLARO VARIABLE
       max:integer;

       //PASO 2 INICIALIZAR VARIABLE
       max := -999;

       //PASO 3 COMPARAR

       if(numero > max)then

          //PASO 4 ACTUALIZAR MAXIMO
          max:=numero








program ej1;
var
	notaEpa,cantProm,cant7:integer;
        nota: 1..10;
	alumno:string[30]; 255 caracteres


	//cantProm = alumnos que sacaron 8 o +, cant7 = alumnos que sacaron 7


begin
	cantProm:=0;
	cant7:=0;
	repeat
		readln(alumno);
		readln(notaEpa);

		if (notaEpa >= 8) then
		  cantProm:= cantProm+1
                else
		    if (notaEpa = 7) then
		       cant7:= cant7+1;

	until alumno = 'zidane zinedine';

	writeln('la cantidad de alumnos que aprobo con 8 o mas es de: ',cantProm);
	writeln('la cantidad de alumnos que aprobo con 7: ',cant7);

end.






  numero = -1   debe procesarse

  suma:=0;
  read(numero)   -1
  while(numero<>-1)do
    suma:=suma+numero;
    read(numero)



          repeat
                read(numero)
                suma:=suma+numero;
          until (numero=-1)





 gianluca
program Ejercicio4;
var
i,numero,min1,min2:integer;
begin
  min1:=9999;
  min2:=9999;

  for i:= 1 to 1000 do begin
    writeln('Introducir numero');
    readln(numero);  10

    //CODIGO PARA CALCULAR DOS MINIMOS
    if (numero <= min1) then begin
      min2:=min1;
      min1:=numero;
    end
    else begin
      if (numero<=min2) then
        min2:=numero;
    end

  end;

  writeln('El número más chico es ',min1); 10
  writeln('El segundo número más chicos es ',min2);  9999
end.



 FEDE
program ejercio 4 practica 1 parte 2;
const
cant=1000;
var
min1,min2:integer;
i,num:integer;
begin
min1:=9999;
min2:=9999;
For i := 1 to cant do
        begin
                readln (num);               //num  16
                 if (num < min1) then        //min1 14
                    begin                    //min2 16
                        min2:=min1;
                        min1:=num;
                    end
                else
                    if (num < min2) then
                        min2:=num;
        end;
writeln ('los dos numeros minimos leidos son ' ,min1, min2);
end.


   program ejercicio 3 practica 1 parte 2;
type
notas=1..10;
cadena= string [25];
var
nombre:cadena;
nota:notas;
nota8, nota7:integer;
begin
nota8:=0;
nota7:=0;
repeat
        writeln ('ingrese nombre del alumno');
        readln(nombre);
        writeln ('ingrese la nota');
        readln (nota);
        if (nota >= 8) then
            nota8:=nota8 + 1;
        else
            if (nota = 7) then
              nota7:= nota7 + 1 ;
until (nombre = 'zidane zinedine');
writeln ('la cantidad de alumnos aprobados con 8 o mas, es ', nota8);
writeln ('la cantiad de alumnos con nota 7 es ', nota7);
end.















     FEDE
  program ejercio5practica1parte2;
var
min1,max1:integer;
suma,num:integer;
begin
suma:=0;
min1:=9999;
max1:= -9999;
repeat
       readln (num);
       suma:=suma + num;    5+9+2+3=

       if (num > max1) then     //CALCULO MINIMO
          max1:=num;

       if (num < min1) then      //CALCULO MAXIMO
            min1:=num;

until (num=100);
//DEJA DE PROCESAR

writeln ('el numero max leido es ' ,max1 ,' y el numero minimo leido es ', min1);
writeln ('la suma total de numeros es ', suma);
end.


SERGIO
  program ej1;
var
	num,i,min,max,total:integer;
begin
	min:=9999;
	max:=-9999;
	total:=0;
	for i:=1 to 10 do begin     //REPEAT UNTIL
		readln(num);
		total:=total+num;
			if (num < min) then
				min:=num;
			if (num > max) then
				max:=num;
	end;

	writeln('el mayor numero ingresado es: ',max);
	writeln('el menor numero ingresado es: ',min);
	writeln('la suma total de numeros ingresados es de: ',total);

end.



  de Marcello Gianluca a Todos los participantes:
program Ejercicio8;
type //tipos de datos declarados por el usuario
   mes= 1..8000;
var
dia:mes;
a: mes;
b: mes;
cant:integer;
monto,total:real;
begin
  total:=0;
  for dia:= 1 to 31 do begin
    cant:=0;
    Writeln('Escriba los montos del dia ',dia,': ');
    readln(monto);
    while (monto<>0) do begin
      cant:=cant+1;
      total:=total+monto;
      Writeln('Escriba los montos del dia ',dia,': ');
      readln(monto);
    end;
    writeln('la cantidad de ventas en el dia ',dia,' es ',cant,' ventas');
  end;
  writeln('el monto total acumulado en ventas de todo el mes ',total);
end.











 {Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program ejer6;
Type
  cod= 1 .. 200;

Var
  codigo, cod_min1,cod_min2: cod;
  precio,precio_min1,precio_min2: real;
  cant_16,indice: integer;

Begin
  precio_min1:= 1000;
  precio_min2:= 1000;
  cant_16:= 0;

  FOR indice:= 1 to 200 do begin
     writeln ('Ingrese un codigo');
     readln( codigo);
     writeln('Ingrese un precio');
     readln(precio);

     IF (precio < precio_min1) then begin
        precio_min2:= precio_min1;
        precio_min1:= precio;

        cod_min2:=cod_min1;
        cod_min1:= codigo;
     end
     ELSE
       IF (precio < precio_min2) then begin
         precio_min2:= precio;
         cod_min2:= codigo;
     end;

     IF (precio > 16) AND ((codigo MOD 2)=0) then
        cant_16:= cant_16 + 1;
   end;

   writeln('El CODIGO del producto MAS BARATO es: ',cod_min1,' y del SEGUNDO MAS BARATO es: ',cod_min2);
   writeln('La cantidad de productos de mas de 16 pesos con codigo par es: ',cant_16);
   readln();

End.





    program ej1;
var
	i,codigo,cod1,cod2,cant:integer;precio,min1,min2:real;
begin
	min1:=9999;
	min2:=9999;
	cod1:=-1;
	cod2:=-1;
	cant:=0;
	for i:=1 to 200 do
		codigo:=i;
		writeln('ingrese el precio del producto ',i);
		readln(precio);
		if (precio<min1) then begin
			min2:=min1;
			min1:=precio;
			cod2:=cod1;
			cod1:=codigo;
		end
		else begin
			if (precio<min2) then begin
				min2:=precio;
				cod2:=codigo;
			end;
		if ((precio>16) and ((codigo MOD 2) = 0)) then
			cant:=cant+1;
	end;

	writeln('el codigo del producto con menor precio es: ',cod1);
	writeln('el codigo del producto con el segundo menor precio es ',cod2);
	writeln('la cantidad de productos cuyo codigo es par y su precio mayor a 16 es: ',cant);

end.



  program Hello;
type
codigos=1 .. 200;
var
codigo:codigos;
i,minimo,minimo2,p16:integer;
precio,precio_minimo,precio_minimo2:real;
begin
  minimo:=9999;
  minimo2:=9999;
  precio_minimo2:=9999;
  precio_minimo:=9999;
  p16:=0;
  for i:= 1 to 200 do begin
    writeln('Introducir el codigo del producto');
    readln(codigo);
    writeln('Introducir el precio del producto');
    readln(precio);
    if (codigo mod 2=0) and (precio>16) then
    p16:=p16+1;

    if (precio<precio_minimo) then begin
      minimo2:=minimo;
      precio_minimo2:= precio_minimo;
      minimo:=codigo;
      precio_minimo:=precio;
    end
    else begin
      if (precio<precio_minimo2) then begin
        minimo2:=codigo;
        precio_minimo2:=precio;
      end
    end;
  end;
  writeln('El codigo del primer producto más barato ',minimo);
  writeln('El codigo del segundo producto más barato ',minimo2);
  writeln('La cantidad de productos de más de 16 pesos son ',p16);
end.




   {Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program ejer7;
Type
  nombrepilot= string[30];

Var
  nombre,nombre1,nombre2,nombre3,nombre4: nombrepilot;
  tiempo,tiempo1,tiempo2,tiempo3,tiempo4,indice: integer;

Begin
   tiempo1:= 1000;
   tiempo2:= 1000;
   tiempo3:= -1;
   tiempo4:= -1;
   FOR indice:= 1 to 100 do begin
      writeln ('Ingrese el nombre del piloto: ');
      readln(nombre);
      writeln('Ingrese el tiempo que tardo en finalizar: ');
      readln(tiempo);

      //CALCULA DOS MINIMOS
      IF (tiempo < tiempo1) then begin
         tiempo2:= tiempo1;
         tiempo1:= tiempo;
         nombre2:=nombre1;
         nombre1:= nombre;
      end
      ELSE
        If (tiempo < tiempo2) then begin
           tiempo2:= tiempo;
           nombre2:= nombre;
        end;
      //----------------------------------------------
     IF (tiempo > tiempo4)then begin
        tiempo3:= tiempo4;
        tiempo4:= tiempo;
        nombre4:=nombre3;
        nombre3:= nombre;
        end
     ELSE
       If (tiempo > tiempo3) then begin
          tiempo4:= tiempo;
          nombre4:= nombre;
        end;

     writeln('                          ');
  end;

   writeln('El PRIMER puesto es para: ',nombre1,' El SEGUNDO puesto es para: ',nombre2);
   writeln('El ANTEULTIMO puesto es para: ',nombre3,' Y el ULTIMO puesto es para: ',nombre4);
   readln();

End.


    program ej1;
var
	i:integer;nombre,Nmin1,Nmin2,Nmax1,Nmax2:string[20];
        tiempo,max1,max2,min1,min2:real;
begin
	max1:=0;
	max2:=0;
	min1:=9999;
	min2:=9999;
	Nmax1:='';
	Nmax2:='';
	Nmin1:='';
	Nmin2:='';
	for i:=1 to 100 do begin
		writeln('ingrese el nombre del piloto');
		readln(nombre);
		writeln('ingrese el tiempo de carrera');
		readln(tiempo);

		if (tiempo>max1) then begin
			max2:=max1;
			max1:=tiempo;
			Nmax2:=Nmax1;
			Nmax1:=nombre;
		end
		else
			if (tiempo>max2) then begin
				max2:=tiempo;
				Nmax2:=nombre;
			end;


		if (tiempo<min1) then begin
			min2:=min1;
			min1:=tiempo;
			Nmin2:=Nmin1;
			Nmin1:=nombre;
		end
		else
			if (tiempo<min2) then begin
				min2:=tiempo;
				Nmin2:=nombre;
			end;
	end;
	writeln('el nombre del corredor mas rapido es: ',Nmin1);
	writeln('el nombre del segundo corredor mas rapido es: ',Nmin2);
	writeln('el nombre del corredor mas lento es: ',Nmax1);
	writeln('el nombre del segundo corredor mas lento es: ',Nmax2);
end.



   program ejer;
var
    i:integer;
    piloto, nam_max1, nam_max2, nam_min1, nam_min2:string[20];
    tiempo, tiempo_max1, tiempo_max2, tiempo_min1, tiempo_min2:real;
begin
    tiempo_max2:=-1;
    tiempo_max1:=-1;
    tiempo_min2:=999;
    tiempo_min1:=999;

    for i:=1 to 100 do begin
        write('Ingrese el nombre del piloto y el tiempo total ');
        writeln('que le tomo finalizar la carrera');
        readln(piloto);
        readln(tiempo);
        if (tiempo > tiempo_max1) then begin
            tiempo_max2:=tiempo_max1;
            nam_max2:=nam_max1;
            tiempo_max1:=tiempo;
            nam_max1:=piloto;
        end
        else if (tiempo > tiempo_max2) then begin
            tiempo_max2:=tiempo;
            nam_max2:=piloto;
        end;
        if (tiempo < tiempo_min1) then begin
            tiempo_min2:=tiempo_min1;
            nam_min2:=nam_min1;
            tiempo_min1:=tiempo;
            nam_min1:=piloto;
        end
        else if (tiempo < tiempo_min2) then begin
            tiempo_min2:=tiempo;
            nam_min2:=piloto;
        end;
    end;
        write('Los nombres de los dos pilotos que finalizaron');
        write('Los nombres de los dos pilotos que finalizaron');
        writeln(' en los dos primeros puestos es ', nam_max1, ' y ', nam_max2);
        write('Los nombres de los dos pilotos que finalizaron');
        writeln(' en los dos ultimos puestos es ',nam_min1, ' y ', nam_min2);
    readln();
end.



   program Ejercicio8;
type
mes= 1..31;
var
dia:mes;
cant:integer;
monto,total:real;
begin
  total:=0;
  for dia:= 1 to 31 do begin //CADA ITERACION DEL FOR ES UN DIA
    cant:=0;
    Writeln('Escriba los montos del dia ',dia,': ');
    readln(monto);

    while (monto<>0) do begin
      cant:=cant+1;
      total:=total+monto;
      Writeln('Escriba los montos del dia ',dia,': ');
      readln(monto);
    end;

    writeln('la cantidad de ventas en el dia ',dia,' es ',cant,' ventas');
  end;

  writeln('el monto total acumulado en ventas de todo el mes ',total);
end.


  program ej1;
var
    i,diaMax:integer;montoVenta,montoDiario,montoMensual,max:real;
begin

    montoMensual:=0;
    max:=-1;
    diaMax:=-1;
    for i:=1 to 31 do begin
        montoDiario:=0;
        writeln('ingrese un monto de venta del dia:',i);
        read(montoVenta);

        while (montoVenta<>0) do begin
            montoDiario:=montoDiario+montoVenta;
            writeln('ingrese un monto de venta del dia:',i);
            read(montoVenta);
        end;

        writeln('el monto total de ventas del dia ',i,' es ',montoDiario); //CANT DE VENTAS
        montoMensual:=montoMensual+montoDiario;


        if montoDiario > max then begin //inciso (A)
            max:=montoDiario;
            diaMax:=i;
        end;
    end;
    writeln('el monto total de ventas del mes es ',montoMensual);
    writeln('el dia que mas ventas se realizo es: ',diaMax); //inciso (A)
end.









