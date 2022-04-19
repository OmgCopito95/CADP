program alcance3;
var
  a: integer;

procedure uno;
var
  b: integer;   //es local al procedimiento, no se conoce en otro lado
begin
     b:= 2;
     writeln(b);  //imprime 2
end;
begin
     a:= 1;
     uno;
     writeln(a, b);  //la variable b no esta declarada en el programa principal
end.
