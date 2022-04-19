{Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
a. Para cada empresa, el monto promedio de sus inversiones
b. Código de la empresa con mayor monto total invertido
c. Cantidad de empresas con inversiones de más de $50000}

program project1;

Var
   indice,codigo,cant_inversiones,cant_50mil,cod_max:integer;
   monto,monto_total,max,promedio: real;
Begin

   cant_50mil:=0;
   max:= -1;
   REPEAT  // CADA REPETICION ES UNA EMPRESA DIFERENTE

      monto_total:=0;
      writeln ('Ingrese codigo de la empresa');
      readln(codigo);
      writeln('Ingrese cantidad de inversiones que tiene la empresa: ');
      readln(cant_inversiones);

      FOR indice:= 1 to cant_inversiones do begin
          writeln('Ingrese un monto: ');
          readln(monto);
          monto_total:= monto_total + monto;
      end;

      promedio:= monto_total / cant_inversiones;
      writeln('El monto promedio de la empresa con codigo ',codigo,', es de: $',promedio:6:2);                   //INCISO A

      IF (monto_total > max) then begin
         max:= monto_total;
         cod_max:= codigo;
      end;

      IF (monto_total > 50000) then
         cant_50mil:= cant_50mil + 1;

      writeln('                           ');

   UNTIL (codigo = 100);
   //TERMINO DE PROCESAR TODAS LAS EMPRESAS
   writeln('<<El codigo de la empresa con mayor monto total invertido fue: ',cod_max,' >>');
   writeln('                        ');
   writeln('<<Cantidad de empresas con inversiones de mas de $50000: ',cant_50mil,' >>');
   readln();
End.











program ejer;
var
    codigo, cant_inversion, i, cant, cant_max, codigo_max:integer;
    monto, monto_total, monto_promedio, monto_max:real;
begin
    cant:=0;
    cant_max:=0;
    monto_max:=0;

    i:=0;
    repeat
        monto_promedio:=0;
        monto_total:=0;
        cant:=0;
        writeln('Ingrese el codigo de la empresa');
        readln(codigo);
        writeln('Ingrese la cant. de inversiones');
        readln(cant_inversion);

        for i:=1 to cant_inversion do begin
            writeln('Ingrese el monto de cada inversion ', i);
            readln(monto);
            if (monto > 50000) and (cant = 0) then begin
                cant:=cant+1;
            end;
            monto_total:=monto_total+monto;
        end;

        monto_promedio:=monto_total/cant_inversion;
        writeln('La empresa ',codigo,' tiene un monto promedio de ', monto_promedio:4:4);

        if (monto_total > monto_max) then begin
            monto_max:=monto_total;
            codigo_max:=codigo;
        end;

        if (cant <> 0) then begin
            cant_max:=cant_max+1;
        end;

    until (codigo = 100);

   writeln('La empresa ',codigo_max,' es la que mayor dinero posee invertido (',monto_max:4:4,').');
    writeln('Hay ',cant_max,' empresas con inversiones por mas de 50000');
    readln();
end.






     FUNCIONES -> function
       NO READ()
       NO WRITE()
       CANT VALORES QUE PUEDE DEVOLVER: 1
       TIPOS DE DATOS QUE PUEDE DEVOLVER: simple

       :)


     PROCEDIMIENTOS -> procedure
       READ()
       WRITE()
       CANT VALORES QUE PUEDE DEVOLVER: 0,1, o mas
       TIPOS DE DATOS QUE PUEDE DEVOLVER: todos







          function cosito:integer;
          begin
             ....
          end;

          begin
             a:=cosito;  //ASIGNO LA FUNCION EN UNA VARIABLE
             writeln(a);

             writeln(cosito); //hacer un writeln llamando a una funcion

             if(cosito = 4) then   //USO UNA FUNCION EN UNA CONDICION
                writeln('hola');
          end;


          procedure cosito2;
          begin
             ....
          end;

          begin
             cosito2(a,b); //solo se pueden llamar

          end;



        function chequear(.....): boolean;
        var
            a:integer;

         begin
            chequear:=  (num < 15) and (dni =123123) or (cant = 0)
         end;


         begin
           writeln('hola')

           if(chequear(...))then
            writeln('chau');
         end;




