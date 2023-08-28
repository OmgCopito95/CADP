{
Se lee desde  teclado información de los autos existentes en una concesionaria. 
De cada auto se lee: patente, número de chasis, año y precio. 
La lectura finaliza cuando llega un auto con precio 5000 o con año 2020, el cual no debe ser procesado. 

Informar:

a. Las patentes cuyos números de chasis contengan exactamente 3 dígitos 8.
b. El promedio de autos con menos de 5 años de antigüedad.
c. Las patentes y precios de los dos autos de valor mas bajo.

Modularizar su solución.
}
program ejercicio2;
const anioActual = 2020;
type cadena7 = string [7];
     rango = 1960..2020;
     
procedure LeerAuto (var patente: cadena7; var chasis: integer; var anio: rango; var precio:real);

begin
  writeln ('Anio: ');
  readln (anio);
  if (anio <> 2020)
  then begin
         writeln ('Precio: ');
         readln (precio);
         if (precio <> 5000)
         then begin 
                writeln ('Patente: ');
                readln (patente);
                writeln ('Chasis: ');
                readln (chasis);
                writeln;
              end;
       end;
end;
function hola: string;
begin
end;
function cumple888 (num: integer): boolean;
var cont, digito: integer;
begin
  cont:= 0;
  while (num <> 0) and (cont <= 3) do  // num -> 12818888 
  begin
    digito:=num mod 10; // digito -> 8 -> 8 -> 8 -> 8
    if (digito = 8) then cont:= cont + 1;   // cont-> 0 -> 1 -> 2 -> 3 -> 4 
    num:=num div 10;
  end;
  cumple888:= (cont=3);
end;

procedure dosMinimos (var min1, min2: real; var pat1, pat2: cadena7; precio: real; patente: cadena7);
begin
  if (precio < min1)
  then begin
         min2:=min1;
         pat2:=pat1;
         min1:=precio;
         pat1:= patente
       end
  else if(precio < min2)
       then begin
              min2:= precio;
              pat2:=patente;
            end;
end;

procedure Informar (prom, min1, min2: real; pat1, pat2: cadena7);
begin
  writeln;
  writeln ('Promedio de autos con menos de 5 anios: ', prom:2:2);
  writeln ('Auto 1 patente: ', pat1, ' precio: ', min1:2:2);
  writeln ('Auto 2 patente: ', pat2, ' precio: ', min2:2:2);
end;

var pat1, pat2, patente: cadena7;
    contAutos, contMenos5, chasis: integer;
    anio: rango;
    min1, min2, precio: real;
    
begin
  contAutos:= 0;
  contMenos5:= 0;
  min1:= 9999;
  LeerAuto (patente, chasis, anio, precio); 
  while (anio <> 2020) and (precio <> 5000) do
  begin
    contAutos:= contAutos + 1;
    if (cumple888 (chasis)) 
    then begin
           writeln ('El auto con patente ', patente, ' tiene el chasis con exactamente 3 digitos 8');
           writeln;
         end;
    if (anioActual - anio < 5) then contMenos5:= contMenos5 + 1;
    dosMinimos (min1, min2, pat1, pat2, precio, patente);
    LeerAuto (patente, chasis, anio, precio); 
  end;
  if (contAutos = 0) then writeln ('La concesionaria no tiene autos')
                     else Informar (contMenos5/contAutos, min1, min2, pat1, pat2);
end.
