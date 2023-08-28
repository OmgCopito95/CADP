--------------------------------------------------
 23 | 24 | 28 | 39 | 42 | 44 | 45 | 53 | 62 | 91 |
--------------------------------------------------

// IMPRIME UN VECTOR DE ENTEROS
Procedure imprimirVector (v: vector; dimL: integer);
var
   i: integer;
begin
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     write (' ');
     for i:= 1 to dimL do begin
        if(v[i] < 9)then //le agrega un cero adelante cuando el numero es de un digito
            write ('0');
        write(v[i], ' | ');
     end;
     writeln;
     for i:= 1 to dimL do
         write ('-----');
     writeln;
     writeln;
End;
