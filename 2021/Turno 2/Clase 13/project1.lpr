

{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).
a) Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.
b) Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.
c) Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia recorrida
sea igual a 100 km.
Nota: para realizar el inciso b, el vector debe recorrerse una única vez}

program project1;
const
    dimF = 5;//200
    fin =31;
type
    rangoDia = 1..fin;
    rangoVec = 1..dimF;
    viaje = record
        dia: rangoDia;
        montoTransportado: real;
        distRecorrida:integer;                        //v[1] --> registro viaje
    end;

    vec_viajes = array [rangoVec] of viaje;

    vec_dias = array [rangoDia] of integer; //vector contador

procedure menosDinero(monto:real; i: integer; var min:real; var pos:integer;);
var
    i:integer;
begin
        if (monto < min) then begin
            min := monto;  //actualizo el minimo
            pos := i;  //me guardo la posicion de ese viaje
        end;
end;
function calcularMontoProm (montoTransp:real; dimL:integer):real;
begin
    calcularMontoProm:= montoTransp / dimL;
end;

procedure imprimirViajesDeCadaDia(vd:vector_dias);
begin
    for(i:=1 to 31)do
      writeln('el dia',i,'se hicieron',vd[i],'viajes');
    //el dia 5 se hicieron 40 viajes
end;

procedure informar (v:vec_viajes;dimL:integer; var montoTransportado:real; var vD:vec_dias);
var
    i, pos,diaDelViaje:integer;
    montoProm,totalMonto,menorMonto:real;
begin
    pos:=0;
    totalMonto:=0;
    min:=9999;

    for i:=1 to dimL do begin  //recorre el vector de viajes

        totalMonto:=totalMonto + v[i].montoTransportado;  //para calcular el promedio de montos

        menosDinero(v[i].montoTransportado,i,min,pos); //actualiza minimo   b2
        //le mando: un viaje,i es la posicion del viaje,min,pos guarda la posicion del viaje que menos dinero transporto


        //b3
        diaDelViaje := v[i].dia; //me guardo el dia del viaje que esta en la posicion i del vector de viaje
        vD[diaDelViaje] := vD[diaDelViaje] + 1; //en el vector contador le sumo 1 a la posicion del dia del mes

        //vD[v[i].dia] := vD[v[i].dia] + 1; //otra opcion para evitar usar la variable diaDelViaje

    end;

    montoProm:= calcularMontoProm(totalMonto,dimL);  //b1
    writeln('Monto promedio transportado de los viajes realizados', montoProm:6:2);

    writeln('el viaje que transporto menos dinero hizo',v[pos].distanciaRecorrida,'km. y fue el dia',v[pos].dia);
                //el viaje que transporto menos dinero hizo 500km y fue el dia 5

    imprimirViajesDeCadaDia(vD); //imprime la cantidad de viajes que se hicieron cada dia
end;

procedure inicializarVecDias (var vD:vec_dias);
var
    i:integer;
begin
    for i:=1 to fin do
        vD[i]:=0;
end;

procedure leerViaje (var via:viaje);
begin
    with via do begin
        writeln('DISTANCIA RECORRIDA:');
        readln (distRecorrida);
        if (distRecorrida <> 0 ) then begin
            writeln('DIA:');
            readln(dia);
            writeln('MONTO TRANSPORTADO:');
            readln(montoTransportado);
        end;
    end;
end;
procedure cargarVector (var v:vec_viajes; var dimL:integer);
var
    via:viaje;
begin
    leerViaje(via);
    while (via.distRecorrida <> 0) and (dimL < dimF) do begin
        dimL:=dimL+1;
        v[dimL]:=via;
        leerViaje(via);
    end;
end;
var
    v: vec_viajes;
    dimL:integer;
    montoPromedio:real;
    vD:vec_dias;
begin
    dimL:=0;
    cargarVector(v,dimL);
    inicializarVecDias(vD);   //inicializa el vector contador
    informar(v,dimL,montoPromedio,vD);
end.




//punto c de borrar las ocurrencias:

Procedure BorrarElem (var v: vector;  var dimL:integer; elem:integer; var exito: boolean);

   Procedure BorrarPosModif (var v:vector; var dimL:integer; pos:integer);
   var
     i: integer; 
   begin
      for i:=pos+1 to dimL  do
         v[i-1] := v [i];
      dimL := dimL-1;
   end;

var
  pos: indice;
  i: integer;
Begin
  i:=1; //sirve para recorrer el vector

  while (i<dimL)  do begin

     if(v[i].distanciaRecorrida = 100)then   //si la distancia del viaje es 100 -> entonces lo borro
       BorrarPosModif(v,dimL,i)  //borra el viaje de 100km
     else // si no borre el elemento -> avanzo
       i := i+1; //avanzo en el vector
  end;

end;


//---------------------------------------------------------------------------------------------------

program P4_2Ej3;
        const
                dimF=200;
        type
                tot=1..200;
                dias=1..31;
                trip=record
                        dia:dias;
                        monto:real;
                        distancia:integer;
                end;
                viajes=array [tot] of trip;
                date=array [dias] of integer;
