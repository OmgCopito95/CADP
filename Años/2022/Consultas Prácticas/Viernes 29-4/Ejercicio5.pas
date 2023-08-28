{Realizar un programa que lea información de autos que están a la venta en una concesionaria.
De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program Ejercicio5;
type

  cadena20 = string[20];

  auto = record
    marca: cadena20;
    modelo: cadena20;
    precio: real;
  end;


procedure leerAuto(var a:auto);
begin
  read(a.marca);
  if(a.marca <> 'ZZZ')then begin
    read(a.modelo);
    read(a.precio);
  end;
end;

var
  a: auto;
  marcaActual: cadena20;
  autoMaximo:auto;
  precioTotalMarca: real;
  cantTotalAutosPorMarca: integer;
begin

  autoMaximo.precio:=-999;

  leerAuto(a);
  while(a.marca <> 'ZZZ') do begin // empieza a analizar una nueva marca

    marcaActual:= a.marca;
    cantTotalAutosPorMarca:=0;
    precioTotalMarca:=0;

    while(a.marca = marcaActual)do begin    //procesa info de la misma marca
       //El precio promedio por marca
       cantTotalAutosPorMarca:=cantTotalAutosPorMarca+1;
       precioTotalMarca:=precioTotalMarca + a.precio;

       compararMaximo(a,autoMaximo);
       leerAuto(a);
    end;
    // cuando sale del while significa que cambio de marca
    writeln(precioTotalMarca / cantTotalAutosPorMarca);

  end;

   writeln(autoMaximo.marca,autoMaximo.modelo);


end. //fin programa principal



{Realizar un programa que lea información de los candidatos ganadores
de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad,
apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza
al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}


program ejercicioAdicional;

type
  cadena15 = String[15];

  candidato = record
    localidad: cadena15;
    apellido:  cadena15;
    cantVotos: integer;
    cantVotantes: integer;
  end;

//procesos
procedure calcularMaximo(  var ,var, var);
begin



end;


var
  c: candidato;


begin
  maxVotos:=-999;

  repeat
    leoCandidato(c);
     //El intendente que obtuvo la mayor cantidad de votos en la elección.
    calcularMaximo(c.cantVotos,c.apellido,c.localidad, maxVotos,maxApellido,maxLocalidad);

    //El intendente que obtuvo el mayor porcentaje de votos de la elección.
    calcularPromedioMaximo(c.cantVotos * 100 / c.cantVotantes,c.apellido,c.localidad, maxVotos,maxApellido,maxLocalidad)


  until(localidad = 'Zárate');

  writeln('imprimo el candidato con mas votos',maxApellido,maxLocalidad);
  writeln('imprimo max promedio,...datos del candi');
end.

















