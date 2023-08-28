// AGREGAR AL FINAL EN UNA LISTA

// OPCION 1 - recorre la lista para encontrar el ultimo elemento

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


//OPCION 2 - recorre la lista tambien hasta encontrar el ultimo elemento (no usa variable anterior)

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


// OPCION 3 - con puntero al ultimo elemento

procedure agregarAtras(var l: lista; var ult: lista; dato: integer);
var
    nue:lista;
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
