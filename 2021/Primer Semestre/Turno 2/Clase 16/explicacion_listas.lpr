
//mando la lista por valor para no perder el puntero
Procedure imprimirLista ( l : lista);

Begin
 while (l <> NIL) do begin
   writeln ('Los numeros ingresados fueron: ',l^.num) ;
   l:= l^.sig;
 end;
end;


 //MODIFICA VALORES DE LA LISTA MANDANDOLA POR REFERENCIA
procedure incrementarValor (var l:lista; x:integer);
var
   aux:lista;
Begin
 aux:=l; // USO AUXILIAR PARA RECORRER
 while (aux<> NIL) do begin
   aux^.num:=aux^.num+x;
   aux:= aux^.sig;
 end;
end;

//MODIFICA LOS VALORES DE LA LISTA MANDANDOLA POR VALOR - SIN AUXILIAR
procedure incrementarValor (pri:lista; x:integer);

Begin
 while (pri<> NIL) do begin
   pri^.num:=pri^.num+x;
   pri:= pri^.sig;
 end;
end;


 
//--------------------------------------------------------------------

// --------------------------- AGREGA ATRAS RECORRIENDO TODO

procedure agregarAtras(var l:lista; dato: integer);
var
	nue, act, ant: lista;
begin
	new(nue);
	nue^.dato := dato;
	ant := l;
	act := l;
	while (act <> nil) do begin
		ant := act;
		act := act^.sig;
	end;
	if (ant = act) then
		l := nue
	else
		ant^.sig := nue;
	nue^.sig := act;
end;



// ------------- AGREGA ATRAS CON PUNTERO AL ULTIMO

procedure agregarAtras(var l: lista; var ult: lista; dato: integer);
ver
begin
	new(nue);
	nue^.dato := dato;
	nue^.sig := nil;
	if (l = nil) then
		l := nue
	else
		ult^.sig := nue;
	ult := nue;
end;


// ------------------------
//a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.

function maximo (l:lista):integer;
var
    max:integer;
begin
    max:=-1;
    while (l<> nil) do begin  //recorro la lista
      if(l^.num > max) then //comparo con el elem de la lista
        max := l^.num; //actualizo maximo
      l:=l^.sig; //avanza al sig nodo
    end;

    maximo:= max;
end;

// retorna el puntero al elemento que guarda el numero mas grande
function maximo (l:lista):lista;
var
    max:lista;
    aux:integer;
begin
    max:=nil; //guarda el nodo que tiene el numero mas grande
    aux:=-1;  //guarda los numeros mas grandes
    while (l<> nil) do begin  //recorro la lista
      if(l^.num > aux) then begin //comparo con el elem de la lista
        aux := l^.num; //actualizo maximo
        max := l;
      end;
      l:=l^.sig; //avanza al sig nodo
    end;

    maximo:= max;
end;















