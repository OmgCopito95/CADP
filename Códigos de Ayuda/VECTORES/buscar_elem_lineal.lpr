//BUSCAR ELEMENTO EN UN VECTOR -> DEVUELVE LA POSICION

Function BuscarPosElem (x:integer;v:vector;dimL: integer): integer;
var
  pos:integer;
  exito: boolean;
Begin
   pos:=1;
   exito:= false;
   while (pos <= dimL) and (not exito) do begin  //mientras la pos sea válida, y no lo encontré, avanza
        if (x = v[pos]) then
          exito:= true
        else
          pos:=pos+1; //avanza con la posicion
   end;
   if (exito = false) then
     pos:=0; //devuelve pos=0 para decir que no existe
   BuscarPosElem := pos;
end;

