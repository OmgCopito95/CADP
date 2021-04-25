 {
program eje4;
var
   primer:integer;
   nuevo:integer;
begin
   read(primer);
   read(nuevo);

   while(primer*2 <> nuevo) and (cont < 11)do begin
      cont:=cont+1;
      read(nuevo);
   end;
   writeln('el numero leido es el doble del primero');
   readln();
   readln();
end.
}

Program EXPLICACION;

var
	legajo,cant,cant6,cant8:integer;
	promedio:real;
begin
	cant:=0;  //cantidad total de alumnos leidos
	cant6:=0;
	cant8:=0;
	writeln('ingrese el numero de legajo');
	readln(legajo);
	while (legajo <> -1) do begin
		writeln('ingrese el promedio');
		readln(promedio);
		cant:=cant+1;
		if (promedio>6.5) then
			cant6:=cant6+1;
		if (promedio>8.5) and (legajo<2500) then
			cant8:=cant8+1;
		writeln('ingrese el numero de legajo');
		readln(legajo);
	end;
	writeln('la cantidad de alumnos leidos fue ',cant);
	writeln('la cantidad de alumnos con promedio +6.5 fue ',cant6);
	writeln('el promedio de alumnos destacados fue ',((cant8/cant)*100):2:2,'%');
end.


program ej1;

var
	codigo:integer;precioact,precionue:real;
begin
	repeat
		writeln('ingrese el codigo');
		readln(codigo);
		writeln('ingrese el precio actual');
		readln(precioact);
		writeln('ingrese el nuevo precio');
		readln(precionue);
		if (precionue > precioact*1.1) then
			writeln('el aumento supera el 10%')
		else
			writeln('el aumento no supera el 10%');

	until codigo=32767;
end.

 program eje7;
var
  codigo:integer;
  precio_actual:real;
  precio_nuevo:real;
  supera:real;
  porcentaje:real;
begin
     porcentaje:=0;
     write('ingrese un codigo de producto');
     read(codigo);

     while(codigo <> 32767)do begin
       write('ingrese el precio actual del producto');
       read(precio_actual);
       write('ingrese el nuevo precio del producto actual');
       read(precio_nuevo);

       supera:=precio_nuevo - precio_actual;
       porcentaje:=supera*(100/precio_actual);
       if(porcentaje < 10)then begin
          write('el aumento del precio del producto ', codigo ,' no supera el 10%');
       end
       else
         write('el aumento del precio del producto ', codigo ,' supera el 10%');

       read(codigo);
     end;

     //PROCESA EL CORTE
      write('ingrese el precio actual del producto');
       read(precio_actual);
       write('ingrese el nuevo precio del producto actual');
       read(precio_nuevo);

       supera:=precio_nuevo - precio_actual;
       porcentaje:=supera*(100/precio_actual);
       if(porcentaje < 10)then begin
          write('el aumento del precio del producto ', codigo ,' no supera el 10%');
       end
       else
         write('el aumento del precio del producto ', codigo ,' supera el 10%');


end.






program ej1;

var
	x:char;i,vocal:integer;
begin
	vocal:=0;
	for i:=1 to 3 do begin
		writeln('ingrese una letra minuscula');
		readln(x);
		if (x='a') or (x='e')or (x='i') or (x='o') or (x='u') then
			vocal:=vocal+1;
	end;
	if (vocal=3) then
		writeln('las tres son vocales')
	else
		writeln('al menos una no era vocal');
end.







program eje8;
const
 cantidad=3;
var
  caracter:char;
  vocal:boolean;
  numero:integer;
  esCaracter:boolean;
begin
   numero:=1;
   vocal:=true;
   esCaracter:=true;
   while(numero < cantidad)do begin
     writeln('ingrese el caracter');
     readln(caracter);
     numero:=numero+1;
     esCaracter:=(caracter = 'a') or (caracter = 'e') or (caracter = 'i') or (caracter = 'o') or (caracter = 'u');
     vocal:=vocal and esCaracter;
   end;
   if(vocal)then begin
     write('los tres caracteres son vocales');
   end
     else
       write('al menos uno no es vocal');
   readln();
   readln();
end.






  program ocho;
type
    vocal = 'a'..'u';
var
voc:vocal;
car1, car2, car3:char;
Begin
readln (car1);
readln (car2);
readln (car3);
if (car1 = voc) and (car2 = voc) and (car3 = voc) then
    writeln ('los tres son vocales')
    else
        writeln ('al menos un caracter no era vocal');

