// BUSCAR ELEMENTO EN VECTOR ORDENADO -> DEVUELVE LA POSICION

Function BuscoPosElemOrd (x: integer; v:Vector; dimL: integer): integer;
var
    pos : integer;
begin
    pos:=1;

    while (pos <= dimL) and (x > v[pos]) do
       pos:=pos+1;

    if ( pos > dimL ) or (x < v [pos]) then
       pos:=0;

    BuscoPosElemOrd:= pos;
end;

