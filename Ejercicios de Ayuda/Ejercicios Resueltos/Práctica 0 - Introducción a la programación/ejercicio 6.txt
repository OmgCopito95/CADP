// EJERCICIO 6 PRACTICA 0

{
Realice un programa que informe el valor total en pesos de una transacción en dólares.
Para ello, el programa debe leer el monto total en dólares de la transacción, el valor del
dólar al día de la fecha y el porcentaje (en pesos) de la comisión que cobra el banco por la
transacción. Por ejemplo, si la transacción se realiza por 10 dólares, el dólar tiene un valor
20,54 pesos y el banco cobra un 4% de comisión, entonces el programa deberá informar:
La transacción será de 213,61 pesos argentinos
(resultado de multiplicar 10*20,54 y adicionarle el 4%)
}

program ejercicio6;
var
   monto, dolar, porcentaje : real;

begin
     writeln('Ingrese el monto total en dolares de la transaccion');
     readln(monto);
     writeln('Ingrese el valor del dolar');
     readln(dolar);
     writeln('Ingrese comision en porcentaje que cobra el banco');
     readln(porcentaje);
     porcentaje:=(porcentaje/100)+1; // PARA APLICARLE UN PORCENTAJE, SUMO UNO
     writeln('La transaccion sera ', (monto*dolar*porcentaje):4:2, ' pesos argentinos.');
     readln;
end.         