program ejer; {SER SUPONE QUE HAY RECURSANTES E INGRESANTES... SI NO DA ERROR, YA QUE UNO O EL OTRO ESTA TRABAJANDO CON 0 ERROR EN DIVICIONES}
var
    legajo, condi_i, condi_r, i, condicion_rendir_ingre,condicion_rendir_recur, nota_aprobado_ingre, nota_aprobado_recur:integer;
    nota_todas_aprobadas_final, nota_todas_aprobadas, cant_alumnos, promedio_6, nota_0, nota_0_final:integer;
    cant_10, cant_10_max1, cant_10_max2, cod_10_1, cod_10_2, cod_0_1, cod_0_2, cant_0, cant_0_max1, cant_0_max2:integer;
    condicion:char;
    nota, porcentaje_ingre, porcentaje_recur, suma_nota, promedio:real;
begin
    cant_0_max1:=0;
    cant_0_max2:=0;
    cant_0:=0;
    cod_0_1:=999;
    cod_0_2:=999;
    cant_10:=0;
    cant_10_max1:=-1;
    cant_10_max2:=-1;
    cod_10_1:=0;
    cod_10_2:=0;
    nota_0:=0;
    nota_0_final:=0;
    cant_alumnos:=0;
    suma_nota:=0;
    promedio_6:=0;
    promedio:=0;
    nota_todas_aprobadas:=0;
    nota_todas_aprobadas_final:=0;
    porcentaje_recur:=0;
    porcentaje_ingre:=0;
    nota_aprobado_ingre:=0;
    nota_aprobado_recur:=0;
    condicion_rendir_ingre:=0;
    condicion_rendir_recur:=0;
    i:=0;
    condi_r:=0;
    condi_i:=0;
    writeln('Ingrese el legajo del alumno');
    readln(legajo);

    while (legajo <> -1) do begin
        writeln('Ingrese su condicion I o R');
        readln(condicion);
        cant_alumnos:=cant_alumnos+1;
            if (condicion = 'i') then begin
                condi_i:=condi_i+1;
                for i:=1 to 5 do begin
                    write('Ingrese la nota de la ',i, ' autoevaluacion, si no la realizo ');
                    writeln('en tiempo y forma ingrese -1');
                    readln(nota);
                        if (nota_aprobado_ingre = 4) then
                            condicion_rendir_ingre:=condicion_rendir_ingre+1;
                        if (nota >=4) then
                            if (nota_aprobado_ingre <=4) then {parte del ingresante}
                               nota_aprobado_ingre:=nota_aprobado_ingre+1;    {veo si llega los 4 aprobados con nota mayor a 4}

                            nota_todas_aprobadas:=nota_todas_aprobadas+1;
                        ELSE
                           if (nota = 0) and (nota_0 < 1 ) then
                               nota_0:=nota_0+1;

                        if (nota = 10) then
                            cant_10:=cant_10+1;
                        ELSE
                           if (nota = 0) then
                               cant_0:=cant_0+1;

                end;

                //if (cant_10 <> 0) then begin
                            if (cant_10 > cant_10_max1) then begin
                                cant_10_max2:=cant_10_max1;
                                cod_10_2:=cod_10_1;
                                cant_10_max1:=cant_10;
                                cod_10_1:=legajo;
                            end
                            else
                                if (cant_10 > cant_10_max2) then begin
                                    cant_10_max2:=cant_10;
                                    cod_10_2:=legajo;
                            end;
                        end;
                        //if (cant_0 <> 0) then begin
                            if (cant_0 > cant_0_max1) then begin
                                cant_0_max2:=cant_0_max1;
                                cod_0_2:=cod_0_1;
                                cant_0_max1:=cant_0;
                                cod_0_1:=legajo;
                            end
                            else
                                if (cant_0 > cant_0_max2) then begin
                                    cant_0_max2:=cant_0;
                                    cod_0_2:=legajo;
                            end;
                    suma_nota:=suma_nota+nota;
                end;
            end
            else begin {parte del recursante}
                 condi_r:=condi_r+1;
                 for i:=1 to 5 do begin
                    write('Ingrese la nota de la ',i,' autoevaluacion, si no la realizo ');
                    writeln('en tiempo y forma ingrese -1');
                    readln(nota);
                        if (nota > 4) and (nota_aprobado_recur <=4) then
                            nota_aprobado_recur:=nota_aprobado_recur+1;
                        if (nota_aprobado_recur = 4) then
                            condicion_rendir_recur:=condicion_rendir_recur+1;
                        if (nota >=4) then
                            nota_todas_aprobadas:=nota_todas_aprobadas+1;
                        if (nota = 0) and (nota_0 < 1 ) then
                            nota_0:=nota_0+1;
                        if (nota = 0) then
                            cant_0:=cant_0+1;
                        if (cant_10 <> 0) then begin
                            if (cant_10 > cant_10_max1) then begin
                                cant_10_max2:=cant_10_max1;
                                cod_10_2:=cod_10_1;
                                cant_10_max1:=cant_10;
                                cod_10_1:=legajo;
                            end
                            else
                                if (cant_10 > cant_10_max2) then begin
                                    cant_10_max2:=cant_10;
                                    cod_10_2:=legajo;
                            end;
                        end;
                        if (cant_0 <> 0) then begin
                            if (cant_0 > cant_0_max1) then begin
                                cant_0_max2:=cant_0_max1;
                                cod_0_2:=cod_0_1;
                                cant_0_max1:=cant_0;
                                cod_0_1:=legajo;
                            end
                            else
                                if (cant_0 > cant_0_max2) then begin
                                    cant_0_max2:=cant_0;
                                    cod_0_2:=legajo;
                            end;
                        end;
                    suma_nota:=suma_nota+nota;
                end;
            end;
            promedio:=suma_nota/5;
            if (nota_0 = 1) then
                nota_0_final:=nota_0_final+1;
            if (promedio > 6.5) then
                promedio_6:=promedio_6+1;
            if (nota_todas_aprobadas = 5) then
                nota_todas_aprobadas_final:=nota_todas_aprobadas_final+1;
            nota_aprobado_recur:=0;
            nota_aprobado_ingre:=0;
            nota_todas_aprobadas:=0;
            suma_nota:=0;
            cant_10:=0;
            cant_0:=0;
            nota_0:=0;
            writeln('Ingrese el legajo del alumno');
            readln(legajo);
    end;
    porcentaje_ingre:=condicion_rendir_ingre*100/condi_i;
    porcentaje_recur:=condicion_rendir_recur*100/condi_r;
    writeln('La cantidad de alumnos INGRESANTES en condiciones de rendir el parcial ',condicion_rendir_ingre);
    writeln('El porcentaje sobre el total de alumnos INGRESANTES ', porcentaje_ingre:2:2);
    writeln('La cantidad de alumnos RECURSANTE en condiciones de rendir el parcial ', condicion_rendir_recur);
    writeln('El porcentaje sobre el total de alumnos RECURSANTE ', porcentaje_recur:2:2);
    writeln('La cantidad de alumnos que aprobaron todas las autoevaluaciones ', nota_todas_aprobadas_final);
    writeln('La Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos ',promedio_6);
    writeln('La Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion ', nota_0_final);
    writeln('El Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) ',cod_10_1,' y ', cod_10_2);
    writeln('El Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) ',cod_0_1,' y ', cod_0_2);
    readln();
