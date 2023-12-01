// TEMA 1
// "Un salón de eventos necesita un programa para administrar la información de las reservas de diciembre de 2023. 
// Se dispone de una estructura con la información de las reservas. De cada reserva se conoce: número de reserva, 
// DNI del cliente, día del evento (1..31), hora de inicio, hora de fin y categoría de servicio (1..4). 
// Además, se dispone de una tabla con el precio por hora de reserva de acuerdo a cada categoría de servicio.

// Se pide:

// A) Generar una nueva estructura con número y precio total de cada reserva. Esta estructura debe generarse 
// ordenada por número de reserva.
// B) Informar los dos días del mes con mayor cantidad de reservas de clientes con DNI par.
// C) Informar el porcentaje de reservas de eventos que inicien antes de las 12 hs y se produzcan en la primera quincena.

program Tema1;
type

    rangoDias = 1..31;
    rangoCategorias = 1..4;

    reserva = record
        numeroReserva : integer;
        dni : integer;
        dia : rangoDias;
        horaInicio : integer;
        horaFin : integer;
        categoria : rangoCategorias;
    end;

    precio = array [rangoCategorias] of real;

    reservaTotal = record
        numeroReserva : integer;
        precioTotal : real;
    end;

    lista2 = ^nodo2; // lista nueva que se debe generar en el punto A
    nodo2 = record
        dato : reservaTotal;
        sig : lista;
    end;

    lista = ^nodo; // lista de reservas que se dispone 
    nodo = record
        dato : reserva;
        sig : lista;
    end;

    // vector de 31 posiciones, cada posicion representa un dia del mes
    vectorDias = array [rangoDias] of integer;

procedure inicializarVectorDias(var v:vectorDias);
var
    i:integer;
begin
    for i:=1 to 31 do
        v[i]:=0;
end;

procedure recorrerListaReservas(listaReserva:lista; var listaNueva:lista2; vPrecios:precio; var vDias:vectorDias; var porcentajeReservasAntes12:real; var dia1,dia2:integer);
var
    horas:integer;
    precioTotal:real;
    registroNuevo: reservaTotal;
    cantidadReservasAntes12:integer;
    cantidadTotalReservas:integer;
    

begin
    cantidadReservasAntes12:=0;
    cantidadTotalReservas:=0;

    while (listaReserva <> nil) do begin // cada iteracion de la lista, representa una reserva
        //A. Generar una nueva estructura con número y precio total de cada reserva. Esta estructura debe generarse ordenada por número de reserva.

        //para calcular el precio total de la reserva, se debe multiplicar la cantidad de horas por el precio de la categoria que está en el vector de precios
        registroNuevo.horas := listaReserva^.dato.horaFin - listaReserva^.dato.horaInicio; // calculo la cantidad de horas de la reserva 
        registroNuevo.precioTotal := horas * vPrecios[listaReserva^.dato.categoria]; // calculo el precio total de la reserva
        insertarOrdenado(listaNueva,registroNuevo); // inserto ordenado por numero de reserva

        //B. Informar los dos días del mes con mayor cantidad de reservas de clientes con DNI par.
        if (listaReserva^.dato.dni mod 2 = 0) then // si el dni es par
            vDias[listaReserva^.dato.dia]:=vDias[listaReserva^.dato.dia]+1; // sumo 1 en la posicion del vector que representa el dia de la reserva

        //C. Informar el porcentaje de reservas de eventos que inicien antes de las 12 hs y se produzcan en la primera quincena.
        if (listaReserva^.dato.horaInicio < 12) and (listaReserva^.dato.dia <= 15) then // si la reserva inicia antes de las 12 y se produce en la primera quincena
            cantidadReservasAntes12 := cantidadReservasAntes12 + 1; 

        cantidadTotalReservas := cantidadTotalReservas + 1; // cuento la cantidad total de reservas

        listaReserva:=listaReserva^.sig; // avanzo en la lista
    end;

    porcentajeReservasAntes12 := (cantidadReservasAntes12 * 100) / cantidadTotalReservas; // calculo el porcentaje 

    calcularMaximos(vDias,dia1,dia2); // calculo los dos dias con mayor cantidad de reservas 
end;

procedure calcularMaximos(vDias:vectorDias; var dia1,dia2:integer);
var
    i:integer;
    max1,max2:integer;

begin
    max1:=-1;
    max2:=-1;

    for i:=1 to 31 do begin // recorro el vector de dias
        if (vDias[i] > max1) then begin // si la cantidad de reservas del dia i es mayor al maximo 1
            max2:=max1; // el maximo 2 pasa a ser el maximo 1
            dia2:=dia1; // el dia 2 pasa a ser el dia 1
            max1:=vDias[i]; // el maximo 1 pasa a ser la cantidad de reservas del dia i
            dia1:=i; // el dia 1 pasa a ser el dia i
        end
        else if (vDias[i] > max2) then begin // si la cantidad de reservas del dia i es mayor al maximo 2
            max2:=vDias[i]; // el maximo 2 pasa a ser la cantidad de reservas del dia i
            dia2:=i; // el dia 2 pasa a ser el dia i
        end;
    end;
