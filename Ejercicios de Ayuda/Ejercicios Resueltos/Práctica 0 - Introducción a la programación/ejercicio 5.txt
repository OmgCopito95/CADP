// EJERCICIO 5 PRACTICA 0

{
Un kiosquero debe vender una cantidad X de caramelos entre Y clientes, dividiendo
cantidades iguales entre todos los clientes. Los que le sobren se los quedará para él.
a. Realice un programa que lea la cantidad de caramelos que posee el kiosquero (X),
la cantidad de clientes (Y), e imprima en pantalla un mensaje informando la
cantidad de caramelos que le corresponderá a cada cliente, y la cantidad de
caramelos que se quedará para sí mismo.
b. Si cada caramelo tiene un valor de $1.60, imprima en pantalla el dinero que deberá
cobrar el kiosquero
}

program ejercicio5;
const
     valor_caramelo = 1.60;
var
   cant_clientes, cant_caramelos : integer;
   caramelos_por_cliente, caramelos_restantes : integer;
   monto : real;
begin
     writeln('Ingrese la cantidad de clientes: ');
     readln(cant_clientes);
     writeln('Ingrese la cantidad de caramelos');
     readln(cant_caramelos);
     caramelos_por_cliente := cant_caramelos DIV cant_clientes;
     caramelos_restantes := cant_caramelos MOD cant_clientes;
     writeln('A cada cliente le tocan ',caramelos_por_cliente,' caramelos, y al kiosquero le quedan ',caramelos_restantes, ' caramelos retantes');
     monto := caramelos_por_cliente * cant_clientes * valor_caramelo;
     writeln('El kiosquero recibira ',monto:4:2, ' pesos por las ventas de caramelos');
     readln;
end.     