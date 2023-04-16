{7. a. Realizar un módulo que reciba como parámetro un número entero y retorne la cantidad de dígitos que
posee y la suma de los mismos.
b. Utilizando el módulo anterior, realizar un programa que lea una secuencia de números e imprima la
cantidad total de dígitos leídos. La lectura finaliza al leer un número cuyos dígitos suman exactamente 10, el
cual debe procesarse.}

program ejercicio7;


procedure procesamientoDeDigitos (numero:integer; var cantidadDeDigitos:integer; var sumaDeDigitos:integer);
// paso por referencia la cantidad de digitos y la suma de digitos para que se modifiquen en el programa principal
var
  digito:integer;
begin
    cantidadDeDigitos:=0; // inicializo los contadores en 0. lo puedo hacer acá o en el programa principal dentro del bucle
    sumaDeDigitos:=0;

    while (numero <> 0) do begin // hago el bucle hasta que el numero sea 0, es decir, termine de procesar todos los digitos
        digito:= numero mod 10; // obtengo el digito ej: 1234 -> 4
        cantidadDeDigitos:=cantidadDeDigitos+1; // sumo 1 al contador de digitos
        sumaDeDigitos:=sumaDeDigitos+digito; // sumo el valor del digito a la variable que suma
        numero:=numero div 10; // elimino el digito procesado del numero ej: 1234 -> 123 
    end;
end;

var
  numero:integer; // numero que se lee
  cantDigitos: integer; // cantidad de digitos del numero. lo paso por referencia al procedimiento
  cantTotalDigitos:integer; // cantidad total de digitos leidos. lo uso para imprimir el resultado
  sumaDigitos:integer; // suma de los digitos del numero. lo paso por referencia al procedimiento
begin

    cantTotalDigitos:=0; // inicializo la variable que cuenta la cantidad total de digitos en 0

    repeat // como el enunciado dice que el corte debe procesarse, entonces uso un repeat until

        readln(numero); // leo el numero
        procesamientoDeDigitos(numero, cantDigitos, sumaDigitos); // llamo al procedimiento

        // me pide imprimir la cantidad total de digitos leidos, entonces sumo la cantidad de digitos de cada numero
        cantTotalDigitos := cantTotalDigitos + cantDigitos;
        
    until (sumaDigitos = 10); // itero hasta que la suma de digitos de algun numero me de 10

    writeln('La cantidad total de digitos leidos es: ', cantTotalDigitos);
end.


