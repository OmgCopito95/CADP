{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100 camiones.
De cada camión se tiene:
patente
año de fabricación
y capacidad (peso máximo en toneladas que puede transportar).

Realizar un programa que lea y almacene la información de los viajes realizados por la empresa.

De cada viaje se lee:
código de viaje,
código del camión que lo realizó (1..100),
distancia en kilómetros recorrida,
ciudad de destino,
año en que se realizó el viaje
y DNI del chofer.

La lectura finaliza cuando se lee el código de viaje -1.
Una vez leída y almacenada la información, se pide:

1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que menos kilómetros recorridos posee.

2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año
en que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos
impares.
Nota: Los códigos de viaje no se repiten.}


program ej5_ej16_ejPaulina;
const
dimf=100;
type
rango=1..dimf;
str=string[30];

camiones=record
  patente:integer;
  aniio:integer;
  capacidad:integer;
end;

vector= array [rango]of camiones;

viajes=record
  cod_viaje:integer;
  cod_cam:rango;
  distancia_recorrida_km:real;
  cuidad:str;
  anio:integer;
  dni:integer;
end;

lista=^nodo;

nodo=record
  elem:viajes;
  sig:lista;
end;

//procesos

procedure agregar(var l :lista ; vi:viajes); //agrego ordenado por codigo de camion.
var
nue:lista;
ant:lista;
act:lista;
begin
  new(nue);
  nue^.elem:=vi;
  nue^.sig:=nil;
  if (l=nil)then begin
    l:=nue;
  end
  else begin
    act:=l;
    ant:=l;
    while (act<> nil)and(act^.elem.cod_cam < nue^.elem.cod_cam)do begin
      ant:=act;
      act:=act^.sig;
    end;
    if(l=act)then begin
      nue^.sig:=l;
      l:=nue;
    end
    else begin
      ant^.sig:=nue;
      nue^.sig:=act;
    end;
  end;
end;


procedure leer_viajes (var via:viajes);
begin
  readln(via.cod_viaje);
  if (via.cod_viaje <> -1)then begin
    readln(via.cod_cam);
    readln(via.distancia_recorrida_km);
    readln(via.cuidad);
    readln(via.anio);
    readln(via.dni);
  end;
end;

procedure cargar_info (var l:lista);
var
via:viajes;
begin
 leer_viajes(via);
 while (via.cod_viaje <>-1)do begin
   agregar (l,via);
   leer_viajes(via);
  end;
end;


procedure maximos_minimos(pat:integer;var max_km:real ; var min_km:real; var patente_min:integer ;var patente_max:integer;contador_km:real);
begin
  if (contador_km > max_km)then begin
    max_km:=contador_km;
    patente_max:= pat;
  end;

  if (contador_km < min_km)then begin
    min_km:= contador_km;
    patente_min:=pat;
  end;
end;

function impares(num:integer):boolean;
var
cumple:boolean;
dig:integer;
begin
 cumple:=true;
 while (num <>0)and (cumple=true)do begin
   dig:= num mod 10;
   if (dig mod 2= 0)then begin
     cumple:=false;
   end;
   num:=num div 10;
 end;
 impares:=cumple;
end;


function condiciones(registro:camiones; anio_via:integer):integer;
begin
  if(registro.capacidad > 30.5)and((anio_via - registro.aniio) > 5)then begin
    condiciones:=1;
  end
  else begin
    condiciones:=0;
  end;
end;


procedure procesar_info(l:lista;vec:vector);
var
aux_cod_camion:integer;
patente_min:integer;
patente_max:integer;
contador_km:real;
contador_viajes:integer;
max_km:real;
min_km:real;
begin
  contador_viajes:=0;
  max_km:=-1;
  min_km:=99999;
  while (l<>nil)do begin
    aux_cod_camion:=l^.elem.cod_cam;
    contador_km:=0;

    while(l<>nil)and(aux_cod_camion=l^.elem.cod_cam)do begin

      contador_km:=contador_km+l^.elem.distancia_recorrida_km;  //1

      if(impares(l^.elem.dni))then begin //3
        writeln(l^.elem.cod_viaje);
      end;

      contador_viajes:=contador_viajes+ condiciones(vec[l^.elem.cod_cam],l^.elem.anio);

      l:=l^.sig;
    end;
    maximos_minimos(vec[l^.elem.cod_cam].patente,max_km,min_km,patente_min,patente_max,contador_km); //2
  end;
  writeln(patente_min,patente_max);
  writeln(contador_viajes);
end;


//programa principal
var
l:lista;
ve:vector;
begin
  l:=nil;
  cargar_vector(ve); // ya se dispone
  cargar_info(l);
  procesar_info(l,ve);
end.





 //--------------------------------------------------EJERCICIO 16
LISTA ORDENADA POR CIUDAD



  cantidad total de corredores = 0
  distancia total recorrida=0
  tiempo total de carrera=0
  kmBrasil=0
  while (l<> nil)
     ciudadActual:=l^.dato.ciudad
     mayor cantidad de corredores=0
     cantidad total de kilómetros recorridos=0
     while(l<> nil) and (l^.dato.ciudad = ciudadActual)
               ...
               si el pais es brasil
                  sumo kmBrasil
                   sumo brasileros
              If (L^.dato.ciudadPartida <> L^.dato.ciudadFinal)
                 sumo

              If (paisSalida = 'BOSTON') then begin
                    Paso:= Paso + (kmDist * tiempo);
                    corredoresBoston:= corredoresBoston + 1;
     end
       end;
       actualizarMaximo()
       imprimir cant total de km de la ciudad

  end;
 writeln(promedioBrasil())
 promedioBoston()
 imprimo cant de corredores que cambiaron de ciudad //4




 //----------------------------  PSEUDOCODIGO DE PAULINA COCINA (FALTAN COSAS!)

TYPE

   vectorCategorias=array[1..60]of cadena15;



   leerVideo
   while(no sea corte de control)
     if(canal=paulinacocina)
       totalVisualiza:= totalVisualiza+video.cantVisualiza;

       if(video.visu>1000)
         agregarAlaLista(listaDetalles,video.titual,video)


       leerVideo()
   end;


   registrofinal.nombreCanal='paulina'
   registrofinal.anioPubl=

   registrofinal.listaNueva:=l;











