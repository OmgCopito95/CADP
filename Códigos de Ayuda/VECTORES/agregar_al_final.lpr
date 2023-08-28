// AGREGAR ELEMENTO AL FINAL DE UN VECTOR


Procedure AgregarElemento (var v: vector; var dimL: integer; elemento: integer; var exito: boolean);
begin
     exito:= false; //para decir si se pudo agregar o no

     If (dimL < dimF) then begin   //verifica si hay espacio en el vector
       exito:= true; //se pudo agregar
       dimL:= dimL+1; // primero se incrementa dimL
       v [dimL]:= elemento;  //despues se guarda el elemento en el vector
    end;
end;

