{2. Realice un programa que resuelva los siguientes incisos:
a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza 
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.
b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.
c. Lea un nombre y lo inserte en la posición 4 del vector.
d. Lea un nombre y lo agregue al vector.
Nota: Realizar todas las validaciones necesarias.}

program ej2;
const
  dimF = 50;
type
  cadena20 = String[20];
  vector = array [1..dimF] of cadena20;


procedure cargarVector(var v:vector; var dimL:integer);
var
  nom:cadena20;
begin

  read(nom);
  while(nom<>'ZZZ') and (dimL < dimF) do begin
    dimL := dimL + 1;
    v[dimL] := nom;
    read(nom);
  end;
end;


Procedure BorrarElem (var v: vector;  var dimL:integer; elem:cadena20; var exito: boolean);

    Function BuscarPosElem (x:cadena20; v:vector; dimL:integer):integer;
    var
      pos: integer;
      exito: boolean;
    Begin
         pos:=1;
         exito:= false;

         while (pos <= dimL) and (not exito) do
              if (x = v[pos]) then
                 exito := true
              else
                 pos:= pos + 1;

         if (exito = false) then
            pos:=0;

         BuscarPosElem := pos;
    end;

   Procedure BorrarPosModif (var v:vector; var dimL:integer; pos:integer);
   var
     i: integer; 
   begin
      for i:=pos+1 to dimL  do
         v[i-1] := v [i];
      dimL := dimL-1;
   end;

var
  pos: integer;
Begin
  exito:= False;
  pos:= BuscarPosElem (elem, v, dimL);
  if pos <> 0 then begin
    BorrarPosModif(v,dimL,pos);
    exito:= true;
  end;
end;

procedure imprimirVector(v:vector; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do
    writeln(v[i]);
end;



Procedure insertarEnPosicion (var v:vector; var dimL: integer; elemento: cadena20; pos: integer; var exito: boolean);
var
  i : integer;
Begin
   exito := false;
   if (dimL < dimF) and ((pos >= 1) and (pos <= dimL)) then begin  //verifica que haya lugar y que la posicion que le manden sea válida
     exito:= true;
     for  i:= dimL downto pos do
         v[i+1] := v[i] ;       //hace el corrimiento para la derecha
     v[pos] := elemento;
     dimL := dimL + 1;
   end;
end;


Procedure AgregarElemento (var v: vector; var dimL: integer; elemento: cadena20; var exito: boolean);
begin
     exito:= false; //para decir si se pudo agregar o no

     If (dimL < dimF) then begin   //verifica si hay espacio en el vector
       exito:= true; //se pudo agregar
       dimL:= dimL+1; // primero se incrementa dimL
       v [dimL]:= elemento;  //despues se guarda el elemento en el vector
    end;
end;



var
  ok: boolean;
  nombre: cadena20;
  dimL:integer;
  v:vector;


begin
  dimL := 0;
  cargarVector(v,dimL); //a

  //------------------------------
  
  writeln('eliminar primera ocurrencia de:');
  read(nombre);
  
  BorrarElem(v,dimL,nombre,ok); //b
  
  if (ok) then
    writeln('se borro la primera ocurrencia de ',nombre)
  else
    writeln('no se pudo eliminar la primera ocurrencia de ',nombre);
   
  imprimirVector(v,dimL);
  
  //-------------------------------
   
  writeln('ingrese nombre a insertar en la pos 4');
  readln(nombre);
  
  insertarEnPosicion(v,dimL, nombre,4,ok); //c
  if(ok)then
    writeln('se inserto correctamente')
  else
    writeln('no pudo insertarse');
  
  imprimirVector(v,dimL);
  
  //--------------------------------
    
  writeln('ingrese nombre a agregar en el vector');
  readln(nombre);
  
  AgregarElemento(v,dimL, nombre,ok);
  if(ok)then
    writeln('se agrego correctamente')
  else
    writeln('no pudo agregarse');
  
  imprimirVector(v,dimL);
  
  readln;
end.









