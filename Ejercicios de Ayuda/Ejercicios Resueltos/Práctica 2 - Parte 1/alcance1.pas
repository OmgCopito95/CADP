program alcance1;
var
    a,b: integer;

procedure uno;
    var b: integer;
begin
    b := 3;
    writeln(b);  // imprime 3
end;

begin
    a:= 1;
    b:= 2;
    uno;
    writeln(b, a);  //imprime 2 y 1
    readln;
end.

