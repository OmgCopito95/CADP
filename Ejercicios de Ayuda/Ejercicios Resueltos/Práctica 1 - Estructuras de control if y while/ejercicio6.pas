{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
○ La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2)
○ La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar 1)
○ El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}

Program ejercicio6;
var
    legajo: integer;
    promedio: real;
    cantidad: integer;
    cantidad_destacados: integer;
    porcentaje_destacados: real;
begin
   cantidad := 0;
   cantidad_destacados := 0;
   porcentaje_destacados := 0;

   readln(legajo); //leo un legajo

   while (legajo <> -1) do begin//mientras el legajo no sea -1
         readln(promedio); //leo el promedio

         if (promedio > 6.5) then begin//si el promedio es mayor a 6.5
            cantidad_destacados := cantidad_destacados + 1; //aumento en 1 la cantidad de alumnos destacados
         end;

         if (legajo < 2500) then begin//si el legajo es menor a 2500
            porcentaje_destacados := porcentaje_destacados + 1; //aumento en 1 el porcentaje de alumnos destacados
         end;

         cantidad := cantidad + 1; //aumento en 1 la cantidad de alumnos leídos

         readln(legajo); //leo un legajo
   end;

   writeln('La cantidad de alumnos leída es: ', cantidad); //imprimo la cantidad de alumnos leídos
   writeln('La cantidad de alumnos cuyo promedio supera 6.5 es: ', cantidad_destacados); //imprimo la cantidad de alumnos cuyo promedio supera 6.5
   writeln('El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean menor al valor 2500 es: ', porcentaje_destacados / cantidad * 100:2:2); //imprimo el porcentaje de alumnos destacados

   readln;
end.