end;

procedure insertarOrdenado(var listaNueva:lista2; registroNuevo:reservaTotal);
var
    nuevo:lista2;
    actual,anterior:lista2;
begin
    new(nuevo); // creo el nuevo nodo
    nuevo^.dato:=registroNuevo; // cargo el dato en el nuevo nodo

    actual:=listaNueva; // actual apunta al primer nodo de la lista
    anterior:=listaNueva; // anterior apunta al primer nodo de la lista

    while (actual <> nil) and (actual^.dato.numeroReserva < registroNuevo.numeroReserva) do begin // mientras no llegue al final de la lista y el numero de reserva del nodo actual sea menor al numero de reserva del nuevo nodo
        anterior:=actual; // anterior pasa a ser el nodo actual
        actual:=actual^.sig; // actual pasa a ser el siguiente nodo
    end;

    if (actual = anterior) then // si actual es igual a anterior, quiere decir que el nuevo nodo va al principio de la lista
        listaNueva:=nuevo // el nuevo nodo pasa a ser el primer nodo de la lista
    else // si no
        anterior^.sig:=nuevo; // el nodo anterior apunta al nuevo nodo

    nuevo^.sig:=actual; // el nuevo nodo apunta al nodo actual
end;

var
    listaReserva: lista; // lista que se dispone
    listaNueva: lista2; // lista nueva
    vPrecios : precio; // tabla de precios
    vDias : vectorDias; // vector de dias

begin
    
    listaReserva:=nil; // inicializo lista que se dispone
    listaNueva:=nil; // inicializo lista nueva

    cargarListaReservas(l); // se dispone asi que no lo implemento
    cargarTablaPrecios(vPrecios); // se dispone asi que no lo implemento

    inicializarVectorDias(vDias); // inicializo vector de dias en 0

    recorrerListaReservas(listaReserva,listaNueva,vPrecios,vDias); // recorriendo una sola vez la lista, resuelvo los puntos

end.




// -----------------------------------------------------------------------------------------------


// TEMA 2
// "Un salón de eventos necesita un programa para administrar la información de las reservas de diciembre de 2023. 
// Se dispone de una estructura con la información de las reservas. De cada reserva se conoce: número de reserva, 
// DNI del cliente, día del evento (1..31), hora de inicio, hora de fin y categoría de servicio (1..4). 
// Además, se dispone de una tabla con el precio por hora de reserva de acuerdo a cada categoría de servicio.

// Se pide:

// A) Generar una nueva estructura con número y precio total de cada reserva. Esta estructura debe generarse ordenada 
// por el precio total de cada reserva.
// B) Informar los dos días del mes con menor cantidad de reservas de clientes con DNI impar.
// C) Informar el porcentaje de reservas de eventos que inicien después de las 12 hs y se produzcan en la segunda quincena.


program Tema2;
type

    rangoDias = 1..31;
    rangoCategorias = 1..4;

    reserva = record
        numeroReserva : integer;
        dni : integer;
        dia : rangoDias;
        horaInicio : integer;
        horaFin : integer;
        categoria : rangoCategorias;
    end;

    precio = array [rangoCategorias] of real;

    reservaTotal = record
        numeroReserva : integer;
        precioTotal : real;
    end;

    lista2 = ^nodo2; // lista nueva que se debe generar en el punto A
    nodo2 = record
        dato : reservaTotal;
        sig : lista;
    end;

    lista = ^nodo; // lista de reservas que se dispone 
    nodo = record
        dato : reserva;
        sig : lista;
    end;

    // vector de 31 posiciones, cada posicion representa un dia del mes
    vectorDias = array [rangoDias] of integer;

procedure inicializarVectorDias(var v:vectorDias);
var
    i:integer;
begin

    for i:=1 to 31 do
        v[i]:=0;
end;

procedure recorrerListaReservas(listaReserva:lista; var listaNueva:lista2; vPrecios:precio; var vDias:vectorDias; var porcentajeReservasDespues12:real; var dia1,dia2:integer);
var
    horas:integer;
    precioTotal:real;
    registroNuevo: reservaTotal;
    cantidadReservasDespues12:integer;
    cantidadTotalReservas:integer;

