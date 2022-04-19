program ejercicio2;
{
 Un centro de deportes quiere procesar la información de sus clientes y los 4 tipos de actividades que ofrece: 1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre.
 Para ello, se debe leer y guardar el precio mensual de cada actividad.
 Además, se debe leer para cada cliente el DNI y el número de actividad elegida.
 La lectura finaliza cuando llega el DNI 0. Se pide, informar para cada cliente, el monto mensual a pagar.
 Se sabe que cada cliente elige una sola actividad.
}
{variables del programa principal}
var
  {datos de actividades}
  precio1, precio2, precio3, precio4: real;
  {datos del cliente}
  dni, act: integer;
begin
  writeln('-- DATOS DE LAS ACTIVIDADES --');
  writeln;
  write('- Precio 1: ');
  readln(precio1);
  write('- Precio 2: ');
  readln(precio2);
  write('- Precio 3: ');
  readln(precio3);
  write('- Precio 4: ');
  readln(precio4);
  writeln;
  writeln('-- DATOS DE CLIENTES --');
  writeln;
  write('- DNI: ');
  readln(dni);
  WHILE (dni <> 0) DO BEGIN
    write('- Actividad elegida: ');
    readln(act);
    writeln;
    CASE act OF
      1: writeln('DNI: ',dni, ' cuota mensual: ', precio1:3:0);
      2: writeln('DNI: ',dni, ' cuota mensual: ', precio2:3:0);
      3: writeln('DNI: ',dni, ' cuota mensual: ', precio3:3:0);
      4: writeln('DNI: ',dni, ' cuota mensual: ', precio4:3:0);
      ELSE
        writeln('La actividad elegida no existe.');
    END;
    writeln;
    write('- DNI: ');
    readln(dni);
  END;
  writeln;
  writeln('-- Presione una tecla para finalizar --');
  readln;
end.
