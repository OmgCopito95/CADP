program registros;

type
    cadena10 = String[10];

    persona = record
      nombre: cadena10;
      apellido: cadena10;
      edad: integer;
      dni: integer;
      telefono: integer;
    end;

var
  p: persona;

begin
  writeln('Ingrese los datos de la persona');
  write('Ingrese nombre: ');
  readln(p.nombre);
  write('Ingrese apellido: ');
  readln(p.apellido);
  write('Ingrese edad: ');
  readln(p.edad);
  write('Ingrese dni: ');
  readln(p.dni);
  write('Ingrese telefono: ');
  readln(p.telefono);

  writeln('Se ha cargado la persona con exito. Estos son los datos:');

  with p do begin           //EL WITH EVITA TENER QUE ESCRIBIR LA VARIABLE PARA ACCEDER A CADA CAMPO DEL REGISTRO
    writeln('Nombre: ',nombre);
    writeln('Apellido: ',apellido);
    writeln('Edad: ',edad);
    writeln('Dni: ',dni);
    writeln('Telefono: ',telefono);
  end;
  readln;
end.

