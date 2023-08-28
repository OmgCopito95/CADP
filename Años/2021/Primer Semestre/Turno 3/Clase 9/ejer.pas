     //juan manuel

{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. Se pide
implementar un programa que procese la información y determine:
● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.
El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}
program ejer;
	
type
	string20=string[20];

	escuela=record
		cue:integer;
		nombre_establecimiento:string20;
		cant_docente:integer;
		cant_alumnos:integer;
		localidad:string20;
	end;
procedure carga(var e:escuela);
	begin
		writeln('Ingrese el CUE, nombre del establecimiento, cantidad de docentes, cantidad de alumnos y la localidad');
		readln(e.cue);
		readln(e.nombre_establecimiento);
		readln(e.cant_docente);
		readln(e.cant_alumnos);
		readln(e.localidad);
	end;

function relacion(e:escuela):integer;
	var
		cuenta:real;
	begin
		cuenta:=e.cant_alumnos/e.cant_docente; //modularizar
		if (e.localidad = 'la plata') and (  cuenta > 23.435) then
			relacion:=1
		else
			relacion:=0;	
	end;

procedure mejor_relacion(e:escuela; var escu1, escu2:string; var cue1, cue2:integer);
	begin
		if (e.cant_alumnos/e.cant_docente > cue1) then begin
			cue2:=cue1;
			escu2:=escu1;
			cue1:=e.cue;
			escu1:=e.nombre_establecimiento;
		end
		else if (e.cant_alumnos/e.cant_docente > cue2) then begin
			cue2:=e.cue;
			escu2:=e.nombre_establecimiento;
		end;
	end;	

var
	i, cant_escuelas_CUE, cue1, cue2:integer;
	establecimiento:escuela;
	escu1, escu2:string20;
begin
	cue1:=24;
	cue2:=24;
	escu1:='';
	escu2:='';
	i:=0;
	cant_escuelas_CUE:=0;
	for i:=1 to 4 do begin

		carga(establecimiento);
		cant_escuelas_CUE:=cant_escuelas_CUE+(relacion(establecimiento));
		mejor_relacion(establecimiento,rel, escu1, escu2, cue1, cue2);
	end;
	writeln('La Cantidad de escuelas de La Plata con una relacion alumnos/docente superior a la sugerida por UNESCO es ', cant_escuelas_CUE);
	writeln('La CUE y nombre de las dos escuelas con mejor relacion docentes/alumnos es ', cue1,' ',escu1, ' y ', cue2,' ',escu2);
	readln();
	end.




 //serrano florencia
{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere: a. Realizar un módulo que lea la información de una línea de teléfono. b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}


program ejer4tp3;
const
    precioxMinuto=3.40;
    precioXmb=1.35;
type
    linea=record
        numero:integer;
        cant_lineas:integer;
        cant_minutos:integer;
        cant_mb:integer;
    end;

function CalculoMinutos(m:integer):real;
begin
    CalculoMinutos:=m*precioxMinuto;
end;

function CalculoMB (mb : integer):real;
begin
    CalculoMB:=mb*precioXmb;
end;

PROCEDURE LeerLinea (var numero:integer; var cant_minutos:integer; var cant_mb:integer);
begin
    writeln('Ingrese el numero de su linea: ');
    readln(numero);
    writeln('Ingrese cantidad de  minutos: ');
    readln(cant_minutos);
    writeln('Ingrese cantidad de MB: ');
    readln(cant_mb);



end;


PROCEDURE LeerDatosCliente (cod:integer; l:linea;var suma_minutos:integer;var suma_mb:integer);

begin
    suma_minutos:=0;
    suma_mb:=0;

    writeln('ingrese su codigo: ');
    readln(cod);
    writeln('ingrese cantidad de lineas: ');
    readln(l.cant_lineas);

        while (l.cant_lineas<>0 )do begin

            LeerLinea(l.numero,l.cant_minutos,l.cant_mb);

            suma_minutos:=suma_minutos+l.cant_minutos;

            suma_mb:=suma_mb+l.cant_mb;

            l.cant_lineas:=l.cant_lineas-1;

         end;


end;

var
    codigo:integer;
    i:integer;
    l:linea;
    Pago_min: real;
    PagoXmb:real;
    suma_mb ,suma_minutos:integer;
begin


    for i:=1 to 3 do
    begin
        Pago_min:=0;
        PagoXmb:=0;
        suma_mb:=0;
        suma_minutos:=0;
        LeerDatosCliente(codigo,l,suma_minutos,suma_mb);

        pago_min:=CalculoMinutos(suma_minutos);
        PagoXmb:=CalculoMB(suma_mb);


        writeln('EL MONTO TOTAL DE TODAS SUS LINEAS ES:');
        writeln('total por minutos = ',Pago_min:3:2);
        writeln('total por MB= : ',PagoXmb:3:2);
    end;

