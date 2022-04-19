program alcance4a;
var a,b: integer;
procedure uno;
begin
a := 1;
writeln(a);   //imrpime 1
end;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);    //imprime 2 y 1
readln;
end.


{program alcance4b;
procedure uno;
begin
a := 1;
writeln(a);
end;
var a,b: integer;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
readln;
end.  }

//la diferencia es que el programa 4a usa variables globales y el programa 4b son variables locales al pp.
//en el 4a: con el procedimiento se estan modificando el valor de la variable a
//en el programa 4b tira un error porquye a no está declarada en el procedimiento
