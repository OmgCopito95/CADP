{4. Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.}

program ejercicio4a;

var
    numero, min1, min2: integer;
    i: integer;

begin

    min1 := 9999; //inicializo los minimos en numeros muy grandes
    min2 := 9999;

    repeat
        readln(numero);

        if (numero < min1) then begin //paso 1. si el numero es menor a min1
            min2 := min1; //min2 ahora es el valor de min1
            min1 := numero; //actualizo min1
        end
        else
            if (numero < min2) then begin //paso 2. si el numero es menor a min2
                min2 := numero; //actualizo min2
            end;
    until (numero = 0);

    writeln('El numero minimo es: ', min1);
    writeln('El numero minimo2 es: ', min2);
end.

