//----------------------------- EJEMPLO ------------------------------------------------
program project1;
const
  dimF=5;
type
  vector=array [1..dimF] of integer;
procedure cargar(var v:vector;var dimL:integer;elemento:integer);
begin
  writeln('Introducir elemento numerico');
  readln(elemento);
  while (dimL<dimF) and (elemento<>5) do begin
    dimL:=dimL+1;
    v[dimL]:=elemento;
    writeln('Introducir elemento numerico');
    readln(elemento);
  end;
end;

procedure agregar(var v:vector;var dimL:integer; elemento:integer; var exito:boolean);
begin
  exito:=false;
  if (dimL<dimF) then begin
    exito:=true;
    dimL:=dimL+1;
    v[dimL]:=elemento;
  end;
end;

var
  elemento,dimL:integer;
  v:vector;
  exito:boolean;
begin
  exito:=true;
  dimL:=0;
  cargar(v,dimL,elemento); //carga elementos -> dimL
  agregar(v,dimL,7,exito);
  if(exito)then
    writeln('lo agregó');
  else
    writeln('no habia espacio en el vector');

  writeln('El ultimo elemento del vecto es: ',v[dimL]);
  readln()
end.



 // --------------------------------------------------------------------


Program ejer14;
Const
  dimF = 1000;

Type
   str10 = string[10];

   r_participante = record
         pais: str10;
         codigo: 1..dimF;
         nomProy: str10;
         rol: 1..5;
         horas: integer;
   end;

   r_contador = record
        Minimo:real; //momnto total del proyecto
        Arqui: integer; //cant arqui del proyecto
   end;

  v_tabla = array [1..5] of real; //SE DISPONE

  v_proyecto = array [1..dimF] of r_contador;


Procedure LEER_PARTICIPANTE(VAR p: r_participante);
Begin
   with p do begin
     writeln('Ingrese codigo: ');
     readln(codigo);
     If (codigo <> -1) then begin
         writeln('Ingrese el pais de residencia: ');
         readln(pais);
         writeln('Ingrese el nombre del proyecto: ');
         readln(nomProy);
         writeln('Ingrese el rol del participante (de 1 a 5)');
         readln(rol);
         writeln('Ingrese la cantidad de horas trabajadas');
         readln(horas);
     end;
   end;
End;


{Procedure CARGA_TABLA (VAR v:v_tabla);        //SE DISPONE ASIQUE NO HAY QUE IMPLEMENTARLO
Begin
   v[1]:= 35.20;
   v[2]:= 27.45;
   v[3]:= 31.03;
   v[4]:= 44.28;
   v[5]:= 39.87;
End; }


Procedure INICIALIZAR (VAR vc:v_proyecto);
Var
  j:integer;
Begin
  For j:= 1 to dimF do begin
      vc[j].Minimo:= 0;
      vc[j].Arqui:= 0;
  end;
End;



Function ResidenciaArg(PaisRes:str10; tipoRol:integer; v:v_tabla; cantHoras:integer): real;
Begin
    If (PaisRes = 'ARGENTINA') then
        ResidenciaArg:= v[tipoRol] * cantHoras;
End;



Function Admin (tipoRol: integer): boolean;
Begin
   Admin:= (tipoRol = 3);
End;


Procedure ContadorAdmin (tipoRol:integer; VAR horasTotalesAdmin:integer; totalHoras:integer);
Begin
    If (Admin(tipoRol)) then
       horasTotalesAdmin:=  horasTotalesAdmin + totalHoras;
End;


Procedure MINMONTO (MinMonto:real; VAR min: real; dimL: integer; VAR codMin:integer);
Begin
   If (MinMonto < min) then begin
      min:= MinMonto;
      codMin:= dimL;
   end;
End;


Function ESARQUI (tipoRol:integer): integer;
Begin
    If (tipoRol = 4) then
       ESARQUI:= 1
    Else
       ESARQUI:= 0;
End;



