program eliminar_todas_ocurrencias_de_vector;
const
  dimF = 100;

type

  vector = array [1..dimF] of integer;

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

procedure imprimirVector(v:vector; dimL:integer);
var
  i:integer;
begin
  for i:=1 to dimL do
    writeln(v[i]);
end;



Procedure BorrarOcurrencias (var v: vector;  var dimL:integer; elem:integer);

   Procedure BorrarPosModif (var v:vector; var dimL:integer; pos:integer);
   var
     i: integer;
   begin
      for i:=pos+1 to dimL  do
         v[i-1] := v [i];
      dimL := dimL-1;
   end;

var
  i: integer;
Begin
  i:=1; //sirve para recorrer el vector

  while (i<=dimL)  do begin

     if(v[i] = elem)then   //si el numero del vector es el que busco -> entonces lo borro
       BorrarPosModif(v,dimL,i)  //borro el numero del vector
     else // si no borra el elemento -> avanzo
       i := i+1; //avanzo en el vector
  end;

end;
var
  dimL,num:integer;
  v:vector;
begin
  dimL:=0;
  cargarVector(v,dimL);
  writeln('el vector generado es:');
  imprimirVector(v,dimL);

  writeln('ingrese numero que quiere borrar todas sus ocurrencias en el vector:');
  readln(num);
  borrarOcurrencias(v,dimL,num);

  writeln('el vector modificado es:');
  imprimirVector(v,dimL);

  readln;
end.