begin
    cantidadReservasDespues12:=0;
    cantidadTotalReservas:=0;

    while (listaReserva <> nil) do begin // cada iteracion de la lista, representa una reserva
        //A. Generar una nueva estructura con número y precio total de cada reserva. Esta estructura debe generarse ordenada por el precio total de cada reserva.

        //para calcular el precio total de la reserva, se debe multiplicar la cantidad de horas por el precio de la categoria que está en el vector de precios
        registroNuevo.horas := listaReserva^.dato.horaFin - listaReserva^.dato.horaInicio; // calculo la cantidad de horas de la reserva 
        registroNuevo.precioTotal := horas * vPrecios[listaReserva^.dato.categoria]; // calculo el precio total de la reserva
        insertarOrdenado(listaNueva,registroNuevo); // inserto ordenado por precio total de la reserva

        //B. Informar los dos días del mes con menor cantidad de reservas de clientes con DNI impar.
        if (listaReserva^.dato.dni mod 2 = 1) then // si el dni es impar
            vDias[listaReserva^.dato.dia]:=vDias[listaReserva^.dato.dia]+1; // sumo 1 en la posicion del vector que representa el dia de la reserva

        //C. Informar el porcentaje de reservas de eventos que inicien después de las 12 hs y se produzcan en la segunda quincena.
        if (listaReserva^.dato.horaInicio > 12) and (listaReserva^.dato.dia > 15) then // si la reserva inicia despues de las 12 y se produce en la segunda quincena
            cantidadReservasDespues12 := cantidadReservasDespues12 + 1; 

        cantidadTotalReservas := cantidadTotalReservas + 1; // cuento la cantidad total de reservas

        listaReserva:=listaReserva^.sig; // avanzo en la lista
    end;

    porcentajeReservasDespues12 := (cantidadReservasDespues12 * 100) / cantidadTotalReservas; // calculo el porcentaje 

    calcularMinimos(vDias,dia1,dia2); // calculo los dos dias con menor cantidad de reservas
end;

procedure calcularMinimos(vDias:vectorDias; var dia1,dia2:integer);
var
    i:integer;
    min1,min2:integer;

begin
    min1:=9999;
    min2:=9999;

    for i:=1 to 31 do begin // recorro el vector de dias
        if (vDias[i] < min1) then begin // si la cantidad de reservas del dia i es menor al minimo 1
            min2:=min1; // el minimo 2 pasa a ser el minimo 1
            dia2:=dia1; // el dia 2 pasa a ser el dia 1
            min1:=vDias[i]; // el minimo 1 pasa a ser la cantidad de reservas del dia i
            dia1:=i; // el dia 1 pasa a ser el dia i
        end
        else if (vDias[i] < min2) then begin // si la cantidad de reservas del dia i es menor al minimo 2
            min2:=vDias[i]; // el minimo 2 pasa a ser la cantidad de reservas del dia i
            dia2:=i; // el dia 2 pasa a ser el dia i
        end;
    end;
end;

procedure insertarOrdenado(var listaNueva:lista2; registroNuevo:reservaTotal);
var
    nuevo:lista2;
    actual,anterior:lista2;
begin
    new(nuevo); // creo el nuevo nodo
    nuevo^.dato:=registroNuevo; // cargo el dato en el nuevo nodo

    actual:=listaNueva; // actual apunta al primer nodo de la lista
    anterior:=listaNueva; // anterior apunta al primer nodo de la lista

    while (actual <> nil) and (actual^.dato.precioTotal < registroNuevo.precioTotal) do begin // mientras no llegue al final de la lista y el precio total de la reserva del nodo actual sea menor al precio total de la reserva del nuevo nodo
        anterior:=actual; // anterior pasa a ser el nodo actual
        actual:=actual^.sig; // actual pasa a ser el siguiente nodo
    end;

    if (actual = anterior) then // si actual es igual a anterior, quiere decir que el nuevo nodo va al principio de la lista
        listaNueva:=nuevo // el nuevo nodo pasa a ser el primer nodo de la lista
    else // si no
        anterior^.sig:=nuevo; // el nodo anterior apunta al nuevo nodo

    nuevo^.sig:=actual; // el nuevo nodo apunta al nodo actual
end;

var
    listaReserva: lista; // lista que se dispone
    listaNueva: lista2; // lista nueva
    vPrecios : precio; // tabla de precios
    vDias : vectorDias; // vector de dias

begin
        
    listaReserva:=nil; // inicializo lista que se dispone
    listaNueva:=nil; // inicializo lista nueva
    
    cargarListaReservas(l); // se dispone asi que no lo implemento
    cargarTablaPrecios(vPrecios); // se dispone asi que no lo implemento
    
    inicializarVectorDias(vDias); // inicializo vector de dias en 0
    
    recorrerListaReservas(listaReserva,listaNueva,vPrecios,vDias); // recorriendo una sola vez la lista, resuelvo los puntos
    
end.