Var
p: r_participante;
v:v_tabla;
vc:v_proyecto;
dimL: integer;
Argentina,min: real;
codActual,horasTotalesAdmin,codMin: integer;
Begin
    Argentina:=0;
    horasTotalesAdmin:= 0;
    min:= 999999;
    dimL:= 0;

    CARGA_TABLA(v);  //SE DISPONE
    INICIALIZAR (vc);
    LEER_PARTICIPANTE(p);

    while (p.codigo <> -1) do begin

         vc[p.codigo].Minimo:= vc[p.codigo].Minimo + (v[p.rol]*p.horas);   // MONTO TOTAL POR CODIGO
         vc[p.codigo].Arqui:= vc[p.codigo].Arqui + ESARQUI(p.rol);       // INCISO C

         Argentina:= Argentina + ResidenciaArg(p.pais,p.rol,v,p.horas);
         ContadorAdmin (p.rol,horasTotalesAdmin,p.horas);

         writeln;
         LEER_PARTICIPANTE(p);
    end;
    recorrerVector (...); // TIENE QUE IMPRIMIR LA CANT DE ARQUITECTOS Y CALCULAR EL MIN, ASI SE RECORRE UNA SOLA VE

    //INFORMAR

    readln();
End.


//---------------------------------------------------------------------------------------------


// VECTOR DE VECTORES - los dos con dimL

type

  v_notas = array [1..5] of integer;

  r_notas = record
       dimL:integer; //cuantas notas guardo
       notas: v_notas;
  end;

  alumnos =  array [1..10] of r_notas;


procedure cargarVectorAlumnos(var va:alumnos; var dimLAlumnos:integer);
var
   dimLNota:integer;
begin

  while (dimLAlumnos < dimF) and (...corte...) do begin

     dimLAlumnos:=dimLAlumnos+1; //agrega un alumno

     dimLNota:=0;                                        //el vector de notas empieza sin notas - variable auxiliar
     read(nota);
     while (dimLNota < dimF) and (nota<>-1) do begin     //notas por alumno
       dimLNota:=dimLNota+1;                             //incremento la dimL del vector de notas
       va[dimLAlumnos].notas[dimLNota] := nota;          //agrega las  notas al alumno en la posicion dimL
       read(nota);
     end;
     //terminó de cargar notas del alumno
     va[dimLAlumnos].dimL:=dimLNota;                     //guardo la dimL del vector de notas del alumno
  end;

end;

// modulo para imprimir todas las notas de cada uno de los alumnos
procedure  imprimirNotas(va:alumnos; dimLAlumnos:integer);
begin

    for(i:=1 to dimLAlumnos)do begin   //recorre el vector de alumnos
      for(j:=1 to va[i].dimL)do begin  //recorre el vector de notas del alumno i
        writeln(va[i].notas[j]);
      end;
    end;
end;

var
  va:alumnos;

begin
  dimLAlumnos:=0;
  cargarVector(va,dimLAlumnos);
  imprimirNotas(va,dimLAlumnos);
end;





//---------------------------------CORREGIR!!
program ej13;

const
    anio_0=1971; //2021 - 50
type
    vector = array [1..100] of real;

procedure actualizarMaxTotal(temp:real; j:integer; VAR punto:integer; VAR maxTotal:real);
begin
    if temp > maxTotal then begin
        maxTotal:=temp;
        punto:=j;
    end;
end;

procedure actualizarMax(promedio:real; VAR maxPromedio:real);
begin
    if promedio > maxPromedio then
        maxPromedio:=promedio;
end;
var
    i,j,punto,anio_actual:integer;
    promedio,maxPromedio,maxTotal,temp,sumador:real;
begin
    maxTotal:=-273;
    punto:=0;
    for i:=1 to 50 do begin
        anio_actual:=anio_0+i;
        writeln('ingrese la informacion del anio: ',anio_actual);
        sumador:=0;
        for j:=1 to 100 do begin
            writeln('ingrese la temperatura del punto: ',j,' correspondiente al anio: ',anio_actual);
            readln(temp);
            vector[j] := temp;
            sumador:=sumador+temp;
            actualizarMaxTotal(temp,j,punto,maxTotal);
        end;
    promedio:=sumador/100;
    actualizarMax(promedio,maxPromedio);
    end;
    writeln(maxPromedio);
    writeln(maxTotal);
end.










