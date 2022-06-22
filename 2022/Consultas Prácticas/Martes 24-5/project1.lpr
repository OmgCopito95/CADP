Begin
  actual:=p;
  while (actual <> nil) do begin
     if (actual^.elem <> valor) then begin
       ant:=actual; actual:= actual^.sig;
     end
     else begin

      if (actual <> nil) then
       begin
         if (actual = pI) then
         pI:= pI^.sig
         else
          ant^.sig:= actual^.sig;
      dispose (actual);
      actual:= ant;
    end;






     end;




  end;




  procedure leerPersona(var p:persona);
  begin
  read(nombre)
  end;

  procedure cargaVector(var v:vector);
  var
    p:persona; //registro

  begin

  for i:=1 to dimF do begin
     leerPersona(p); //cargar registro
     v[i] := p;
  end;
  end;



  for i:=1 to dimF do begin
     leerPersona(v[i]); //cargar registro

  end;



  lNueva:=nil
  lNueva:=ordenar(P,a,b);









