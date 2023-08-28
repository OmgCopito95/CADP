procedure insertarOrdenado(var L:lista; j:jugador);
var
  nue: lista;
  act, ant: lista; {punteros auxiliares para recorrido}
begin
  new (nue);
  nue^.dato := j;
  act := L; {ubico act y ant al inicio de la lista}
  ant := L;
  while( act <> nil)and(j.altura > act^.dato.altura)do
  begin
    ant := act;
    act:= act^.sig;
  end;
  if (act = ant) then {al inicio o lista vacía}
    L:= nue;
  else {al medio o al final}
    ant^.sig:= nue;
  nue^.sig:= act;
end;
