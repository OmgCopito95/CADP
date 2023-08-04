

program tema2;
type 
    jugador = record
        codigo: integer;
        apellido: cadena20;
        nombre: cadena20;
        codigo_equipo: 1..20;
        nacimiento: integer;
        calificaciones: vectorCalificaciones;
    end;

    vectorCalificaciones = array [1..18] of integer;

    lista = ^nodo;
    nodo = record
        dato: jugador;
        sig: lista;
    end;

    //para cada equipo, la cantidad de jugadores menores de 30 años
    vectorContador = array [1..20] of integer;

procedure inicializarVectorContador (var vc:vectorContador);
var
    i:integer;
begin
    for i:=1 to 20 do 
      vc[i]:=0;
end;

procedure informarEquipos(vc:vectorContador);
var
    i:integer;
begin
    for i:=1 to 20 do 
      writeln('Equipo ',i,': ',vc[i]);
end;

procedure recorrerVector(v:vectorCalificaciones; var promedio: real; var cumple:boolean);
var
    i:integer;
begin
    for i:=1 to 18 do begin
        
        if (v[i]<>0) then begin
            promedio:=promedio+v[i];
            cant:=cant+1;
        end;
    end;
    promedio:=promedio/cant;
    cumple:= cant >= 9;
end;

procedure actualizarMinimos(promedio:real; codigo:integer; var min1,min2:integer; var codigoMin1,codigoMin2:integer);

begin

    if (promedio < min1) then begin
        min2:=min1;
        codigoMin2:=codigoMin1;
        min1:=promedio;
        codigoMin1:=codigo;
    end
    else if (promedio < min2) then begin
        min2:=promedio;
        codigoMin2:=codigo;
    end;

    

end;


procedure recorrerLista(l:lista; var vc: vectorContador);
begin
    min1:=9999;
    min2:=9999;
    while (l<>nil)do begin
        recorrerVector(v,promedio,cumple);
        if (cumple) then
            actualizarMinimos(promedio,l^.dato.codigo,min1,min2,codigoMin1,codigoMin2);

        if (l^.dato.nacimiento > 1990) then
            vc[l^.dato.codigo_equipo]:=vc[l^.dato.codigo_equipo]+1;

        l:=l^.sig;
    end;

    //ifnromo los dos codigos de jugadores con menor calificacion
    writeln('Los dos jugadores con menor calificacion son: ',codigoMin1,' y ',codigoMin2);

end;

var
    l:lista;
    vc: vectorContador;

begin
    inicializarVectorContador(vc);
    recorrerLista(l,vc);
    informarEquipos(vc);
end.