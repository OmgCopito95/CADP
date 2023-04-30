//EJERCICIO 7
{Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.}

program project1;
const
  dimF = 9;
type
   rango = 0..dimF;
   vector = array[rango] of integer;

procedure descomponerNumero(numero:integer; var v:vector);
var
  dig: integer;

begin
  while(numero <> 0)do begin
     dig := numero MOD 10; //me quedo con el digito

     v[dig]:=v[dig]+1; //sumo 1 a la pos del vector

     numero:=numero DIV 10; //sigo procesando el numero
  end;

end;

procedure imprimirVector(v:vector);
var
  i:rango;
begin
     for i:=0 to dimF do begin

     end;

end;

procedure inicializarVector(var v:vector);
var
   i:integer;
begin

  for i:=0 to dimF do begin
     v[i]:=0;
  end;

end;

procedure actualizarMaximo(numero:integer; i:rango; var max:integer; var digMasLeido:rango);
var
begin
    if(numero > max)then begin
        max:=numero;
        digMasLeido:=i;
     end;
end;

procedure recorrerVector(v:vector);
var
   max:integer;
   digMasLeido,i:rango;
begin
  max:=-1;
  for i:=0 to dimF do begin
     actualizarMaximo(v[i],i,max,digMasLeido);

     if v[i] > 0 then begin
      writeln('el digito ', i, ' aparecio ', v[i], ' veces.');
    end else
      writeln('el digito ', i, ' no tuvo ocurrencias.');

  writeln('el dig mas leido es ',digMasLeido);
end;

// PROGRAMA PRINCIPAL
var
  v:vector;
  num: integer;
begin
    inicializarVector(v);  //pone todo en 0 las posiciones del vector
    read(num); //leo un numero
    while(num <> -1)do begin

      descomponerNumero(num,v);

      read(num); //leo otro numero
    end;
    //si salgo del while el vector ya tiene los datos cargados

    recorrerVector(v);
end;


//-------------------------------------------- INCOMPLETO - REVISAR

{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

{Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).  }


program ejercicio8;
const
  dimF = 400;
type
   cadena20:string[20];

   alumno=record
     insc:integer;
     dni:integer;
     apellido:cadena20;
     nombre:cadena20;
     anio:integer;
   end;

   rango = 1..dimF;
   vector = array[rango] of integer;


procedure cargarVector(var v:vector;var dimL:integer;);
var

begin
  leerAlumno(a); //leo un alumno y cargo el registro
  while(a.dni<>-1) and (dimL<dimF) do begin
    dimL:=dimL+1; //incremento dimL porque agrego un nuevo elemento en el vector
    v[dimL]:=a;
    leerAlumno(a);
  end;

end;

procedure recorrerVector(v:vector; dimL:integer);
begin
  for i:=1 to dimL do begin  //recorro el vector hasta DIML

     //a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.

     v[i] -> alumno -> dni
     if(descomponerDni(v[i].dni))then
        cant:=cant+1;


     //b) Apellido y nombre de los dos alumnos de mayor edad.
     actualizarDosMaximos(max1,max2,nomMax1,nomMax2,apeMax1,apeMax2,v[i].edad,v[i].nombre,v[i].apellido)
  end;
end;

var
 v:vector;
 dimL:integer;
begin
   dimL:=0; //cant de elementos del vector
   cargarVector(v,dimL);

   recorrerVector(v,dimL);


end.



















