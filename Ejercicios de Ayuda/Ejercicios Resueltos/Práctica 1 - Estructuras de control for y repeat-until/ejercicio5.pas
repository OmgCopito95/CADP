{5. Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}

program ejercicio5;

var
    numero: integer;
    max, min, suma: integer;

begin
    //inicializo variables
    max := -9999;
    min := 9999;
    suma := 0;

    //leo hasta que ingrese el numero 100
    repeat
        write('Ingrese un numero: ');
        readln(numero);

        //si el numero ingresado es mayor que el maximo, lo actualizo
        if numero > max then
            max := numero;

        //si el numero ingresado es menor que el minimo, lo actualizo
        if numero < min then
            min := numero;

        //sumo el numero ingresado
        suma := suma + numero;

    until numero = 100;

    //muestro los resultados
    writeln('El numero maximo es: ', max);
    writeln('El numero minimo es: ', min);
    writeln('La suma total es: ', suma);

end.

