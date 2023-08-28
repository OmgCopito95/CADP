program project1;

type
  cadena_20 = string[20];
  centro = record
    nombre: cadena_20;
    universidad: cadena_20;
    cantInvestigadores: integer;
    cantBecarios: integer;
  end;

procedure leoDatosCentro(var c: centro);
begin
  writeln('ingrese la cantidad de investigadores que posee');
  readln(c.cantInvestigadores);
  if (c.cantInvestigadores > 0) then begin
    writeln('ingrese nombre');
    readln(c.nombre);
    writeln('ingrese la universidad a la que pertenece');
    readln(c.universidad);
    writeln('ingrese la cantidad de becarios que posee');
    readln(c.cantBecarios);
  end;
end;

procedure actualizarMax(var uMax: cadena_20; var max: integer; uActual: cadena_20; cantI: integer);
begin
  if (cantI > max) then begin
    max:= cantI;
    uMax:= uActual;
  end;
end;

procedure actualizarMin(var min1, min2: integer; var centroM1, centroM2: cadena_20; nombreCentro: cadena_20; becarios: integer);
begin
  if (becarios < min1) then begin
    min2:= min1;
    centroM2:= centroM1;
    min1:= becarios;
    centroM1:= nombreCentro;
  end
  else begin
    if (becarios < min2) then begin
      min2:= becarios;
      centroM2:= nombreCentro;
    end;
  end;
end;

{programa principal}
var
  c: centro;
  cantTotalCentrosUni, cantTotalInvCentUni, max, min1, min2, cantTotalBecarios: integer;
  uniActual, uniMax, centroMin1, centroMin2: cadena_20;
begin
  max:= -1;
  min1:= 32767;
  min2:= 32767;
  leoDatosCentro(c);
  while (c.cantInvestigadores > 0) do begin  //analiza cada universidad

    cantTotalCentrosUni:= 0; //centros por univ

    cantTotalInvCentUni:= 0; //investig por univ

    uniActual:= c.universidad;


    while ( (c.cantInvestigadores > 0) and (c.universidad = uniActual)) do begin  // lee centros de una misma universidad


      cantTotalCentrosUni:= cantTotalCentrosUni + 1 ;  //suma 1 a la cant de centro de la universidad actual

      cantTotalInvCentUni:= cantTotalInvCentUni + c.cantInvestigadores; //incremento la cant de investg de la univ

      //cantTotalBecarios:= 0;
      //cantTotalBecarios:= 0 + c.cantBecarios;

      actualizarMin(min1,min2, centroMin1, centroMin2, c.nombre, c.cantBecarios);

      leoDatosCentro(c);   //leo otro centro
    end;
    //cuando salgo del while significa que cambio de universidad

    actualizarMax(uniMax, max, uniActual, cantTotalInvCentUni);


    writeln('--------------------------RESULTADO OBTENIDO------------------');
    writeln('la cantidad total de centros de la Universidad,  ', uniActual, '  es  ', cantTotalCentrosUni);

  end;
  writeln('------------------RESULTADOS OBTENIDOS--------------------------');
  writeln('la universidad con mayor cantidad de investigadores en su centro es:  ', uniMax);
  writeln('los dos centros con menor cantidad de becarios son  ', centroMin1, '  y  ', centroMin2);
  readln();
end.


 //---------------------------------------------------------//


program prac3rj8;

type
  cadena_30 = string[30];
  docente = record
    dni: integer;
    nombre: cadena_30;
    apellido: cadena_30;
    email: cadena_30;
  end;
  proyecto = record
    codigo: integer;
    titulo: cadena_30;
    doc: docente;
    cantAlum: integer;
    nombreEsc: cadena_30;
    localidad: cadena_30;
  end;

procedure leoDatosDoc(var d: docente);
begin
  writeln('ingrese el dni del docente');
  readln(d.dni);
  writeln('ingrese el nombre del docente');
  readln(d.nombre);
  writeln('ingrese el apellido del docente');
  readln(d.apellido);
  writeln('ingrese el email del docente');
  readln(d.email);
end;

procedure leoDatosProy (var p: proyecto; {d: docente});
begin
  writeln('ingrese un codigo');
  readln(p.codigo);
  if (p.codigo <> -1) then begin
    writeln('ingrese el titulo del proyecto');
    readln(p.titulo);
    leoDatosDoc(p.doc);
    writeln('ingrese la cantidad de alumnos que participan del proyecto');
    readln(p.cantAlum);
    writeln('ingrese el nombre de la Escuela');
    readln(p.nombreEsc);
    writeln('ingrese la localidad de la Escuela');
    readln(p.localidad);
  end;
end;