readln();
end.

// 6- sergio

Program ej1;
type
micro = record
    marca:string;
    linea:string;
    cores:integer;
    clock:real;
    proceso:integer;
end;

procedure leer (var m:micro);
begin
    write('nucleos: '); readln(m.core);
    if core <> 0 then begin
        write('marca: '); readln (m.marca);
        write('linea: '); readln (m.linea);
        write('clock: '); readln (m.clock);
        write('procesos: '); readln (m.proceso);
    end;
end;

procedure inciso1 (m:micro);
begin
    if (m.cores > 2) and (m.proceso <= 22) then
        write (m.marca,m.linea, 'es un procesador de al menos 3 cores y a lo sumo 22nm');
end;
function inciso3 (m:micro):boolean
begin
    inciso3:=(m.cores > 1) and (m.clock > 2)(AMD o INTEL);
end;

procedure actualizarMax



var m:micro;cant,cant14:integer;marcaActual:string; // falta completar variables


begin
    cant:=0;
    nommax1 // falta inicializar variables
    nommax2
    max1
    max2
    leer (m)
    while (m.core<>0) do begin

        marcaActual:=m.marca;
        cant14:=0

            while (m.core<>0) and (m.marca = marcaActual) do begin //una misma marca
                if (m.proceso = 14)then
                   cant14:=cant14+1;

                inciso1(m);
                if inciso3 then
                    cant:=cant+1;


                leer (m);
            end;
            //CAMBIO DE MARCA
            actualizarMax (cant14, marcaActual,max1,max2,nommax,nommax2); // falta la implementacion de este modulo

    end;
    writeln('la cantidad de procesadores muilticore de al menos 2ghz es: ',cant);
    nom1 nom2
end.



 //molina lucia

{8-La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
A) Cantidad total de escuelas que participan en la convocatoria 2018 y cantidad de escuelas por cada localidad.
B) Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
C) Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}


Program ejer8;

TYPE
str20 = string[20];
r_coord = record
     DNI: integer;
	 nombre: str20;
	 apellido: str20;
	 mail: str20;
end;

r_proyecto = record
     codigo: integer;
	 titulo: str20;
	 docente: str20;
	 coordinador: r_coord;
	 alumnos: integer;
	 escuela: str20;
	 localidad: str20;
end;

Procedure LEER_COORD (VAR c: r_coord);
Begin
     with c do begin
	   writeln('Ingrese DNI');
	   readln(DNI);
	   writeln('Ingrese nombre del coordinador: ');
	   readln(nombre);
	   writeln('Ingrese apellido: ');
	   readln(apellido);
	   writeln('Ingrese el email: ');
	   readln(mail);
     end;
End;




Procedure LEER_PROY (VAR p: r_proyecto; VAR c: r_coord);
Begin
     with p do begin
	   writeln('Ingrese codigo');
	   readln(codigo);
       IF (codigo <> -1) then begin
	     writeln('Ingrese titulo');
	     readln(titulo);
	     writeln('Ingrese docente');
	     readln(docente);
	     LEER_COORD (c);
	     writeln('Ingrese cantidad de alumnos');
	     readln(alumnos);
	     writeln('Ingrese escuela');
	     readln(escuela);
	     writeln('Ingrese localidad');
	     readln(localidad);
      end;
    end;
End;


Procedure MAXIMOS (escu:str20;VAR esc1,esc2: str20; alumnos: integer; VAR max1,max2: integer);
Begin
     IF (alumnos > max1) then begin
	     max2:= max1;
		 max1:= alumnos;
		 esc2:= esc1;
		 esc1:= escu;
	 end
	 ELSE
	     IF (alumnos > max2) then begin
		     max2:= alumnos;
			 esc2:= escu;
		 end;
End;


FUNCTION DESCOMPONER (cod:integer): boolean;
Var
  aux,par,impar: integer;
Begin
         par:= 0;
	 impar:= 0;
	 while (cod <> 0) do begin
	     aux:= cod MOD 10;
		 If ((aux MOD 2)=0) then
		     par:= par + 1
		 ELSE
		     impar:= impar + 1;
                 cod:= cod DIV 10;
	 end;

	 If (par = impar) then
	     DESCOMPONER:= true
	 ELSE
         DESCOMPONER:= false;
End;





VAR
  p: r_proyecto;
  c: r_coord;
  total_escuelas,esucelas_localidad,max1,max2: integer;
  esc1,esc2,locActual,escuActual: str20;
