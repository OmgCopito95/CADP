program parcial;
const

type
    cadena20 = string[20];
    rangoCodigo = 1000..2500;

    viaje = record
      codigo: rangoCodigo;
      anio: integer;
      cantidadPasajeros: integer;
      ciudad: cadena20;
    end;


    lista = ^nodo;
    nodo = record
      dato: viaje;
      sig: lista;
    end;

    capacidadesAviones = array [rangoCodigo] of integer;

    contador = record
        cantViajes: integer;
        cantPasajeros: integer;
    end;

    vectorContador = array [rangoCodigo] of contador;

function avionPuntaCana(v: viaje; capacidadMaxima:integer): boolean;
begin
    avionPuntaCana:= (v.anio mod 10 = 0) and (v.ciudad = 'punta cana') and (v.cantidadPasajeros < capacidadMaxima);
end;

procedure agregarAdelante(var l: lista; v: viaje);
var
    aux: lista;
begin
    new(aux);
    aux^.dato:= v;
    aux^.sig:= l;
    l:= aux;
end;

procedure recorrerLista(l: lista; v: capacidadesAviones; var vContador: vectorContador; var listaPuntaCana: lista);
var

begin
    while (l <> nil) do begin //recorro la lista de viajes
        //informe el codigo del avion que realizo mayor cantidad de viajes
        vContador[l^.dato.codigo].cantViajes:= vContador[l^.dato.codigo].cantViajes + 1;

        //genere una lista con los viajes realizados en años multiplo de 10 con destino a "punta cana" en los que el avion no alcanzo su capacidad maxima
        if (avionPuntaCana(l^.dato, v[l^.dato.codigo])) then begin
            agregarAdelante(listaPuntaCana, l^.dato);
        end;

        //para cada avion, informe el promedio de pasajeros que viajaron entre todos sus viajes
        vContador[l^.dato.codigo].cantPasajeros:= vContador[l^.dato.codigo].cantPasajeros + l^.dato.cantidadPasajeros;

        l:= l^.sig;
    end;
end;
end;

procedure inicializarVectorContador(var v: vectorContador);
var
    i: integer;
begin
    for i:= 1000 to 2500 do begin
        v[i].cantViajes:= 0;
        v[i].cantPasajeros:= 0;
    end;
end;

procedure actualizarMaximo(cantViajes: integer; var max: integer; var codigoMaximo: integer; codigo: integer);
begin
    if (cantViajes > max) then begin
        max:= cantViajes;
        codigoMaximo:= codigo;
    end;
end;

procedure recorrerVectorContador(v: vectorContador);
var
    i: integer;
    max: integer;
    codigoMaximo: integer;
begin
    max:= -1;

    for i:= 1000 to 2500 do begin

        //informe codigo de avion que realizo mayor cantidad de viajes
        actualizarMaximo(v[i].cantViajes, maximo, codigoMaximo, i);

        if (v[i].cantViajes > 0) then begin
            writeln('El promedio de pasajeros que viajaron en el avion ', i, ' es de ', v[i].cantPasajeros / v[i].cantViajes);
        end;
    end;

    writeln('El avion que realizo mayor cantidad de viajes es el ', codigoMaximo);
end;

//PROGRAMA PRINCIPAL
var 
    listaViajes: lista;
    vectorCapacidades: capacidadesAviones;
    vectorContador: vectorContador;
    listaPuntaCana: lista;
begin
    listaViajes:= nil;
    listaPuntaCana:= nil;
    cargarLista(listaViajes); //se dispone
    cargarVector(vectorCapacidades); //se dispone

    inicializarVectorContador(vectorContador);
    recorrerLista(listaViajes, vectorCapacidades, vectorContador, listaPuntaCana);    

    recorrerVectorContador(vectorContador);
end.