procedure actualizarMaximos(var nombMax1, nombMax2: cadena_30; var max1, max2: integer; alum: integer; nombEscActual: cadena_30);
begin
  if ( alum > max1) then begin
    max2:= max1;
    nombMax2:= nombMax1;
    max1:= alum;
    nombMax1:= nombEscActual;
  end
  else begin
    if (alum > max2) then begin
      max2:= alum;
      nombMax2:= nombEscActual;
    end;
  end;
end;

function cumpleIncisoC(codigo, cantDigP, cantDigI: integer): boolean;
var
  dig: integer;
begin
  while (codigo <> 0) do begin
    dig:= codigo mod 10;      {me quedo con el ultimo digito del codigo}
    if (dig mod 2 = 0) then   {si es par, sumo a la cantidad de digitos pares}
      cantDigP:= cantdigP + 1
    else
      cantDigI:= cantdigI + 1;    {si no es par, sumo a la cantidad de digitos impares}
    codigo:= codigo div 10;   {divido a 10 el codigo para analizar el digito siguiente}
  end;
  cumpleIncisoC:= (cantDigP = cantDigI);
end;

{programa principal}
var
  tproyecto: proyecto;
  //tdocente: docente;
  cantTotalEsc2020, max1, max2, cantAlumPorEsc, cantDigPares, cantDigImpares: integer;
  nombreMax1, nombreMax2, escActual: cadena_30;
begin
  cantTotalEsc2020:= 0;
  max1:= -1;
  max2:= -1;

  leoDatosProy(tproyecto{, tdocente});


  while (tproyecto.codigo <> -1) do begin  //lee proyectos de diferente localidad

    cantTotalEsc2020:= cantTotalEsc2020 + 1; //cuento cada escuela

    escActual:= tproyecto.nombreEsc;
    cantAlumPorEsc:= 0;
    cantDigPares:= 0;
    cantDigImpares:= 0;

    if (tproyecto.localidad = 'Daireaux') then begin    {en este caso hace falta un begin end?}
      if cumpleIncisoC(tproyecto.codigo, cantDigPares,cantDigImpares) then begin
        writeln('------------RESULTADO OBTENIDO-------------------');
        writeln('el titulo del proyecto es   ', tproyecto.titulo);
      end;
    end;

    //falta bucle para chequear localidad

      //por cada localidad chequeo escuelas
      while ((tproyecto.codigo <> -1) and (escActual = tproyecto.nombreEsc)) do begin  //los proyectos de una misma escuela
        cantAlumPorEsc:= cantAlumPorEsc + tproyecto.cantAlum;
        leoDatosProy(tproyecto, tdocente);
      end;

    actualizarMaximos(nombreMax1, nombreMax2, max1, max2, cantAlumPorEsc, escActual);

  end;


  writeln('------------------RESULTADOS OBTENIDOS----------------------------------');
  writeln('la cantidad total de escuelas que participaron de la convocatoria 2020 son  ', cantTotalEsc2020);
  writeln('los nombres de las dos escuelas con mayor cantidad de alumnos participantes son  ', nombreMax1, '  y  ', nombreMax2);
end.


 //--------------------------------------------



program prac3Adicionalej9;

type
  cadena_30 = string[30];
  candidato{s} = record
    localidad: cadena_30;
    apellido: cadena_30;
    cantVotosObtenidos: integer;
    cantVotantes: integer;
  end;

procedure leoDatos(var c: candidatos);
begin
  writeln('ingrese la localidad del candidato');
  readln(c.localidad);
  writeln('ingrese el apellido del candidato');
  readln(c.apellido);
  writeln('ingrese la cantidad de votos obtenidos del candidato');
  readln(c.cantVotosObtenidos);
  writeln('ingrese la cantidad de votantes de la localidad');
  readln(c.cantVotantes);
end;

procedure actualizarMax(var max: integer; var apellidoMax: cadena_30; votos: integer; apellidoActual: cadena_30 );

begin
  if (votos > max) then begin
    max:= votos;
    apellidoMax:= apellidoActual;
  end;
end;

procedure actualizarMaxPorcentaje(porcentaje: real; var porcentajeMax: real; var maxApellido: cadena_30; apellidoActual: cadena_30 );
begin
  if (porcentaje > porcentajeMax ) then begin
    porcentajeMax:= porcentaje;
    maxApellido := apellidoActual;
  end;
end;

{programa principal}
var
  tcandidatos: candidatos;
  max: integer;
  apellidoMax, apellidoMaxPorcentaje: cadena_30;
  porcentaje, porcentajeMax: real;

begin
  max:= -1;
  porcentajeMax:= -1;
  repeat
    leoDatos(tcandidatos);

    actualizarMax(max, apellidoMax, tcandidatos.cantVotosObtenidos, tcandidatos.apellido);

    porcentaje:= tcandidatos.cantVotosObtenidos / tcandidatos.cantVotantes * 100;

    actualizarMaxPorcentaje(porcentaje, porcentajeMax, apellidoMaxPorcentaje, tcandidatos.apellido);

  until (tcandidatos.localidad = 'Zarate');

  writeln('-----------------RESULTADOS OBTENIDOS----------------------');
  writeln('el intendente que obtuvo la mayor cantidad de votos en la eleccion fue  ', apellidoMax);
  writeln('el intendente que mayor porcentaje de votos tuvo en la eleccion fue  ', apellidoMaxPorcentaje);

