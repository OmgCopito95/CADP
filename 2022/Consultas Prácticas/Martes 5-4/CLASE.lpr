//EJEMPLO MIN Y MAX

//LEO 10 NUMEROS ENTEROS Y CALCULO EL MINIMO y EL MAXIMO

program CLASE;
var
   //1° declaro variable min
   min:integer;

   max: integer;
begin
  //2° inicializar la variable
  min:=9999; //numero muy grande

  max:=-9999; //muy chiquito

  for(i:=1 to 10)do begin   //leo 10 datos
    read(numero); //leo el numero

    //3°comparo el numero leido con el min
    if(numero < min) then
      //4°actualizo el min
      min:=numero;
      pos:=i;
    end;

    //3°comparo el numero leido con el max
    if(numero > max)then
      max:=numero;

  end;
  writeln(min); //esta el num mas chico
  writeln(max); //esta el num mas grande

end.


//LEO 10 NUMEROS ENTEROS Y CALCULO 2 MINIMOs

program ejemplo2;
var
   //1° declaro variable min1 y min2
   min1, min2:integer;

begin
   //2° inicializar las variables
   min1:=9999;
   min2:=9999;

   for(i:=1 to 10)do begin   //leo 10 datos
    read(numero); //leo el numero

    //----------------CALCULA DOS MINIMOS------------------------//
    //3°comparo el numero leido con el min1
    if(numero < min1)then begin
      min2 := min1;      //4° actualizo min2 con el valor de min1
      min1 := numero     //5° actualizo min1 con el numero leido
    end
    else
      //6° comparo el numero leido con el min2
      if(numero < min2)then
        //7° actualizo min2
        min2:=numero;
    //----------------------------------------------------------//


    //--------------calcula dos maximos-------------------------//






    //----------------------------------------------------------//

   end;

   writeln(min1); //el mas chico
   writeln(min2); //el segundo mas chico


end.



 //EJERCICIO 2 ADICIONAL - FALTA TERMINAR

contar la cantidad de ingresantes y que tiene que sacar al menos un 4 en al menos 4 autoevaluaciones


   //Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial
   max:=-9999;


   read(legajo);
   while(legajo <> -1)do begin // cada pasada procesa una persona

     cantNotaMasCuatro:=0;
     cantNotaCero:=0;

     read(condicion); //ingresante o recursante

     for(i:=1 to 5)do begin //cada pasada es una nota
       read(nota);

       if(nota >= 4)then
         cantNotaMasCuatro := cantNotaMasCuatro + 1;

       if(nota=0)then
         cantNotaCero:= cantNotaCero + 1;



     end;
     //termine de leer las notas
                  r
     if ( (condicion='i') and  (cantNotaMasCuatro>4) ) then
       cantIngresantesA:= cantIngresantesA + 1; //TOTAL INGRESANTES PUNTO A
     else
       if((condicion='r') and (cantNotaMasCuatro>4) )
        cantRecursantesB:= cantRecursantesB + 1;


     if(cantNotaCero > max)then begin
       max:=cantNotaCero
       legajoMax:=legajo;
     end;

      cantTotalAlumnos:=cantTotalAlumnos+1;  //TOTAL DE ALUMNOS
        read(legajo);
   end;



//Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)


//-------------------------------------------------------------//



//REVISAR
program prac1AdicionalAct3;
var
  ancho, largo, alto, radio, volumen_rectangular, volumen_cilindrico, max1, max2, volumen_promedioC, volumen_totalC, volumen_totalR, volumen_promedioR: real;
  tipo_tanque: char;
  rectangulares_vendidos, cilindricos_vendidos, cant_tanques1, cant_tanques2: integer;
begin
  max1:= 0;
  max2:=0;
  volumen_totalC:=0;
  volumen_totalR:=0;
  cilindricos_vendidos:=0;
  rectangulares_vendidos:=0;
  cant_tanques1:=0;
  cant_tanques2:=0;
  writeln('ingrese un tipo de tanque:');
  readln(tipo_tanque);
  while (tipo_tanque <> 'Z') do begin
    if ( (tipo_tanque = 'R') or (tipo_tanque= 'C') ) then begin
      if (tipo_tanque = 'R') then begin
        writeln('ingrese su ancho:');
        readln(ancho);
        writeln('ingrese su largo');
        readln(largo);
        writeln('ingrese su alto');
        readln(alto);
        volumen_rectangular:= ancho * largo * alto;
        if (volumen_rectangular < 800) then
          cant_tanques2:= cant_tanques2 + 1;                                {revisar los dos maximos}
        volumen_totalR:= volumen_totalR + volumen_rectangular;
        rectangulares_vendidos:= rectangulares_vendidos + 1;


      else begin
        writeln('ingrese su radio:');
        readln(radio);
        writeln('ingrese su alto:');
        readln(alto);

        volumen_cilindrico:= 3.14 * radio * radio* alto;
        if (volumen_cilindrico < 800) then
          cant_tanques2:= cant_tanques2 + 1;
        volumen_totalC:= volumen_totalC + volumen_cilindrico;
        cilindricos_vendidos:= cilindricos_vendidos + 1;

      end;

        if (max1 < volumen_cilindrico) then begin       //volumen_cilindrico ->podria usar una sola variable para ambos
          max2:= max1;
          max1:= volumen_cilindrico;
        end
        else
          if (max2 < volumen_cilindrico) then
          max2:= volumen_cilindrico;


        if (alto < 1.40) then
          cant_tanques1 := cant_tanques1 + 1;

      end;
    end;
    writeln('ingrese un tipo de tanque:');
    readln(tipo_tanque);
  end;
  volumen_promedioC:= volumen_totalC / cilindricos_vendidos;
  volumen_promedioR:= volumen_totalR / rectangulares_vendidos;
  writeln('el volumen de los dos mayores tanques vendidos es:  ',max1:8:0, ' y ', max2:8:0);
  writeln('el volumen promedio de todos los tanques cilindricos vendidos es:  ', volumen_promedioC:8:0);
  writeln('el volumen promedio de todos los tanques rectangulares vendidos es:  ', volumen_promedioR:8:0);
  writeln('la cantidad de tanques cuyo alto es menor a 1.40 metros es:  ', cant_tanques1);
  writeln('la cantidad de tanques cuyo volumen es menor a 800 metros cubicos es:  ',cant_tanques2);
  readln();
end.



//EJERCICIO 3 DE LA PRACTICA 1 PARTE 2
program ej3;
var
alumno: string[20]; //LIMITO EL STRING A UN MAXIMO DE 20 CARACTERES
nota:real;
conNota7: integer;
conNotaMayorA8:integer;
begin
conNota7:= 0;
conNotaMayorA8:=0;
read(alumno);
while (alumno <> 'Zidane Zinedine') do begin  //-> REPEAT UNTIL
read(nota);

  if (nota >= 8) then
     conNotaMayorA8:= conNotaMayorA8 + 1;
  else
      if (nota = 7) then
         conNota7:= conNota7 + 1;

read(alumno);
end;



writeln('La cantidad de alumnos con 7 es: ', conNota7);
writeln('La cantidad de alumnos con 8 o mas es: ', conNotaMayorA8);
end.











































