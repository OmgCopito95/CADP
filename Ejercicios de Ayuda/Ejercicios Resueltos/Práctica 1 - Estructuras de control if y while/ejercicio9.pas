{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: -6 (-4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

Program ejercicio9;

var
    caracter:char;
    numero:integer;
    suma:integer;
    resta:integer;

begin
    writeln('Ingrese un caracter');
    readln(caracter);
    readln(numero);
    if (caracter = '+') then
    begin
        suma := 0;
        while (numero <> 0) do
        begin
            suma := suma + numero;
            readln(numero);
        end;
        writeln('La suma es: ', suma)
    end
    else if (caracter = '-') then
    begin
        resta := 0;
        while (numero <> 0) do
        begin
            resta := resta - numero;
            readln(numero);
        end;
        writeln('La resta es: ', resta)
    end
    else
    begin
        writeln('Error');
    end;
    readln; //para que no se cierre el programa
end.
