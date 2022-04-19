{Implementar un programa que lea 200 artículos de una juguetería. 
De cada artículo se lee: código, descripción, año de fabricación, edad recomendada y precio. 
Informar la cantidad de artículos que superan el promedio de precios. 


}
program ejercicio1;
const fin = 200;
type rango = 2000..2020;
     edades = 0..18;
     cadena50 = string [50];
     articulo = record
                  cod: integer;
                  desc: cadena50;
                  anioF: rango;
                  edad: edades;
                  precio: real;
                end;
     articulos = array [1..fin] of articulo;
var v: articulos; prom: real;

procedure CargarJuguetes (var v: articulos; var prom: real);

  procedure LeerArticulo (var a: articulo);
  begin
    write ('Codigo: '); readln (a.cod);
    write ('Descripcion: '); readln (a.desc);
    write ('Anio de fabricacion: '); readln (a.anioF);
    write ('Edad: '); readln (a.edad);
    write ('Precio: '); readln (a.precio);
    writeln;
  end;
  
var i: integer; a: articulo; suma: real;
begin
  suma:= 0;
  For i:= 1 to fin do
  begin
    LeerArticulo (a); v[i] := a;      //LeerArticulo ( v[i] );
    suma:= suma + v[i].precio;
  end;
  prom:=  suma/fin;
end; 

procedure Informar (v: articulos; prom: real);
var cant, i: integer;
begin
  cant:= 0;
  for i:= 1 to fin do
    if (v[i].precio > prom) then cant:= cant+1;
  writeln ('Cantidad de articulos cuyo precio supera el promedio: ', cant);
end;   
    
begin
  CargarJuguetes (v, prom);
  Informar (v, prom);
end.
