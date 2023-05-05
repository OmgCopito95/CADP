{program Ejercicio3P2;

const
  dimF = 200;  // A LO SUMO 200 VIAJES

type

  viaje = record
    dia: 1..31;
    monto: real;
    distancia: real;
  end;

  vectorViajes = array [1..dimF] of viaje;

  vectorContador = array [1..31] of integer; // para contar cantidad de viajes de cada dia

procedure leerViaje(var vi:viaje);
var
begin
   readln(vi.distancia);
   if(vi.distancia <> 0)then begin
     readln(vi.dia);
     readln(vi.monto);
   end;
end;


procedure cargarVector(var v:vectorViajes;var dimL:inter);
var
  vi: viaje;
begin
   leerViaje(vi);
   while(vi.distancia <> 0) and (dimL < dimF) do begin // la distancia no es 0 y hay lugar en el vector
     dimL := dimL + 1; //incremento diml porque agrego un nuevo elemento
     v[dimL] := vi; //guardo el elem en el vector
     leerViaje(vi); //leo otro viaje
   end;
end;

procedure calcularMontoMinimo(vi: viaje; var viajeMinimo:viaje);

begin
 if(vi.monto < viajeMinimo.monto)then begin
   viajeMinimo:=vi;

   {min:=vi.monto;
   disMin:=vi.distancia;
   diaMin:=vi.dia;}
 end;

end;

procedure recorrerVector(v:vectorViajes; dimL:integer; var promedio: real; var viajeMinimo:viaje; var vContador: vectorContador); //paso todo por valor porque no se modifican
var
  i: integer;

begin
   montoTotal:= 0;
   viajeMinimo.monto:=999; //inicializo el minimo en un numero muy grande. esto equivale a la variable MIN

   for i:=1 to dimL do begin //por cada vuelta del for procesa un viaje del vector viajes

       //El monto promedio transportado de los viajes realizados
       montoTotal:= montoTotal + v[i].monto;

       //La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
       calcularMontoMinimo(v[i],viajeMinimo);

       //La cantidad de viajes realizados cada día del mes.

       {diaDelViaje:=v[i].dia;   //uso una variable auxiliar
       vContador[diaDelViaje]:=vContador[diaDelViaje]+1;}

       vContador[v[i].dia]:=vContador[v[i].dia]+1; //le sumo 1 al vector contador en la posicion del dia del viaje

   end;

   // significa que ya termine de procesar todos los viajes del vector
   promedio := montoTotal / dimL;

end;


procedure recorrerVectorContador(vContador:vectorContador);
var
  i:integer;
begin
     for i:=1 to 31 do begin
         writeln('Para el dia ',i,' hubo ',vContador[i],' viajes.');
     end;
end;

procedure inicializarVectorContador(var v:vectorContador);
var
  i:integer;
begin
  for i:=1 to 31 do begin
      v[i]:=0;
  end;
end;

var // VARIABLES LOCALES DEL PP
 v: vectorViajes;
 dimL: integer;
 promedio: real;
 viajeMinimo: viaje;
 vContador: vectorContador;

begin  // PROGRAMA PRINCIPAL

 inicializarVectorContador(vContador); //pongo todo en 0 las posiciones del vector

 dimL:=0; // tengo 0 elementos al principio
 cargarVector(v,dimL); //a

 recorrerVector(v,dimL,promedio,viajeMinimo,vContador);

 writeln('el promedio de montos es:',promedio); //b1
 writeln('distancia y dia del viaje monto minimo:',viajeMinimo.distancia,viajeMinimo.dia); //b2

 recorrerVectorContador(vContador);  //b3
end.   }


// -------------------------------------------------------------------------------- //

{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:
a) El año con mayor temperatura promedio a nivel mundial.
b) El año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}



program project1;
const
  dimFMediciones = 100;
  dimFAnios = 50;
type

  vectorMediciones = array [1..dimFMediciones] of real;

  vectorAnios = array [1..dimFAnios] of vMediciones;

procedure cargarVectorMediciones (var vM: vectorMediciones);
var
 i: integer;
begin
    for i:=1 to dimFMediciones do begin
       readln(vM[i]); //leo un dato y lo guardo en el vector de mediciones
       {readln(num);
       vM[i]:=num;}
    end;
end;

procedure cargarVector(var vAnios: vectorAnios);
var
 i: integer;
begin
     for i:=1 to dimFAnios do begin  //cargo todo el vector de años. Cada iteracion del for es un año
         cargarVectorMediciones(v[i]); //cargo el vector de mediciones de la posicion del año
     end;
end;


procedure recorrerVectorAnios(vAnio:vectorAnios);
var
 i: integer;
 promedio: real;
begin
    max:=-999;
    for i:=1 to dimFAnios do begin // cada vuelta es un año diferente

       recorrerVectorMediciones(vAnio[i], promedio,i); // recorrer el vector mediciones, sumando todo y diviendo por DimLMediciones
       actualizarPromedioMaximo(max,promedio,i,anioMaximo); //calcular maximo comun y corriente guardando el año

    end;
    //significa que recorri los 50 años

    writeln('el año con mayor medicion promedio es',anioMaximo);


end;

var //VARIABLES DEL PROGRAMA PRINCIPAL
 vAnio:vectorAnios;

begin
 cargarVector(vAnio);

 recorrerVectorAnios(vAnio);

end.






















