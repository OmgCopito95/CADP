program ejercicio1;
{
  Un centro de deportes quiere procesar la información de los 4 tipos de actividades que ofrece: 1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre.
  Para ello, se debe leer y guardar el nombre de cada actividad y el precio mensual de cada una.
  Al finalizar, informar el promedio de cuota mensual.
}
{variables del programa principal}
var
  act1, act2, act3, act4: string;
  precio1, precio2, precio3, precio4, prom: real;
begin
  writeln('-- DATOS DE LAS ACTIVIDADES --');
  writeln;
  write('- Actividad 1: ');
  readln(act1);
  write('- Precio 1: ');
  readln(precio1);
  write('- Actividad 2: ');
  readln(act2);
  write('- Precio 2: ');
  readln(precio2);
  write('- Actividad 3: ');
  readln(act3);
  write('- Precio 3: ');
  readln(precio3);
  write('- Actividad 4: ');
  readln(act4);
  write('- Precio 4: ');
  readln(precio4);
  writeln;
  writeln('-- INFORME --');
  writeln;
  prom := (precio1 + precio2 + precio3 + precio4)/4;
  writeln('- El premedio mensual es: ', prom:4:0);
  writeln;
  writeln('-- Presione una tecla para finalizar --');
  readln;
end.
