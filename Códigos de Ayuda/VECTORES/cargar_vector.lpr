// CARGAR UN VECTOR CUANDO NO SE SABE LA CANTIDAD EXACTA DE DATOS

// POR EJEMPLO CUANDO DICE: A LO SUMO


//dimL tiene que estar inicializada en 0 desde donde se llame al metodo
Procedure Cargar ( var v: vector; var dimL: integer );
 var
    dato: integer;
 begin
   read (dato);
   while (dato <> 99)  and ( dimL < dimF ) do begin  // siempre preguntar con dimL<dimF, sino se pasa y explota todo
          dimL := dimL + 1;  //al estar inicializado en 0 dimL, siempre tengo que incrementar
          v [dimL] := dato;  //y despues guardar el dato
          read (dato);
   end;
End;


// ------------------------------------------------------------------------



// CARGAR UN VECTOR COMPLETO


Procedure Cargar ( var v: vector);
 var
    dato: integer;
 begin
   read (dato);
   for(i:=1 to dimF)do begin    //no hace falta dimL, porque todo el vector va a estar cargado, asique dimL=dimF
          v[i]:=dato;
          read(dato);
   end;
End;











