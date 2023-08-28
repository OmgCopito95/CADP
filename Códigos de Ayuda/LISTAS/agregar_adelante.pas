// AGREGAR ADELANTE EN UNA LISTA

procedure agregarAdelante(var l:lista; dato:integer);
var
	nue: lista;
begin
	new(nue);
	nue^.dato := dato;
	nue^.sig := l;
	l := nue;
end;