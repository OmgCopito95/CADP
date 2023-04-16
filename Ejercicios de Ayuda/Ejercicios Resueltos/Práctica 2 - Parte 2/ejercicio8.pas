{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program ejercicio8;

var
    numero, sumaPares, cantImpares: integer;


procedure procesarNumero(numero: integer; var sumaPares, cantImpares: integer); //paso por referencia las dos variables que quiero que se modifiquen en el programa principal
var

begin
    while(numero<>0)do begin

        digito:= numero mod 10; //obtengo el digito
        if (digito mod 2 = 0) then begin //si es par
            sumaPares := sumaPares + digito; //sumo el digito a la suma de pares
        end
        else  //si es impar
            cantImpares := cantImpares + 1; //sumo 1 a la cantidad de impares
    end;

end;

begin
    readln(numero); //leo el primer numero
    while (numero <> 12345) do begin // el corte es cuando llega el 12345 y como no debe procesarse uso un while
        sumaPares := 0; //inicializo las variables por cada numero procesado
        cantImpares := 0;

        procesarNumero(numero, sumaPares, cantImpares);
        readln(numero); //leo el siguiente numero

        writeln('La suma de los digitos pares es: ', sumaPares); //muestro los resultados por cada numero procesado
        writeln('La cantidad de digitos impares es: ', cantImpares);
    end;

    
end.