procedure leer(var v:viajes;var dimL:tot);
        var pos:integer;
        begin
                pos:=1;
                dimL:=1;
                writeln('Distancia:');            //modularizar
                readln(v[pos].distancia);
                if v[pos].distancia>0 then begin
                        writeln('Dia:');
                        readln(v[pos].dia);
                        writeln('Monto:');
                        readln(v[pos].monto);
                end;
                while (v[pos].distancia>0) and (dimL<dimF) do begin
                        pos:=pos+1;
                        writeln('Distancia:');
                        readln(v[pos].distancia);
                        if v[pos].distancia>0 then begin
                                writeln('Dia:');
                                readln(v[pos].dia);
                                writeln('Monto:');
                                readln(v[pos].monto);
                                dimL:=dimL+1;
                        end;
                end;
        end;
procedure modB(v:viajes;dimL:tot);
        procedure menosDinero(viaje:trip;var MenorViaje:trip);
                begin
                        if viaje.monto<MenorViaje.monto then begin
                                MenorViaje:=viaje;
                        end;
                end;
        var
                i:integer;
                sumaMonto:real;
                MenorViaje:trip;
                fecha:date;
        begin
                for i:=1 to 31 do     //modularizar
                        fecha[i]:=0;
                MenorViaje.monto:=99999;
                sumaMonto:=0;
                for i:=1 to dimL do begin
                        sumaMonto:=sumaMonto+v[i].monto;
                        menosDinero(v[i],MenorViaje);
                        fecha[v[i].dia]:= fecha[v[i].dia]+1;
                end;
                writeln('Monto promedio: ',sumaMonto/dimL:2:2);
                writeln('Distancia y Dia del mes del viaje de menos importe: ',MenorViaje.distancia,' km. el dia ',MenorViaje.dia,'.');
                for i:=1 to 31 do          //modularizar
                        writeln('Dia ',i,': ',fecha[i],' viajes.');
        end;
var
        v:viajes;
        dimL:tot;
begin
        leer(v,dimL);
        modB(v,dimL);
        readln;
end.



//---------------------------------------------------------------------------------------------------------



{4-Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:
a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.
b. Un módulo que reciba un alumno y lo inserte en el vector.
c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.
d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector
e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa principal que invoque los módulos desarrollados en los incisos previos con
datos leídos de teclado}
program Hello;
const
    dimF = 1000;
type
    rangoVec = 1..dimF;
    cadena30 = string[30];
    alumno = record
        nroAlumno:integer;
        apeYnom:cadena30;
        cantAsist:integer;
    end;
    vec_alumnos = array[rangoVec] of alumno;

Function BuscarPosElem (x:integer;v:vec_alumnos;dimL: integer) : integer;    //a
var pos:integer; exito: boolean;
Begin
 pos:=1; exito:= false;
 while (pos <= dimL) and (not exito) do
      if (x = v[pos]) then exito:= true
                      else pos:=pos+1;
 if (exito = false) then pos:=0;
 BuscarPosElem := pos;
end;

Procedure BorrarPosModif (var v:vec_alumnos; var dimL:integer; pos:integer);
 var i: integer;
 begin
    for i:= pos + 1  to   dimL  do
       v [ i - 1 ]  :=  v [ i] ;
    dimL := dimL - 1 ;
 end;

Procedure BorrarElem (var v: vec_alumnos;  var dimL: integer;elem : integer;  var exito: boolean);
var pos: integer;
Begin
  exito:= False;
  pos:= BuscarPosElem (elem, v, dimL);
  if pos <> 0 then begin
        BorrarPosModif (v, dimL, pos);
        exito:= true;
  end;
end;

Procedure Insertar (var v:vec_alumnos; var dimL:integer; pos: integer; elem:alumno);
var
    j: integer;
    begin
        for j:= dimL downto pos do
          v [ j +1 ] := v [ j ] ;
        v [ pos ] := elem;
        dimL := dimL + 1;
    End;

Function BuscarPosicion (x:integer; v:vec_alumnos; dimL: integer): integer;
var pos:integer; exito: boolean;
Begin
 pos:=1;
 while (pos <= dimL) and (x > v[pos]) do
        pos:=pos+1;
BuscarPosicion := pos;
end;
Procedure InsertarElemOrd (var v: vec_alumnos;  var dimL: integer; elem : alumno; var exito: boolean);
var
 pos: integer;
Begin
   exito := false;
   if (dimL < dimF) then begin
        pos:= BuscarPosicion (elem, v, dimL);
        Insertar (v, dimL, pos, elem);
        exito := true;
    end;
end;

var
    v:vec_alumnos;
    dimL,nroAlu,PosElem,elimPos:integer;
    alu:alumno;
    ok,ok1:boolean;
begin
    dimL:=0;
    cargarVecAlu(v,dimL);// se dispone
    writeln('Nro de alumno:');
    readln(nroAlu);
    PosElem:= BuscarPosicion(nroAlu,v,dimL);
    leerAlumno(alu);//la lectura ya se dispone de la carga del vector
    InsertarElemOrd(v,dimL,alu,ok)
    writeln('Eliminar posicion:');
    readln(elimPos);
    BorrarElem(v,dimL,elimPos,ok1);
end.