end.



 program ejercicio8;
var
    Ch1,Ch2,Ch3: char;
begin
    writeln('Ingrese el primer caracter:');
    readln(Ch1);
    writeln('Ingrese el segundo caracter:');
    readln(Ch2);
    writeln('Ingrese el tercer caracter:');
    readln(Ch3);
    if ((Ch1='a') or (Ch1='e') or (Ch1='i') or (Ch1='o') or (Ch1='u')) and
             ((Ch2='a') or (Ch2='e') or (Ch2='i') or (Ch2='o') or (Ch2='u')) and
             ((Ch3='a') or (Ch3='e') or (Ch3='i') or (Ch3='o') or (Ch3='u')) then
                writeln('Las tres letras son vocales')
    else
      writeln('Al menos una letra no es vocal')

end.












   program ej1;

var
	operador:char; num,resultado:integer;
begin
	resultado:=0;
	readln(operador);
	if (operador = '+') or (operador = '-') then
		if (operador = '+') then begin
			readln(num);
			while num<>0 do begin
				resultado:=resultado+num;
				readln(num);
			end;
			writeln('el resultado de la suma es: ',resultado);
		end
		else begin
			readln(num);
			resultado:=2*num;
			while num<>0 do begin
				resultado:=resultado-num;
				readln(num);
			end;
			writeln('el resultado de la resta es: ',resultado);
		end
	else
	  writeln('se ingreso un operador erroneo');
end.

 program pr1ej9;
var caracter: char;
    numeros,total: integer;
begin
  numeros:=0;
  //sumaNumeros:=0;
  write('Ingrese el caracter deseado: ');
  readln(caracter);
  if (caracter = '+') or (caracter = '-') then
        begin
          write('Ingrese la secuencia de numeros: ');
          readln(numeros);
          if (caracter = '-') then
          total:=numeros*2;
          while (numeros <> 0) do
                begin
                     if (caracter = '+') then
                        total:=total+numeros
                     else
                        total:=total-numeros;
                     readln(numeros);
                end;
          write('El resultado de la secuencia de numeros es: ',total,'');
        end
  else
      write('El caracter que introdujo no es correcto');
  readln;
end.


program eje9;
type
    rango=1..10
var
   r: rango;
   caracter:char;
   secuenciaN,secuenciaP,positivo,negativo:real;
begin
   negativo:=0;
   positivo:=0;
   writeln('ingrese caracter');
   readln(caracter);
   if(caracter = '-')then begin
      writeln('ingrese la secuenciaN');
      readln(secuenciaN);
      negativo:=secuenciaN;
      writeln('la secuenciaN es: ' , negativo :0:2);
   end
   else
     if(caracter = '+')then begin
       writeln('ingresar secuenciaP');
       readln(secuenciaP);
       positivo:=secuenciaP;
       writeln('la secuenciaP es : ', positivo :0:2);
     end
     else
       writeln('no se ingreso ninguno de los dos caracteres');
   readln();
   readln();
end.







              //CALCULAR UN MINIMO

              //paso 1: declarar variable
              min: integer;

              //paso 2: inicializar la variable (en un numero grande)
              min:= 999;

              read(numero);
              while(numero <> -1)do begin
                 //paso 3: comparar
                 if(numero < min)then
                   //paso4: actualizar minimo
                    min:=numero;

                 read(numero);
              end;





              //CALCULAR UN MAXIMO

              //paso 1: declarar variable
              max: integer;

              //paso 2: inicializar la variable (en un numero chico)
              max:= -999;

              read(numero);
              while(numero <> -1)do begin
                 //paso 3: comparar
                 if(numero > max)then
                   //paso4: actualizar maximo
                    max:=numero;

                 read(numero);
              end;



              //CALCULAR DOS MAXIMOS
                 numero:integer;
              //paso 1: declarar variables
              max1: integer;  -> EL NUMERO MAS GRANDE
              max2: integer;  -> EL SEGUNDO NUMERO MAS GRANDE

              //paso 2: inicializar las variables (en un numero chico)
              max1:= -999;
              max2:= -999;

              read(numero);
              while(numero <> -1)do begin
                 //paso 3: comparar con max1
                 if(numero > max1)then begin
                   //paso4: actualizar
                    max2:=max1;
                    max1:=numero;
                 end
                 else
                    if(numero > max2)then //paso5: comparar con max2
                       max2:=numero; //paso6: actualizar max2


                 read(numero);
              end;













