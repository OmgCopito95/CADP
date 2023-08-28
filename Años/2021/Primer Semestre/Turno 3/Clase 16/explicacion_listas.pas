//ejercicio 1

program explicacion_listas;
type
  lista = ^nodo;
  nodo = record
       num : integer;
       sig : lista;
  end;


procedure armarNodo(var L: lista; v: integer);
var
 aux : lista;
begin
 new(aux);
 aux^.num := v;
 aux^.sig := L;
 L := aux;
end;

Procedure IMPRIMIR (p:lista); //siempre paso la lista por valor cuando la voy a recorrer
Begin
    while (p <> nil) do begin
        writeln('el valor en la direccion es: ',p^.num);
        writeln;
        p:= p^.sig;
    end;
end;

var
 pri : lista;
 valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  readln(valor);
  while (valor <> 0) do begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      readln(valor);
  end;
  IMPRIMIR (pri);
{que imprimir este aca, una vez leido todo}

  readln();
end.


//-----------------------------------------------------------------------------
procedure agregarAtrasVersion1(var l:lista; dato: integer);    //recorre toda la lista
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


procedure agregarAtrasVersion2(var L: lista; v: integer);  //recorre toda la lista
var
        aux, act : lista;
begin
        new(aux);
        aux^.num := v;
        aux^.sig := nil;
        if (l <> nil) then begin
            act:=l;
            while (act^.sig <> nil) do
                act:=act^.sig;
            act^.sig:=aux;
        end
        else
            l:=aux;
end;

l:=nil;
ult:=nil;

procedure agregarAtrasEficiente(var l: lista; var ult: lista; dato: integer);   //tiene un puntero al ultimo
var
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

//-------------------------------------------------------------------------







