{7. Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program ejercicio7;

var
    nombre, nombreMin1, nombreMin2, nombreMax1, nombreMax2: string[20];
    tiempo, tiempoMin1, tiempoMin2, tiempoMax1, tiempoMax2, i: integer;

begin

    //inicializo variables
    nombreMin1 := ' ';
    nombreMin2 := ' ';
    nombreMax1 := ' ';
    nombreMax2 := ' ';
    tiempoMin1 := 9999;
    tiempoMin2 := 9999;
    tiempoMax1 := -9999;
    tiempoMax2 := -9999;


    //pido datos
    for i := 1 to 100 do begin

        //leo datos
        write('Ingrese el nombre del piloto: ');
        readln(nombre);
        write('Ingrese el tiempo que tomó finalizar la carrera: ');
        readln(tiempo);

        //calculo 2 minimos - son los que tardaron menos
        if (tiempo < tiempoMin1) then begin
            tiempoMin2 := tiempoMin1;
            tiempoMin1 := tiempo;
            nombreMin2 := nombreMin1;
            nombreMin1 := nombre;
        end
        else if (tiempo < tiempoMin2) then begin
            tiempoMin2 := tiempo;
            nombreMin2 := nombre;
        end;

        //calculo 2 maximos - son los que tardaron mas
        if (tiempo > tiempoMax1) then begin
            tiempoMax2 := tiempoMax1;
            tiempoMax1 := tiempo;
            nombreMax2 := nombreMax1;
            nombreMax1 := nombre;
        end
        else if (tiempo > tiempoMax2) then begin
            tiempoMax2 := tiempo;
            nombreMax2 := nombre;
        end;

    end;

    //muestro resultados
    writeln('Los nombres de los dos pilotos que finalizaron en los dos primeros puestos son: ');
    writeln(nombreMin1, ' y ', nombreMin2);
    writeln('Los nombres de los dos pilotos que finalizaron en los dos últimos puestos son: ');
    writeln(nombreMax1, ' y ', nombreMax2);

end.
