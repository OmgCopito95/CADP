program Registros;
type
    str20 = string[20];
    alumno = record
        codigo : integer;
        nombre : str20;
        promedio : real;
    end;

procedure leer(var alu : alumno);
begin
    writeln('Ingrese el código del alumno');
    read(alu.codigo);
    if (alu.codigo <> 0) then begin
        writeln('Ingrese el nombre del alumno'); read(alu.nombre);
        writeln('Ingrese el promedio del alumno'); read(alu.promedio);
    end;
end;

procedure actualizarMejorPromedio(alu : alumno; var mejorPromedio : real; var nombreMejorPromedio : str20);
begin
    if (alu.promedio > mejorPromedio) then begin
        nombreMejorPromedio := alu.nombre;
        mejorPromedio := alu.promedio;
    end;
end;

{ declaración de variables del programa principal }
var
    a : alumno;
    mejorPromedio : real;
    nombreMejorPromedio : str20;

{ cuerpo del programa principal }
begin
    mejorPromedio := -999;
    leer(a);
    while (a.codigo <> 0) do begin
        //cantidad de alumnos leidos
        cantAlumnos := cantAlumnos + 1;

        //actualizo mejor promedio
        actualizarMejorPromedio(a, mejorPromedio, nombreMejorPromedio);

        leer(a);
    end;
    writeln('El alumno con mejor promedio es: ', nombreMejorPromedio);
end.