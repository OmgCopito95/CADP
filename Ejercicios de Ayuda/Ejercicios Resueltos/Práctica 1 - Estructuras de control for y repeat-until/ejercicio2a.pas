{a. Modifique el programa anterior para que, además de informar el mayor número leído, se
informe el número de orden, dentro de la secuencia, en el que fue leído. Por ejemplo, si se lee la
misma secuencia:
3 5 6 2 3 10 98 8 -12 9
deberá informar: “El mayor número leído fue el 98, en la posición 7”}

program ejercicio2a;

var
    numero, max, pos, i: integer;

begin
    max := -999; //inicializo el valor máximo en un numero muy bajo

    for i:= 1 to 10 do begin

        writeln('Ingrese un numero: ');
        readln(numero);

        if(numero > max) then begin //si el numero es mas grande que el mayor actual
            max:= numero; //actualizo el maximo
            pos:= i; //me guardo la posicion del numero
        end;

    end;

    writeln('El mayor numero es: ', max);
    writeln('El numero esta en la posicion: ', pos);

end.

