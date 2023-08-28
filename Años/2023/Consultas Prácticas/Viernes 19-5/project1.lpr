{puntero -> TIPO DE DATO SIMPLE
- lo puede devolver una funcion
- new -> aloca espacio en memoria dinamica
- dispose -> libera la memoria y corta el "enlace" del puntero
- asignar un puntero a otro ->  ambos punteros apuntan a la misma direccion de memoria
- asignar nil a un puntero -> corta enlace pero no libera la memoria


agregar elementos a una lista -> referencia
recorrer una lista -> valor

}



program project1;
type
    lista = ^nodo;
    nodo = record
         num : integer;
         sig : lista;
    end;

procedure armarNodo(var L: lista; v: integer);   //AGREGAR ADELANTE
var
   aux : lista;
begin
     new(aux);
     aux^.num := v;
     aux^.sig := L;
     L := aux;
end;

procedure recorrerLista(L:lista); //le estoy mandando pri por valor porque solo recorro
begin
     while(L <> nil) do begin
       writeln(L^.num); // IMPRIME EL DATO
       L:=L^.sig; //AVANZA EN LA LISTA
     end;
end;

procedure sumarDatos(L: lista; numero: integer);
begin
   while (L<>nil)do begin
      L^.num:=L^.num + numero;//modifico el contenido de ese espacio de memoria
      L:=L^.sig; // avanzo
   end;
end;

//PROGRAMA PRINCIPAL
var
   pri : lista;
   valor : integer;
   num: integer;
begin
     pri := nil; //INICIALIZO LA LISTA PARA QUE EL ULTIMO TENGA EL NIL
     writeln(‘Ingrese un numero’);
     read(valor);
     while (valor <> 0) then begin
           armarNodo(pri, valor);
           writeln(‘Ingrese un numero’);
           read(valor);
     end;
     recorrerLista(pri);
     readln(num);
     sumarDatos(pri,num);
end.











