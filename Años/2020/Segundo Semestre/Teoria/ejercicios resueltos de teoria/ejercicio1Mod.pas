{
Un centro de deportes quiere procesar la información de sus clientes y de los 4 tipos de actividades que ofrece: 
1 (Musculación),  2 (Spinning),  3 (Cross Fit) y 4 (Libre). 
Para ello, se debe leer y guardar el precio mensual de cada actividad. 
Además, se debe leer para cada cliente el apellido y nombre, DNI, edad y el número de actividad elegida (1..4). 
La lectura finaliza cuando se procesa el cliente con edad 20 y actividad 3. Se sabe que cada cliente elige una sola actividad.

Se pide informar:  
a-Para cada cliente, el monto a pagar. 
b-Para cada actividad la cantidad de clientes que la realiza.
c-La cantidad de clientes para los cuales la suma de los dígitos pares de su 
DNI es igual a la suma de los dígitos impares.

Modularizar su solución.

}
program ejercicio1;
{tipos de datos definidos por el usuario}
type
  cadena50 = string[50];
  rango_act = 1..4;
  rango_edad = 14..90;

{procesos y funciones}
procedure cargar_precios(var p1, p2, p3, p4: real);
begin
  write ('Precio actividad 1: ');
  readln (p1);
  write ('Precio actividad 2: ');
  readln (p2);
  write ('Precio actividad 3: ');
  readln (p3);
  write ('Precio actividad 4: ');
  readln (p4); 
end;

procedure leer_cliente(var ape_nom: cadena50; var edad: rango_edad; var act: rango_act; var dni: integer);
begin
  write ('Nombre y apellido: ');
  readln (ape_nom);
  write ('Edad: ');
  readln (edad);
  write ('Actividad: ');
  readln (act);
  write ('DNI: ');
  readln (dni);
end;

procedure inicializar (var cont, cont1, cont2, cont3, cont4: integer); 
begin
  cont:= 0;
  cont1:= 0;
  cont2:= 0;
  cont3:= 0;
  cont4:= 0;
end;

procedure Imprimir (cont, cont1, cont2, cont3, cont4: integer);
begin
  writeln;
  writeln ('Cantidad de clientes con suma pares e impares igual en DNI: ', cont);
  writeln ('Cantidad de clientes en actividad 1: ', cont1);
  writeln ('Cantidad de clientes en actividad 2: ', cont2);
  writeln ('Cantidad de clientes en actividad 3: ', cont3);
  writeln ('Cantidad de clientes en actividad 4: ', cont4);
end;

function cumpleDNI (num: integer): boolean;
var sumaP, sumaI, digito: integer;
begin
  sumaP:= 0;
  sumaI:= 0;
  while (num <> 0) do  // num -> 6423  -> 642 -> 64 -> 6 -> 0
  begin
    digito:=num mod 10; // digito -> 3 -> 2 -> 4 -> 6
    if (digito mod 2 = 0) then sumaP:= sumaP + digito   // sumaP->0 -> 2 -> 6 -> 12
                          else sumaI:= sumaI + digito;  // sumaI->0 -> 3
    num:=num div 10;
  end;
  cumpleDNI:= (sumaP = sumaI);
end;

{variables del programa principal}
var
  {datos de actividades}
  precio1, precio2, precio3, precio4: real;
  {datos del cliente}
  ape_nom: cadena50;
  edad: rango_edad;
  act: rango_act;
  cont, cont1, cont2, cont3, cont4, dni: integer;
begin
  writeln('-- DATOS DE LAS ACTIVIDADES --');
  writeln;
  cargar_precios(precio1, precio2, precio3, precio4);
  inicializar (cont, cont1, cont2, cont3, cont4);
  writeln;
  writeln('-- DATOS DE CLIENTES --');
  writeln;
  repeat
    leer_cliente(ape_nom, edad, act, dni);
    if ( cumpleDNI (dni) ) then cont:=cont+1;
    writeln;
    CASE act OF
      1: begin
           writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio1:2:2);
           cont1:= cont1 + 1;
         end;
      2: begin
           writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio2:2:2);
           cont2:= cont2 + 1;
         end;  
      3: begin
           writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio3:2:2);
           cont3:= cont3 + 1;
         end;
      4: begin
           writeln('Cliente: ',ape_nom, ' cuota mensual: ', precio4:2:2);
           cont4:= cont4 + 1;
         end;
      ELSE
        writeln('La actividad elegida no existe.');
    END;
    writeln;
  until (edad =20) and (act = 3); 
  Imprimir (cont, cont1, cont2, cont3, cont4); 
end.
