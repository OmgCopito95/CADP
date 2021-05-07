{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un 
valor n y retorne si n se encuentra en el vector o no. 
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera 
ascendente.}

program ejemplo;

const

  dimF = 50;

type
  
  vector = array [1..dimF] of integer;
   
//bsqueda secuencial -> cuando el vector esta desordenado
function busquedaLineal (v:vector; dimL:integer; x:integer):boolean;
var
  pos:integer;
  exito: boolean;
begin
   pos:=1; //para ir recorriendo el vector
   exito:= false;
   while (pos <= dimL) and (not exito) do begin  //mientras la pos sea válida, y no lo encontré, avanza
        if (x = v[pos]) then
          exito:= true
        else
          pos:=pos+1; //avanza con la posicion
   end;
   busquedaLineal := exito;
end;

//busqueda en un vector ordenado -> busqueda dicotomica
Function busquedaBinaria (v:Vector; dimL: integer; x: integer): integer;
var
    pos : integer;
begin
    pos:=1;

    while (pos <= dimL) and (x > v[pos]) do //cuando esta ordenado de menor a mayor
       pos:=pos+1;

    if ( pos > dimL ) or (x < v [pos]) then
       pos:=0;

    busquedaBinaria := pos; //si pos=0 entonces no lo encontró
end;


//carga de vector cuando no se si se va a llenar o no
procedure cargarVector(var v:vector; var dimL:integer);
var
  num:integer;
begin

  read(num);
  while(num<>0) and (dimL < dimF) do begin
    dimL := dimL + 1;
    v[dimL] := num;
    read(num);
  end;
end;


var

  v: vector;
  dimL,num: integer;
    
begin

  dimL := 0; 
  cargarVector(v,dimL); //ya se dispone. se implementó para probar el programa
  
  writeln('ingrese numero a buscar');
  readln(num);
  writeln('el numero está en el vector?:',busquedaLineal(v,dimL,num)); //busco el numero 5 en el vector
  
  if (busquedaBinaria(v,dimL,num) <> 0)then 
    writeln('el numero esta en el vector');
end.








