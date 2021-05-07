{
Un centro de deportes quiere procesar la información de sus clientes y los 4 tipos de actividades que ofrece.
1 (Musculación), 2 (Spinning), 3 (Cross Fit) y 4 (Libre). 


Además, se debe leer para cada cliente el apellido y nombre, la edad y el número de actividad elegida (1..4). 
La lectura finaliza cuando llega el cliente con nombre AAA y apellido ZZZ.

Se pide, informar para cada cliente, su nombre, su apellido y el monto mensual a pagar. 

Se sabe que cada cliente elige una sola actividad.
}


program ejercicio1;
{variables del programa principal}
type cadena10 = string [10];
     rangoEdades = 12..100;
var
  act1, act2, act3, act4, act: integer;
  precio1, precio2, precio3, precio4, prom: real;
  nom, ape: cadena10;
  edad: rangoEdades;
  
begin
  Writeln ('Ingrese codigo actividad'); readln(act1); 
  writeln ('Ingrese precio'); read(precio1);
  Writeln ('Ingrese codigo actividad');read(act2); 
  writeln ('Ingrese precio');readln(precio2);
  Writeln ('Ingrese codigo actividad');readln(act3); 
  writeln ('Ingrese precio');readln(precio3);
  Writeln ('Ingrese codigo actividad');readln(act4); 
  writeln ('Ingrese precio');readln(precio4);
  writeln ('Ingresar nombre');
  readln (nom);
  writeln ('Ingresar apellido');
  readln (ape);
  while (nom <> 'AAA') or (ape <> 'ZZZ') do
  begin
     writeln ('Ingresar edad');
     readln (edad);
     writeln ('Ingresar actividad');
     readln (act);
     case act of
     1: writeln ('El cliente ', nom, ' ', ape, ' debe pagar ', precio1:2:2);
     2: writeln ('El cliente ', nom, ' ', ape, ' debe pagar ', precio2:2:2);
     3: writeln ('El cliente ', nom, ' ', ape, ' debe pagar ', precio3:2:2);
     4: writeln ('El cliente ', nom, ' ', ape, ' debe pagar ', precio4:2:2);
     else writeln ('Esa actividad no existe');
     end;
     writeln ('Ingresar nombre');
     readln (nom);
     writeln ('Ingresar apellido');
     readln (ape);
  end;
end.
