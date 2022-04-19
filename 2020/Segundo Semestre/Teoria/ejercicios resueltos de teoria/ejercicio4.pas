program ejercicio4;
{
 Un centro de deportes quiere procesar la información de sus clientes y de los 4 tipos de actividades que ofrece: 1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre.
 Para ello, Para ello, se debe leer y guardar el precio mensual de cada actividad.
 Además, se debe leer para cada cliente el apellido y nombre, la edad y un número de actividad (1..4).
 La lectura finaliza cuando llega el cliente con nombre y apellido 'ZZZ'.
 Se pide, informar para cada cliente, el monto a pagar.
 Se sabe que cada cliente elige una sola actividad.
 Modularizar su solución.
}

{tipos de datos definidos por el usuario}
type
  cadena = string[50];
  rango_act = 1..4;
  rango_edad = 14..90;

{procesos y funciones}
procedure cargar_precios(var p1, p2, p3, p4: real);
begin
  write('- Precio 1: ');
  readln(p1);
  write('- Precio 2: ');
  readln(p2);
  write('- Precio 3: ');
  readln(p3);
  write('- Precio 4: ');
  readln(p4);
end;

procedure leer_cliente(var ape_nom: cadena; var edad: rango_edad; var act: rango_act);
begin
  write('- Apellido y Nombre: ');
  readln(ape_nom);
  IF (ape_nom <> 'ZZZ') THEN BEGIN
    write('- Edad: ');
    readln(edad);
    write('- Actividad elegida: ');
    readln(act);
  END;
end;
  

{variables del programa principal}
var
  {datos de actividades}
  precio1, precio2, precio3, precio4: real;
  {datos del cliente}
  ape_nom: cadena;
  edad: rango_edad;
  act: rango_act;
begin
  writeln('-- DATOS DE LAS ACTIVIDADES --');
  writeln;
  cargar_precios(precio1, precio2, precio3, precio4);
  writeln;
  writeln('-- DATOS DE CLIENTES --');
  writeln;
  leer_cliente(ape_nom, edad, act);
  WHILE (ape_nom <> 'ZZZ') DO BEGIN
    writeln;
    CASE act OF
      1: writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio1:3:0);
      2: writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio2:3:0);
      3: writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio3:3:0);
      4: writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio4:3:0);
      ELSE
        writeln('La actividad elegida no existe.');
    END;
    writeln;
    leer_cliente(ape_nom, edad, act);
  END;
  writeln;
  writeln('-- Presione una tecla para finalizar --');
  readln;
end.