end.






{Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1. Por ejemplo, si la materia tuviera dos alumnos, un
ingresante y un recursante, la lectura podría ser así:
Una vez ingresados todos los datos, el programa debe informar:

Legajo: 19003
Condición: R
Notas: 8 10 6 -1 8

Legajo 21020
Condición: I
Notas: 4 0 6 10 -1
Legajo -1
(Fin de la lectura)

A. Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
B. Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
C. Cantidad de alumnos que aprobaron todas las autoevaluaciones     <<<
D. Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos    <<<
E. Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.  <<<
F. Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)}

program actividad2;
Type
  nombre= string [20];

Var
  alumno: nombre;
  i,legajo,prom_6,aprobado,total_aprobados,nota_0,contador_10,leg_max1,leg_max2: integer;
  contador_0,cant_puedenI,cant_puedenR,total_ingresantesR,total_ingresantesI: integer;
  condicion: char;
  nota,suma_notas,promedio,max1,max2,porcentaje_puedenI,porcentaje_puedenR: real;
  puede: boolean;
Begin
   //nota_0:= 0;
   //contador_10:= 0;
   max1:= -1;
   max2:= -1;
   prom_6:= 0;
   total_aprobados:= 0;
   contador_0:= 0;
   total_ingresantesI:= 0;
   total_ingresantesR:=0;
   cant_puedenI:=0;
   cant_puedenR:=0;

   writeln('INGRESE EL LEGAJO');
   readln(legajo);
   While (legajo <> -1) do begin
     promedio:= 0;
     aprobado:= 0;
     suma_notas:= 0;
     contador_10:= 0;
     nota_0:=0

     writeln('INGRESE EL NOMBRE DEL ALUMNO');
     readln(alumno);

     for i:= 1 to 5 do begin
         puede:= false;
	 writeln('INGRESE LA NOTA OBTENIDA');
         readln(nota);
         suma_notas:= suma_notas + nota;

	    IF (nota > 4) then
               aprobado:= aprobado + 1;

	    IF ( nota = 10) then
               contador_10:= contador_10 + 1;

         IF (nota = 0) then                                // INCISO E
            nota_0:= nota_0 + 1;
     end;

     writeln ('INGRESE CONDICION. PRESIONE EN MAYUSCULAS, I PARA INGRESANTE Y R PARA RECURSANTE');
     readln(condicion);

     IF (condicion = 'I') then
             total_ingresantesI:= total_ingresantesI + 1;

     IF (aprobado > 3) then
         puede:= true;
	 IF (puede) then
	    cant_puedenI:= cant_puedenI + 1                     // CANT INGRESANTES QUE PUEDEN RENDIR

    	 ELSE
		   IF (condicion = 'R') then
              total_ingresantesR:= total_ingresantesR + 1;

		       IF (aprobado > 3) then
			       puede:= true;
				   IF (puede) then
				      cant_puedenR:= cant_puedenR + 1;                // CANTIDAD RECURSANTES QUE PUEDEN RENDIR


	     IF (aprobado = 5) then                                      // INCISO C
            total_aprobados:= total_aprobados + 1;

         IF (contador_10 > max1 ) then begin                        // INCISO F maximos
            max2:= max1;
            max1:= contador_10;
            leg_max2:= leg_max1;
            leg_max1:= legajo;
            end

          ELSE
            IF (contador_10 > max2) then begin
               max2:= contador_10;
               leg_max2:= legajo;
            end;

    	 promedio:= suma_notas / 5;                       // INCISO D

         IF (promedio > 6.5) then
           prom_6:= prom_6 + 1;

          IF (nota_0 > max_1 ) then begin                        // INCISO DE CEROS maximos
            max2:= max_1;
            max_1:= contador_10;
            leg_max2:= leg_max1;
            leg_max1:= legajo;
            end

          ELSE
            IF (contador_10 > max2) then begin
               max2:= contador_10;
               leg_max2:= legajo;
            end;


     writeln('            ');
     writeln('INGRESE EL LEGAJO DEL SIGUIENTE ALUMNO');
     readln(legajo);

     end;

	 porcentaje_puedenI:= cant_puedenI / total_ingresantesI;
	 porcentaje_puedenR:= cant_puedenR / total_ingresantesR;

	 writeln('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial: ',cant_puedenI,' porcentaje sobre el total de alumnos INGRESANTES: %',porcentaje_puedenI);
     writeln('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial: ',cant_puedenR,' porcentaje sobre el total de alumnos RECURSANTES: %',porcentaje_puedenR);
     writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones: ',total_aprobados);
	 writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos: ',prom_6);
	 writeln('Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación: ',contador_0);
	 writeln('Codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez): ',leg_max1,' y el segundo: ',leg_max2);
     readln();
End.






























