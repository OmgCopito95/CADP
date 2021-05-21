program ejercicio6;
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

    vec_espectro = array [rangoEspectro] of integer;

    lista=^nodo;
    nodo=record
        dato:sonda;
        sig:lista;
    end;

    lista_nombre=^nodo1;
    nodo1=record
        nombre:cadena15;
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

procedure generarLista(var pri:lista; var duracionPromedio:real; var costoPromedio:real);
var
    s:sonda;
    totalSondas,totalDuracion: integer;
begin
    totalSondas:=0;
    totalDuracion:=0;
    repeat
          leerSonda(s);
          agregarAdelante(pri,s); //hace la lista de las sondas
          totalSondas:=totalSondas+1; // cuenta cantidad total de sondas
          totalDuracion:=totalDuracion + s.duracEstimada; //cuenta la duracion total de las sondas
          totalCosto:=totalCosto+ s.costoConstruc;

    until (s.nombre = 'GAIA');

    duracionPromedio:=totalDuracion / totalSondas;
    costoPromedio:=totalCosto / totalSondas;

end;

procedure inicializarVector(var v:vec_espectro);
var
    i:integer;
begin
    for i:=1 to dimF do
        v[i]:=0;
end;

procedure agregarAdelanteNombre(var pri:lista_nombre;nom:cadena15);
var
    nue:lista;
begin
    new(nue);
    nue^.dato:=s;
    nue^.sig:=pri;
    pri:=nue;
end;

procedure recorrerLista(l:lista; var vc:vec_espectro; duracionPromedio, costoPromedio:real);
var
    max:real;
    cantSondasMayorDuracion:integer;
    listaNombres: lista_nombre;
begin
    max:=-1;
    cantSondasMayorDuracion:=0;
    listaNombre:=nil;

    while(l <> nil)do begin  //cada iteracion del while procesa una sonda

        //a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
        actualizarMaximo(l^.dato,max,nombreMax);

        //b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
        vc[l^.dato.rango] := vc[l^.dato.rango]+1; //le suma 1 a la pos del vc en el rango de la sonda procesada

        //c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
        if(l^.dato.duracEstimada > duracionPromedio)then          //modularizar
          cantSondasMayorDuracion:=cantSondasMayorDuracion+1;

        //d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
        if(l^.dato.costoConstruc > costoPromedio)then
           //la opcion 1: imrpimir el nombre aca directamente
           //la opcion 2: hacer una lista con los nombres
           agregarAdelanteNombre(listaNombres,l^.dato.nombre)  //opcion 2
           writeLn('nombre:', l^.dato.nombre); //opcion 1

        l:=l^.sig; //avanzo en la lista
    end;

    writeln('el nombre de la sonda mas costosa es:', nombreMax);
    recorrerVectorContador(vc);
    writeln('la cant sondas que superan el promedio es de:',cantSondasMayorDuracion);
end;

var
  l: lista;
  vc: vec_espectro;
  duracionPromedio,costoPromedio: real;
begin
  l:=nil;
  inicializarVector(vc); //pone todo en cero el vector contador
  generarLista(l,duracionPromedio,costoPromedio);
  recorrerLista(l,vc,duracionPromedio,costoPromedio);
end.






