{2. Realice un programa que lea 10 números e informe cuál fue el mayor número leído. Por ejemplo, si
se lee la secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98”}

program ejercicio2;
var
    numero, max, i: integer;

begin
    max := -999; //inicializo la variable en un numero muy chico

    for i := 1 to 10 do begin

        write('Ingrese un numero: ');
        readln(numero);

        if numero > max then //si el numero es mayor, entonces actualizo
            max := numero;

    end;

    writeln('El numero mayor es: ', max); //en la variable max se encuentra guardado el numero mas grande
end.

