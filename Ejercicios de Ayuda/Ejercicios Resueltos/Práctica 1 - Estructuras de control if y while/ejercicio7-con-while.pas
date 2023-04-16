// OPCION 2 (CON WHILE)

{
Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un almacén. 
La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.  
Para cada producto leido, el programa deberá indicar si el nuevo precio del producto supera 
en un 10% al precio anterior. Por ejemplo:
-Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el aumento de precio del producto 10382 no supera el 10%”
-Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el aumento de precio del producto 32767 es superior al 10%”
}

program SensacionDeInflacion;
const
   ultimo_producto = 37817;
var
  producto : integer;
  precio_viejo, precio_nuevo : real;
begin
  producto := -1;
  while (producto <> ultimo_producto) do
  begin
    readln(producto);
    readln(precio_viejo);
    readln(precio_nuevo);
    if (precio_viejo * 1.1 < precio_nuevo) then
       writeln('El aumento de precio del producto ',producto, ' es superior al 10%')
    else
      writeln('El aumento de precio del producto ',producto, ' no supera el 10%');
  end; { fin del while }
end.

//Otras formas de calcular si el aumento fue superior al 10%:
{
if (precio_nuevo*100/precio_viejo - 100  > 10) then

if (precio_nuevo/precio_viejo > 1.1) then

if ((precio_nuevo - precio_viejo) > precio_viejo* 0.1) then
} 
 