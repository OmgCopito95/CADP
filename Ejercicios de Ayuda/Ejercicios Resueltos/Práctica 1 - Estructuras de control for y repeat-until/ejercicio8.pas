{8. Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a) Modifique el ejercicio anterior para que además informe el día en el que se realizó la
mayor cantidad de ventas.}

program ejercicio8;

var
    dia, cantidad, max, diaMax: integer;
    monto, total: real;

begin

    // inicializo las variables
    cantidad := 0;
    total := 0;
    max := -9999;
    diaMax := 0;

    for dia := 1 to 31 do begin //cada vuelta de for representa 1 dia del mes
        writeln('Ingrese el monto');
        read(monto); //leo el primer monto del dia

        //leo la cantidad de ventas del dia hasta que aparezca 0
        while (monto <> 0) do begin
            total := total + monto;
            cantidad := cantidad + 1;

            writeln('Ingrese el monto');
            read(monto);
        end;

        //si sale del while significa que ya no hay montos para leer de ese dia
        //imprimo la cantidad de ventas y el monto total
        writeln('Para el dias ', dia, ' se vendieron ', cantidad, ' productos y un total de ', total);

        //calculo maximo de cantidad de ventas y el dia en el que se realizo
        if (cantidad > max) then begin
            max := cantidad;
            diaMax := dia;
        end;

        //inicializo las variables para la siguiente vuelta (que seria cuando cambia de dia)
        cantidad := 0;
        total := 0;

    end;

    //imprimo el dia en el que se realizo la mayor cantidad de ventas
    writeln('El dia en el que se realizo la mayor cantidad de ventas fue el ', diaMax, ' con ', max, ' ventas');

end.
