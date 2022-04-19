program ejercicio7;
const
    dimF = 7;
type
    rangoEspectro = 1..dimF;

    cadena15 = string[15];

    sonda = record
        nombre:cadena15;
        duracEstimada:integer;
        costoConstruc:real;
        costoMantenMens:real;
        rango:rangoEspectro;
    end;

    lista=^nodo;
    nodo=record
        dato:sonda;
        sig:lista;
    end;


procedure agregarAdelante(var pri:lista;s:sonda);
var
    aux:lista;
begin
    new(aux);
    aux^.dato:=s;
    aux^.sig:=pri;
    pri:=aux;
end;

procedure leerSonda(var s:sonda);
begin
    with s do begin
        writeln('NOMBRE:');
        readln(nombre);
        writeln('DURACION ESTIMADA DE LA MISION:');
        readln(duracEstimada);
        writeln('COSTO DE CONSTRUCCION:');
        readln(costoConstruc);
        writeln('COSTO DE MANTENIMIENTO MENSUAL:');
        readln(costoMantenMens);
        writeln('RANGO DEL ESPECTRO ELECTROMAGNETICO:');
        readln(rango);
    end;
end;

procedure generarLista(var pri:lista);
var
    s:sonda;
begin
    repeat
          leerSonda(s);
          agregarAdelante(pri,s); //hace la lista de las sondas
    until (s.nombre = 'GAIA');
end;

function cumpleCriterio(s:sonda):boolean;        //PUNTO A
var

begin
     cumpleCriterio := (s.costoMantenMens < s.costoConstruc) and (s.categoria  <> 1);
end;

procedure recorrerLista(l:lista;var listaCumple,listaNoCumple:lista);
begin

    while(l<>nil)do begin //recorro la lista principal de sondas

       if(cumpleCriterio(l^.dato))then     //PUNTO B
          agregarAdelante(listaCumple,l^.dato);  //agrego la sonda si cumple con los criterios
       else
          agregarAdelante(listaNoCumple,l^.dato);     //agrego la sonda si no cumple con los criterios

       l:=l^.sig;
    end;
end;

procedure imprimirListaNoCumple(l:lista);
var
    cantTotal:integer;
    costoTotal:real;
begin
    cantTotal:=0;
    costoTotal:=0;

    while(l<>nil)do begin //recorre la lista de las sondas que no cumplen
       cantTotal:=cantTotal+1;
       costoTotal:= costoTotal + (L^.dato.costoConstruc  + L^.dato.costoMantenMens * L^.dato.duracEstimada);
       l:=l^.sig;
    end;

    writeln('el costo total:',costoTotal);
    writeln('la cant total de sondas es:',cantTotal);

end;

var
  l,listaCumple,listaNoCumple: lista;
begin
  l:=nil;
  generarLista(l);
  recorrerLista(l,listaCumple,listaNoCumple);
  imprimirListaNoCumple(listaNoCumple); //PUNTO C

end.






