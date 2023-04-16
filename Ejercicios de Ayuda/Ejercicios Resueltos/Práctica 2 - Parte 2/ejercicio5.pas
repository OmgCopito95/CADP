{5. a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program ejercicio5;

function esDoble(numA,numB:integer):boolean; // es una funcion porque devuelve un tipo de dato simple
begin
    esDoble:=numB=numA*2; // si numB es el doble de numA, entonces esDoble devuelve true, sino false
end;

var // variables locales al programa principal
    numA,numB:integer;
    cantPares,cantDobles:integer;

begin

    cantPares:=0; // inicializo los contadores en 0
    cantDobles:=0;

    writeln('Ingrese un par de numeros (numA,numB): ');
    readln(numA); // leo el primer par de numeros
    readln(numB); 

    while (numA<>0) and (numB<>0) do begin // mientras no se ingrese el par (0,0)
        cantPares:=cantPares+1; // incremento el contador de pares leidos

        if esDoble(numA,numB) then // si la funcion me devuelve true, entonces numB es el doble de numA
            cantDobles:=cantDobles+1; // incremento el contador de pares en los que numB es el doble de numA

        writeln('Ingrese un par de numeros (numA,numB): '); // leo el siguiente par de numeros
        readln(numA);
        readln(numB);
    end;

    writeln('Cantidad de pares leidos: ',cantPares); // imprimo los resultados luego de haber finalizado todo el procesamiento de los datos
    writeln('Cantidad de pares en los que numB es el doble de numA: ',cantDobles);

end.