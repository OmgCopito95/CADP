program alcance2;
var
  a,b: integer;
procedure uno;
begin
     b := 3;  //modifica la variable global
     writeln(b); //imprime 3
end;
begin
     a:= 1;
     b:= 2;
     uno;
     writeln(b, a);   //imprime 3 y 1
     readln;
end.
