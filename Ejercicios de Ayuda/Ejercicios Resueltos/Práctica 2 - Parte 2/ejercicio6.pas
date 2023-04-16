{6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}

program ejercicio6;

const
    CANTPRODUCTOS = 100; // uso una constante para que el programa sea mas facil de modificar a futuro

type
    cadena20 = string[20];

procedure leerProducto(var precio:real; var codigo:integer; var tipo:cadena20); // paso por referencia los parametros porque quiero que se modifiquen en el programa principal
begin
    writeln('Ingrese el precio del producto');
    readln(precio);
    writeln('Ingrese el codigo del producto');
    readln(codigo);
    writeln('Ingrese el tipo del producto');
    readln(tipo);
end;

// paso por referencia todas las variables min porque quiero que se vayan modificando en el programa principal
procedure actualizarMinimos(precio:real; codigo:integer; var min1:real; var min2:real; var min_cod1:integer; var min_cod2:integer);
begin
    if (precio < min1) then begin // primero verifico con el primer min
        min2:=min1; // guardo el valor del primer minimo en el segundo
        min_cod2:=min_cod1; // guardo el codigo del primer minimo en el segundo
        min1:=precio; // guardo el nuevo minimo
        min_cod1:=codigo; // guardo el codigo del nuevo minimo
    end
    else if (precio < min2) then begin // si no es menor al primer minimo, verifico si es menor al segundo
        min2:=precio; // guardo el nuevo minimo
        min_cod2:=codigo; // guardo el codigo del nuevo minimo
    end;
end;

end;

procedure actualizarMaximoPantalon(precio:real; codigo:integer; tipo:cadena20; var maxPantalon:integer; var max_codPantalon:integer);
begin
    if (tipo = 'pantalon') then begin // verifico si el tipo es pantalon
        if (precio > maxPantalon) then begin // verifico si el precio es mayor al maximo
            maxPantalon:=precio; // guardo el nuevo maximo
            max_codPantalon:=codigo; // guardo el codigo del nuevo maximo
        end;
    end;
end;

var
    precio:real;
    codigo:integer;
    tipo:cadena20;
    i:integer;
    min1:real;
    min2:real;
    maxPantalon:integer;
    min_cod1:integer;
    min_cod2:integer;
    max_codPantalon:integer;
    suma:real;

begin

    min1:=9999; // inicializo los minimos en 9999 para que se actualicen en la primera iteracion
    min2:=9999;
    maxPantalon:=-1; // inicializo el maximo en -1 para que se actualice en la primera iteracion
    suma:=0; // inicializo el contador en 0 para ir sumando los precios

    for i:=1 to CANTPRODUCTOS do begin

        leerProducto(precio, codigo, tipo); // leo un producto y lo guardo en las variables

        // Código de los dos productos más baratos
        actualizarMinimos(precio, codigo, min1, min2, min_cod1, min_cod2);

        // Código del producto de tipo “pantalón” más caro
        actualizarMaximoPantalon(precio, codigo, tipo, maxPantalon, max_codPantalon);

        // Precio promedio
        suma:=suma+precio;

    end;

    writeln('El codigo del producto mas barato es: ', min_cod1); // muestro el codigo del primer minimo, no muestro el min
    writeln('El codigo del segundo producto mas barato es: ', min_cod2);

    writeln('El codigo del pantalon mas caro es: ', max_codPantalon);

    writeln('El precio promedio es: ', suma/CANTPRODUCTOS);


end.