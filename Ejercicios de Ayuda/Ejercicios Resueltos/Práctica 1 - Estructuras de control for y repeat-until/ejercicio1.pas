{1. Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5}

program ejercicio1;

var
    numero, suma, i: integer;
    cant_mayor5: integer;

begin

    suma := 0; //inicializo la variable suma en 0 porque es un contador
    cant_mayor5 := 0; //tambien es un contador

    for i:= 1 to 10 do begin // como se que son exactamente 10 numeros, uso un for

        writeln('Ingrese un numero: ');
        readln(numero);

        suma := suma + numero; //al valor de suma le sumo el valor de numero

        if numero > 5 then  //verifico si el numero es mayor a 5
            cant_mayor5 := cant_mayor5 + 1; //si es mayor a 5, sumo 1 a la variable cant_mayor5

    end;
    writeln('La suma total de los numeros es: ', suma);
end.

