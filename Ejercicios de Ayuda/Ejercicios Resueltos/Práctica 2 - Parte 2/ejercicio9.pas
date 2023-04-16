{9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program ejercicio9;
type
    cadena20 = string[20];

procedure leerAlumno(var numeroInscripcion: integer; var apellido: cadena20; var nombre: cadena20);
begin
    writeln('Ingrese el numero de inscripcion');
    readln(numeroInscripcion);
    writeln('Ingrese el apellido');
    readln(apellido);
    writeln('Ingrese el nombre');
    readln(nombre);
end;

procedure actualizarMinimos(numeroInscripcion: integer; apellido: cadena20; var min1: integer; var min2: integer; var apellidoMin1: cadena20; var apellidoMin2: cadena20);
begin
    if (numeroInscripcion < min1) then
    begin
        min2 := min1;
        apellidoMin2 := apellidoMin1;
        min1 := numeroInscripcion;
        apellidoMin1 := apellido;
    end
    else if (numeroInscripcion < min2) then
    begin
        min2 := numeroInscripcion;
        apellidoMin2 := apellido;
    end;
end;

procedure actualizarMaximos(numeroInscripcion: integer; nombre: cadena20; var max1: integer; var max2: integer; var nombreMax1: cadena20; var nombreMax2: cadena20);
begin
    if (numeroInscripcion > max1) then
    begin
        max2 := max1;
        nombreMax2 := nombreMax1;
        max1 := numeroInscripcion;
        nombreMax1 := nombre;
    end
    else if (numeroInscripcion > max2) then
    begin
        max2 := numeroInscripcion;
        nombreMax2 := nombre;
    end;
end;

var
    numeroInscripcion: integer;
    apellido: cadena20;
    nombre: cadena20;
    min1: integer;
    min2: integer;
    apellidoMin1: cadena20;
    apellidoMin2: cadena20;
    max1: integer;
    max2: integer;
    nombreMax1: cadena20;
    nombreMax2: cadena20;

begin

    repeat
        leerAlumno(numeroInscripcion, apellido, nombre);

        actualizarMinimos(numeroInscripcion,apellido,min1,min2,apellidoMin1,apellidoMin2);
        actualizarMaximos(numeroInscripcion,nombre,max1,max2,nombreMax1,nombreMax2);

        if (numeroInscripcion mod 2 = 0) then  // puede ser una funcion
            contadorPares := contadorPares + 1;

        cantAlumnos := cantAlumnos + 1;
  
    until (numeroInscripcion = 1200);

    writeln('El primer alumno con numero de inscripcion mas chico es: ', apellidoMin1);
    writeln('El segundo alumno con numero de inscripcion mas chico es: ', apellidoMin2);
    writeln('El primer alumno con numero de inscripcion mas grande es: ', nombreMax1);
    writeln('El segundo alumno con numero de inscripcion mas grande es: ', nombreMax2);
    writeln('El porcentaje de alumnos con numero de inscripcion par es: ', (contadorPares / cantAlumnos) * 100:2:2);
    
end.