Begin
     max1:= -1;
	 max2:= -1;
	 total_escuelas:= 0;

	 LEER_PROY (p,c);

	 while (p.codigo <> -1) do begin
	         locActual:= p.localidad;
		 esucelas_localidad:= 0;

		 while (p.codigo <> -1) AND (locActual = p.localidad) do begin //una misma localidad
		         escuActual:= p.escuela;
			 esucelas_localidad:= esucelas_localidad + 1;
			 total_escuelas:= total_escuelas + 1;
                         CANT:=0;
			 IF (p.localidad='DAIREAUX') then
			     If (DESCOMPONER(p.codigo)) then
				     writeln('Título de los proyectos de la localidad de Daireaux cuyo codigo posee igual cantidad de dígitos pares e impares: ',p.titulo);
                                                                                       A            B
			 while (p.codigo <> -1) AND (locActual = p.localidad) AND (escuActual = p.escuela) do begin //una escuela
                             cant:=cant+p.cantAlumn;
                             writeln('    ');                                         ESCUELA 1 -> PROY 50ALUMN
                             LEER_PROY (p,c);                                                      PROY 40 ALUM
          	         end;                                                                      PROY 20 ALUM
                         //CAMBIO DE ESCUELA                                                            110 ALUM TOTAL
                         MAXIMOS (escuActual,esc1,esc2,cant,max1,max2);
    	         end;
                 //CAMBIO DE LOCALIDAD

		 writeln('>>La cantidad de escuelas en la localidad ',locActual,' es de: ',esucelas_localidad);
	 end;
         //TERMINO DE LEER TODOS LOS PROYECTOS
	 writeln('     ');
	 writeln('Cantidad TOTAL de escuelas que participaron del proyecto: ',total_escuelas);
	 writeln('Nombres de las dos escuelas con mayor cantidad de alumnos participantes: ',esc1,' y ',esc2);
     readln();
End.


//lucia
{9-Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a
intendente de la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del
candidato, cantidad de votos obtenidos, y cantidad de votantes de la localidad. La lectura finaliza al
leer la localidad ‘Zárate’, que debe procesarse. Informar:
A) el intendente que obtuvo la mayor cantidad de votos en la elección.
B) el intendente que obtuvo el mayor porcentaje de votos de la elección. }

Program ejer9;

TYPE
  str20 = string[20];
  r_candidato= record
     localidad: str20;
	 apellido: str20;
	 cantVotos: integer;
	 cantVotantes: integer;
  end;


Procedure LEERCANDIDATO (VAR c:r_candidato);
Begin
   with c do begin
     writeln('ingrese Localidad: ');
	 readln(localidad);
	 writeln('Ingrese apellido del candidato: ');
	 readln(apellido);
	 writeln('Ingrese cantidad de votos: ');
	 readln(cantVotos);
	 writeln('Ingrese la cantidad de votantes: ');
	 readln(cantVotantes);
   end;
End;


PROCEDURE MAX_VOTOS (v: integer; ap: str20; VAR max: integer; VAR apmax: str20);
Begin
   If (v > max) then begin
     max:= v;
	 apmax:= ap;
   end;
end;



Procedure MAYORPORCENTAJE (v,votantes: integer; a: str20; VAR maxPorcentaje: real; VAR apmaxp: str20);
var
  porcentaje: real;
Begin
    porcentaje:= (v*100)/votantes;
    if (porcentaje > maxPorcentaje) then begin
	   maxPorcentaje:=porcentaje;
       apmaxp:= a;
    end;
end;

function porcentaje(p:persona):real;
        begin
            porcentaje:=p.votos_obte*100/p.votantes_x_localidad;
        end;

    procedure max_porcentaje(p:persona; var ape_porcentaje:string20; var porcentaje_max:real);
        var
            a:real;
        begin
            a:=porcentaje(p);
            writeln(a:4:4);
            if (a > porcentaje_max) then begin
                porcentaje_max:=a;
                ape_porcentaje:=p.apellido;
            end;
        end;

VAR
  candidato: r_candidato;
  max: integer;
  apmax, apmaxP: str20;
  maxPorcentaje: real;
Begin
      max:= -1;
      maxPorcentaje:= -1;
   REPEAT

      LEERCANDIDATO (candidato);

	  MAX_VOTOS (candidato.cantVotos,candidato.apellido,max,apmax);

      MAYORPORCENTAJE(candidato.cantVotos,candidato.cantVotantes,candidato.apellido,maxPorcentaje,apmaxP);

      writeln('      ');

   UNTIL (candidato.localidad = 'ZARATE');

   writeln ('El intendente que obtuvo la mayor cantidad de VOTOS en la eleccion: ',apmax,' con una cantidad de: ',max,' votos');
   writeln('El intendente que obtuvo el mayor PORCENTAJE de votos de la eleccion: ',apmaxp,' con un porcentaje de: ',maxPorcentaje:3:2,'%');
   readln();
