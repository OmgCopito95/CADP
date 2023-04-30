{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).  }

program ejercicio8;

const
  dimF = 400; // cantidad maxima de alumnos

type
  cadena20 = string[20];

  alumno = record
    insc: integer;
    dni: integer;
    apellido: cadena20;
    nombre: cadena20;
    anio: integer;
  end;

  rango = 1..dimF;
  vector = array[rango] of alumno;

procedure leerAlumno(var a:alumno);
begin
  writeln('Ingrese DNI: ');
  readln(a.dni);
  if(a.dni<>-1) then begin // si el dni es -1 no lo procesa porque dice que no debe procesarse
    writeln('Ingrese nro de inscripcion: ');
    readln(a.insc);
    writeln('Ingrese apellido: ');
    readln(a.apellido);
    writeln('Ingrese nombre: ');
    readln(a.nombre);
    writeln('Ingrese año de nacimiento: ');
    readln(a.anio);
  end;
end;

procedure cargarVector(var v: vector; var dimL: integer);
var
   a: alumno;
begin
   leerAlumno(a); // leo el primer alumno
   while (a.dni <> -1) and (dimL < dimF) do begin // si no es dni -1 y no se llenó el vector
      dimL := dimL + 1; // incremento la dimension logica
      v[dimL] := a; // guardo el alumno en la posicion dimL
      leerAlumno(a); // leo el siguiente alumno
   end;
end;

procedure actualizarDosMaximos(var max1, max2: integer; var nomMax1, nomMax2, apeMax1, apeMax2: cadena20; edad: integer; nombre, apellido: cadena20);
begin
  if edad > max1 then begin // si la edad es mayor a max1
    max2 := max1; // guardo todos los valores de max1 en max2
    nomMax2 := nomMax1;
    apeMax2 := apeMax1;
    max1 := edad;
    nomMax1 := nombre;
    apeMax1 := apellido;
  end
  else if edad > max2 then begin // si la edad es mayor a max2
    max2 := edad; // guardo todos los valores de max2 en max2
    nomMax2 := nombre;
    apeMax2 := apellido;
  end;
end;

function dniSoloPares(dni: integer): boolean; // funcion para ver si el dni es solo pares y devuelve V o F
var
  dig: integer;
  soloPares: boolean;
begin
    soloPares := true; // inicializo el booleano en true para cortar el while si hay un digito impar y no seguir recorriendo el dni
    while (dni <> 0) and (soloPares) do begin
        dig := dni mod 10; // tomo el ultimo digito del dni
        if (dig mod 2 <> 0) then // si el digito es impar
            soloPares := false; // pongo el booleano en false
        dni := dni div 10; // saco el ultimo digito del dni
    end;
    dniSoloPares := soloPares; // devuelvo el booleano
end;


procedure recorrerVector(v: vector; dimL: integer);
var
  i, edad, max1, max2: integer;
  porcentajeDniPares: real;
  apeMax1, nomMax1, apeMax2, nomMax2: cadena20;
begin
    porcentajeDniPares := 0; // inicializo el contador en 0
    max1:=-1;
    max2:=-1;

    for i:=1 to dimL do begin
        if(dniSoloPares(v[i].dni)) then //hago una funcion para ver si el dni es solo pares
          porcentajeDniPares := porcentajeDniPares + 1; // si es solo pares incremento el contador

        //calculo la edad del alumno porque no la tengo. solo tengo anio de nacimiento
        edad := 2023 - v[i].anio;

        actualizarDosMaximos(max1, max2, nomMax1, nomMax2, apeMax1, apeMax2, edad, v[i].nombre, v[i].apellido);
    end;

    porcentajeDniPares := (porcentajeDniPares * 100) / dimL; // calculo el porcentaje de alumnos con dni solo pares

    // IMPRIMIR EN EL PROGRAMA PRINCIPAL. HAY QUE PASAR TODOS LOS PARAMETROS QUE SE IMPRIMEN POR PARAMETRO POR REFERENCIA
    writeln('El porcentaje de alumnos con DNI compuesto sólo por dígitos pares es: ', porcentajeDniPares:2:2);
    writeln('El alumno de mayor edad es: ', nomMax1, ' ', apeMax1);
    writeln('El alumno de segunda mayor edad es: ', nomMax2, ' ', apeMax2);

end;

var
  v: vector;
  dimL: integer;

begin
  dimL := 0; // inicializo la dimension logica en 0 porque al principio el vector no tiene elementos
  cargarVector(v, dimL);
  recorrerVector(v, dimL);
  readln;
  readln;
end.