end.


 //-----------------------------------------------------


 // REVISAR EJERCICIO, FALTAN VARIAS CONSIDERACIONES

program prac3Adicionalej10;

type
  cadena30 = string[30];
  especie = record
    nombre: cadena30;
    tiempoPromVida: integer;
    tipo: cadena30;
    clima: cadena30;
    {cantPaises: integer;}
    paises: cadena30;
  end;

procedure leoDatosPais(var pais: integer);
begin
  writeln('ingrese los paises donde se las encuentra ');
  readln(p.paises);
  while (p.paises <> 'zzz') do begin
    writeln('ingrese los paises donde se las encuentra ');
    readln(p.paises);
  end;

end;

procedure leoDatos(var p: planta);
begin
    writeln('ingrese el nombre de la planta');
    readln(p.nombre);
    writeln('ingrese el tiempo promedio de vida de la planta');
    readln(p.tiempoPromVida);
    writeln('ingrese el tipo de planta');
    readln(p.tipo);
    writeln('ingrese el clima');
    readln(p.clima);
    //leoDatosPais(p.paises);
  end;
end;

procedure actualizarMin(var min: integer; plantas: integer; var tipoActual, tipoMin: cadena30);
begin
  if (plantas < min) then begin
    min:= plantas;
    tipoMin:= tipoActual;
  end;
end;

procedure actualizarMaximos (var max1, max2: integer; var nombreMax1, nombreMax2: cadena30; tiempo: integer; nombreActual: cadena30);
begin
  if (tiempo > max1) then begin
    max2:= max1;
    nombreMax2:= nombreMax1;
    max1:= tiempo;
    nombreMax1:= nombreActual;
  end
  else begin
   if (tiempo > max2) then begin
     max2:= tiempo;
     nombreMax2:= nombreActual;
   end;
  end;
end;

procedure actualizarMaxPais(cantPaises: integer; var nombrePlantasMax: cadena30; maxPais: integer; nombrePlantaActual: cadena30);

begin
  if (cantPaises > maxPais) then begin
    maxPais:= cantPaises;
    nombrePlantasMax:= nombrePlantaActual;
  end;
end;

{programa principal}
var
  i, min, cantPlantas, max1, max2, cantPaises, maxPais: integer;
  tplanta: planta;
  tipoPlantaActual, tipoMin, nombreMax1, nombreMax2, nombrePlantaMax: cadena30;

begin
  min:= 32767;
  max1:= -1;
  max2:= -1;
  maxPais:= -1;
  for i:= 1 to 320 do begin  //especies de plantas o "plantas"

    cantPaises:= 0;
    leoDatos(tplanta);
    tipoPlantaActual:= tplanta.tipo;


    writeln('-----------Resultado Obtenido------------');
    writeln('el tiempo promedio de vida de la planta  ', tplantas.nombre, 'de tipo  ', tplantas.tipo, 'es  ', tplantas.tiempoPromVida);

    nombrePlantaActual:= tplanta.nombre;

    cantPlantas:= 0;


    while ((tipoPlantaActual= tplanta.tipo)) do begin  //analiza las plantas de un mismo tipo
      cantPlantas:= cantPlantas + 1; //cuento cant de plantas del mismo tipo

      actualizarMaximos(max1, max2, nombreMax1, nombreMax2, tplantas.tiempoPromVida, tplantas.nombre);

      while ( tplantas.paises <> 'zzz') do begin  //El nombre de la planta que se encuentra en más países.
        cantPaises:= cantPaises + 1;

        if ( (tplantas.paises = 'Argentina' and (tplantas.clima = 'subtropical') ) then begin
             writeln('------------------------------------RESULTADO OBETENIDO----------------------------------');
             writeln('la planta  ', tplantas.nombre, '  es nativa de Argentina que se encuentra en regiones con clim subtropical');
        end;

        read(pais);
      end;

      leoDatos(tplanta);
      actualizarMaxPais(cantPaises, nombrePlantaMax, maxPais, nombrePlantaActual);
    end;


    actualizarMin(min, cantPlantas, tplantas.tipo, tipoMin);
  end;


  writeln('-----------------RESULTADOS OBTENIDOS----------------------');
  writeln('el tipo de plantas con menor cantidad de plantas es  ', tipoMin);
  writeln('los dos nombres cientificos de las plantas mas longevas son  ', nombreMax1, '  y  ', nombreMax2);
  writeln('el nombre de la planta que se encuentra en mas paises es  ',nombrePlantaMax);
  readln();
end.