End.








 

{11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. Informar:
? Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
? El avión que salió desde más países diferentes. FAAAAALTAAA HACERRRR
? La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
? La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.
}
program Hello;
const
    fin = 44;
type
    cadena20 = string[20];
    vuelo = record
        codigo:integer;
        paisSalida:cadena20;
        paisLlegada:cadena20;
        cantKm:real;
        porcentOcup:real;
    end;
function cumple1 (cantKmreco,ocupacion:real):integer;
begin
    if(cantKmreco > 5000) and (ocupacion < 0.6) then
        cumple:= 1
    else
        cumple:= 0;
end;
function cumple (km:real; paisDeLlegada:cadena20):integer;
begin
    if(km < 10000) and ((paisDeLlegada = 'AUSTRALIA') or (paisDeLlegada = 'NUEVA ZELANDA')) then
        cumple:= 1
    else
        cumple:= 0;
end;
procedure masKilometros(kmAct:real;var maxKm1,maxKm2:real; codigoAct: integer; var avionMax1,avionMax2:integer);
begin
    if (kmAct >maxKm1) then begin
        maxKm2:=maxKm1;
        avionMax2:=avionMax1;
        maxKm1:=kmAct;
        avionMax1::=codigoAct;
    end
    else if (kmAct > maxKm2) then begin
            maxKm2:=kmAct;
            avionMax1:=codigoAct;
    end;
end;

procedure menosKilometros(cantKmAct:real;var minKm1,minKm2:real; codigoAct:integer; var avionMin1,avionMin2:integer);
begin
    if (kmAct < minKm1) then begin
        minKm2:=minKm1;
        avionMin2:=avionMin1;
        minKm1:=cantKmAct;
        avionMin1::=codigoAct;
    end
    else if (cantKmAct < minKm2) then begin
            minKm2:=cantKmAct;
            avionMin2:=codigoAct;
    end;
end;
procedure (var v:vuelo);
begin
    with v do begin
        writeln('CODIGO:');
        readln(codigo);
        if (codigo <> fin) then begin
            writeln('PAIS DE SALIDA:');
            readln(paisSalida);
            writeln('PAIS DE LLEGADA:');
            readln(paisLlegada);
            writeln('CANTIDAD DE KM RECORRIDOS:');
            readln(cantKm);
            writeln('PORCENTAJE DE OCUPACION DEL AVION:');
            readln(porcentOcup);
        end;
    end;
end;

var
    vue:vuelo;
    maxKm1,maxKm2,minKm1,minKm2:real;
    ok,cantVuelos5000,cantLlegadaOc,oceania:integer;
begin
    maxKm1:=-1;                                                       avion 1
                                                                            ciudad A
                                                                            ciudad A
                                                                            ciudad B
                                                                            ciudad X     4 vuelos

                                                                      avion 2
                                                                            ciudad A
                                                                            cuiuda B     2 vuelos
    maxKm2:=-1;
    minKm1:=99999;
    minKm2:=99999;
    cantVuelos5000 :=0;
    cantLlegadaOc:=0;
    leerVuelo(vue);
    while (vue.codigo <> fin) do begin
        codActual=vue.codigo; //codigo actual del avion
        cantKm:=0;
        cantPaisDistinto:=0;
        while(vue.codigo <> fin) and  (codActual=vue.codigo) do begin //procesa el mismo avion
            salidaAct:= vue.paisSalida;
            while (vue.codigo <> fin) and (salidaAct= vue.paisSalida) do begin // una misma salida
                cantVuelos5000 := cantVuelos5000 + cumple (vue.cantKm, vue.porcentOcup);
                cantKm:=cantKm+vue.cantKM; //cuenta cant km total de un avion
                cantLlegadaOc := cantLlegadaOc + oceania(vue.cantKm, vue.paisLlegada);
                leerVuelo(vue);
            end;
            // CAMBIA DE PAIS DE SALIDA
            cantPaisDistinto:= cantPaisDistinto+1;
        end;
        // CAMBIO COD DE AVION
        masKilometros(cantKM,maxKm1,maxKm2,vue.codigo,avionMax1,avionMax2);
        menosKilometros(cantKM,minKm1,minKm2,vue.codigo,avionMin1,avionMin2);
        actualizarMaximoInciso2(cantPaisDistinto,....)

     end;

    writeln ('Los dos aviones que más kilómetros recorrieron son: ', avionMax2, ' y ', avionMax2);
    writeln ('los dos aviones que menos kilómetros recorrieron son: ', avionMin1, ' y ', avionMin2);
    imprimir max inciso 2

    writeln (cantVuelos5000,' vuelos fueron de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.');
    writeln (cantLlegadaOc,' vuelos fueron de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.');

end.





















