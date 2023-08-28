//EL ELEMENTO PUEDE NO EXISTIR EN LA LISTA

Procedure BorrarElemento (var pri:lista; nom:cadena50; var exito: boolean);
var ant, act: lista;
begin 
  exito := false;
  act := pri;
  {Recorro mientras no se termine la lista y no encuentre el elemento}
  while  (act <> NIL)  and (act^.datos.nom <> nom) do begin
      ant := act;
      act := act^.sig
  end;   
  if (act <> NIL) then begin
       exito := true; 
    if (act = pri) then  
      pri := act^.sig;
    else  
      ant^.sig:= act^.sig;
    dispose (act);
  end;
end;




//EL ELEMENTO SEGURO EXISTE EN LA LISTA

Procedure BorrarElemento (var pri:lista; nom:cadena50; var exito: boolean);
var ant, act: lista;
begin 
  exito := false;
  act := pri;
  {Recorro mientras no encuentre el elemento}
  while (act^.datos.nom <> nom) do begin   //NO HACE FALTA PREGUNTAR POR NIL 
      ant := act;
      act := act^.sig
  end;   
  
  //SI SALE DEL WHILE ES PORQUE YA LO ENCONTRÓ SEGURO
  exito := true; 
  if (act = pri) then  
      pri := act^.sig;
  else  
      ant^.sig:= act^.sig;
  dispose (act);
end;