{3. Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota}

program ejerciocio3;

var
    nombre: string[5];
    nota: 1..10;
    aprobados: integer;
    cantidad: integer;

begin
    aprobados := 0; //es un contador por eso lo inicializo en 0
    cantidad := 0; //es un contador por eso lo inicializo en 0
    repeat
        //leo un nombre
        write('Ingrese un nombre: ');
        readln(nombre);

        //leo una nota
        write('Ingrese una nota: ');
        readln(nota);

        //si la nota es mayor a 8, sumo 1 a aprobados
        if nota >= 8 then
            aprobados := aprobados + 1
        else // si es mayor a 8 seguro no es 7, por eso puedo ir por el else
            if nota = 7 then //si la nota es 7, sumo 1 a cantidad
                cantidad := cantidad + 1;

    until (nombre = 'Zidane Zinedine'); //si el nombre es Zidane Zinedine, termino el bucle

    writeln('La cantidad de alumnos aprobados es: ', aprobados);
    writeln('La cantidad de alumnos que obtuvieron un 7 como nota es: ', cantidad);

end.
