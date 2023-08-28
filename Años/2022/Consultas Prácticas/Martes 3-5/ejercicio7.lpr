{7. Realizar un programa que lea información de centros de
investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI),
la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen.

La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores,
que no debe procesarse.


Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.   }

program ejercicio7;
type

  cadena15: String[15];

  centro = record
    nombre: cadena15;
    universidad: cadena15;
    cantInvest: integer;
    cantBecarios: integer;
  end;


procedure leerCentro(var c: centro);
begin
  readln(c.cantInvest);
  if(c.cantInvest > 0)then begin
    readl(c.universidad)
    ...
  end;
end;

procedure actualizarMaximo(var nombMax:,var max:, uniActual, cant);

begin

  if (cant > max)then begin
    max:=cant;
    nombMax:=uniActual;
  end;

end;
var
  c:centro;
  uniActual: cadena15;
  cantCentroUniv: integer;
  max:integer;
  nombMax:cadena15;
begin

  leerCentro(c); //leo el registro
  while(c.cantInvest <> 0) do begin  //se ejecuta cuando cambia de universidad
     uniActual = c.universidad; //uni actual que se esta evaluando
     cantCentroUniv:=0;
     cantInvestTotal:=0;


     while(c.cantInvest <> 0) and (uniActual = c.universidad)do begin //centros de una misma universidad

        //proceso datos
        cantCentroUniv:=cantCentroUniv+1; //cuento la cantidad de centros de la uni
        cantInvestTotal:= cantInvestTotal + c.cantInvest;

        actualizarMinimos(min1,min2,nom1,nom2,c.nombre,c.cantBecarios);


        leerCentro(c);
     end;
     //salgo cuando cambio de universidad

     writeln('la universidad',uniActual,'tiene',cantCentroUniv,'centros');

     //Universidad con mayor cantidad de investigadores en sus centros.
     actualizarMaximo(nombMax,max,uniActual,cantInvestTotal);

  end;
  //termino de leer todos los datos

  writeln('la uni con mas invest es:',nombMax);
  writeln(nom1,nom2);
end.























