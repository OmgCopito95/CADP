{8- Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020.

De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y año de nacimiento.

Una vez leída y almacenada toda la información, calcular e informar:

a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.

b) Apellido y nombre de los dos alumnos de mayor edad.}



program clase;
const
  dimF = 400;  //400 son lo maximo que va a guardar
type

   cadena20: String[20];

   alumno = record      //representa 1 solo alumno
     nroInsc: integer;
     dni: integer;
     apellido: cadena20;
     nombre: cadena20;
     anioNac: integer;
   end;

   alumnoMaximo = record
     apellido: cadena20;
     nombre: cadena20;
     max: integer;
   end;

   vAlumnos = array [1..dimF] of alumno;  //guarda la info de los 400 alumnos

procedure leerAlumno(var a: alumno); //lee un solo registro alumno
begin
  readln(a.nroInsc);
  readln(a.dni);
  readln(a.apellido);
  readln(a.nombre);
  readln(a.anioNac);
end;

procedure cargarVector(var v: vAlumnos);  //mando el vector por referencia para que guarde los datos
var
  a: alumno;
  i: integer;
begin

  for i:=1 to dimF do begin //va de 1 a 400 porque se llena todo el vector

    //leerAlumno(v[i]); //lee un registro y lo guarda directamente en el vector

    leerAlumno(a); //leo un registro alumno
    v[i]:=a; //guardo el registro alumno en la posicion correspondiente
  end;


end;


function descomponerNumero(dni:integer):boolean;  //procesa el dni de un solo alumno
var
  cumple:boolean;

begin
  cumple:=true;

  while(dni <> 0) and (cumple) do begin
    dig:= dni mod 10; //guardo el digito

    if(dig mod 2 = 1)then //pregunto si el dig es impar
      cumple:=false;

    dni:=dni div 10; //achico el numero para seguir procesando
  end;

  descomponerNumero:= cumple; //devuelve true o false segun el dni del alumno

end;


                                 //max1,apeMax1,nomMax1     max2,apeMax2,nomMax2
procedure actualizarMaximos(    var a1:alumnoMaximo,    var a2: alumnoMaximo,         alum: alumno);
var
  edad: integer;
begin
     edad := 2022 - alum.anioNac;  //calcula la edad del alumno

     if(edad > a1.max)then begin
       a2.max := a1.max;
       a1.max := edad;

       a2.nombre:=a1.nombre;
       a2.apellido:=a1.apellido;

       a1.nombre:= alum.nombre;
       a1.apellido:=alum.apellido;

     end
     else
        if(edad > a2.max)then begin
          a2.max:=edad;
          a2.nombre:= alum.nombre;
          a2.apellido:= alum.apellido;
        end;
end;


procedure recorrerVector(v: vAlumnos; var cantDniPares:integer; var alumMax1,alumMax2:alumnoMaximo ); //lo mando por valor porque no necesito modificar el vector

begin

    for i:=1 to dimF do begin  //empiezo a recorrer el vector

      //a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
      // PORCENTAJE = cantDniPares * 100 / CANTIDAD ALUMNOS TOTAL=400

      if( descomponerNumero(v[i].dni) = true )then
         cantDniPares := cantDniPares + 1;

      //b) Apellido y nombre de los dos alumnos de mayor edad.
             //apeMax1 apeMax2 nomMax1 nomMax2 max1 max2
      actualizarMaximos(alumMax1,alumMax2, v[i]);

    end;

end;


var
  vectorAlumnos: vAlumnos; //declaro la variable del vector
  cantDniPares: integer;
  alumMax1,alumMax2: alumnoMaximo;


begin  //PROGRAMA PRINCIPAL

  cargarVector(vectorAlumnos); //de aca sale con el vector cargado de 400 alumnos

  cantDniPares := 0; //cuenta la cantidad de dnis que cumplen con el punto A

  alumMax1.max:=-999;
  alumMax2.max:=-999;


  recorrerVector(vectorAlumnos,cantDniPares,alumMax1,alumMax2);

  writeln('El porcentaje de alumnos con dni con dig pares es', cantDniPares * 100 / dimf);
  writeln('el alumno mas grande es', alumMax1.nombre, alumMax1.apellido);
  writeln('el segundo alumno mas grande es', alumMax2.nombre, alumMax2.apellido );

end.








