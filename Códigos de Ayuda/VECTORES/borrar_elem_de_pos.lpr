//BORRAR ELEMENTO DE UNA POSICION

Procedure BorrarPos (var v: vector; var dimL: integer; pos: posicion; var exito: boolean );
var
   i: integer; 
begin
  exito := false;
  if (pos >=1 and pos <= dimL)then begin   //verifica que sea una posicion valida
    exito := true;
    for i:= pos+1 to dimL do  //hace el corrimiento para la izquierda
       v[i-1] := v[i];
    dimL := dimL-1 ;   //resta uno a la cant de elementos que tiene el vector
  end;
end;

