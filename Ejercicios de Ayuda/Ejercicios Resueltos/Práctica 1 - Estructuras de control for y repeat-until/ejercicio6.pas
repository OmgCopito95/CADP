{6. Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program ejercicio6;

const
    PRECIO_CONDICION = 16;

var
    codigo: 1..200;
    codigoMin1, codigoMin2, cantidad, i: integer;
    precio, precioMin1, precioMin2: real;

begin

    // inicializo variables
    precioMin1 := 9999;
    precioMin2 := 9999;
    codigoMin1 := 9999;
    codigoMin2 := 9999;
    cantidad := 0; // es un contador

    // leo datos
    for i := 1 to 200 do begin
        readln(precio);
        readln(codigo);

        if precio < precioMin1 then // si el precio es menor que el precioMin1
        begin
            precioMin2 := precioMin1; // el precioMin2 pasa a ser el precioMin1
            precioMin1 := precio; // actualizo el precio
            codigoMin2 := codigoMin1; // el codigoMin2 pasa a ser el codigoMin1
            codigoMin1 := codigo; // actualizo el codigo
        end
        else if precio < precioMin2 then // si el precio es menor que el precioMin2
        begin
            precioMin2 := precio; // actualizo el precio 2
            codigoMin2 := codigo; // actualizo el codigo 2
        end;

        if (codigo mod 2 = 0) and (precio > PRECIO_CONDICION) then // si el codigo es par y el precio es mayor a 16
            cantidad := cantidad + 1; // incremento cantidad
    end;

    // muestro resultados
    writeln('Producto más barato: ', codigoMin1, ' con precio: ', precioMin1:0:2);
    writeln('Producto más barato: ', codigoMin2, ' con precio: ', precioMin2:0:2);
    writeln('Cantidad de productos con precio mayor a 16 pesos y código par: ', cantidad);

end.
