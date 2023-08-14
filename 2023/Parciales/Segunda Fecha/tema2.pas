{

El productor musical Bizarrap organiza sesiones musicales con diferentes artistas. 
Se dispone de una estructura de datos con la información de las sesiones de Bizarrap. 
De cada sesión se conoce: título, nombre del artista, el género musical 
(1: Trap Latino, 2: Reggaeton 3: Urban, 4: Electrónica, 5: Pop Rap), año de estreno y 
cantidad de reproducciones en Spotify. La información no posee un orden específico.

Procesar la información anterior, para:

A. Informar los dos códigos de género musical con menor cantidad de reproducciones en Spotify. 
B. Generar una lista ordenada por año que contenga las sesiones del género "Trap Latino" y "Urban" 
cuya suma de los dígitos de la cantidad de reproducciones sea múltiplo de 5. 
C. COMPLETO: Realizar un módulo que reciba la lista generada en el punto anterior e informe para 
cada año, la cantidad de sesiones realizadas junto al total de reproducciones de Spotify de esas sesiones.

}


program tema2;
type

    cadena20 = string[20];
    sesion = record
        titulo: cadena20;
        artista: cadena20;
        genero: 1..5;
        anio: integer;
        reproducciones: integer;
    end;

    lista = ^nodo;
    nodo = record
        dato: sesion;
        sig: lista;
    end;

    vector = array[1..5] of integer; 

procedure inicializarVectorContador(var v: vector);
var
    i: integer;
begin
    for i:= 1 to 5 do
        v[i]:= 0;
end;

function sumaDigitosRep(rep: integer): boolean;
var
    sumaDigitos: integer;
begin
    sumaDigitos:= 0;
    while (rep <> 0) do begin
        dig := rep mod 10;
        sumaDigitos:= sumaDigitos + dig;
        rep:= rep div 10;
    end;
    sumaDigitosRep:= (sumaDigitos mod 5 = 0);
end;

function cumpleGenero(genero: integer): boolean;
begin
    cumpleGenero:= (genero = 1) or (genero = 3);
end;

procedure insertarOrdenado(var l:lista; s:sesion);
var
  nue: lista;
  act, ant: lista; {punteros auxiliares para recorrido}
begin
  new (nue);
  nue^.dato := s;
  act := L; {ubico act y ant al inicio de la lista}
  ant := L;
  while( act <> nil)and(s.anio > act^.dato.anio)do
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

procedure recorrerLista(l: lista; var v: vector; var nuevaLista:lista);
var

begin
    while (l<>nil) do begin
        v[l^.dato.genero]:= v[l^.dato.genero] + l^.dato.reproducciones;

        if (sumaDigitosRep(l^.dato.reproducciones) and cumpleGenero(l^.dato.genero)) then
            insertarOrdenado(l^.dato, nuevaLista);

        l:= l^.sig;
    end;
end;

procedure recorrerVector(v: vector);
var
    i: integer;
begin
    for i:= 1 to 5 do
        
end;

procedure recorrerNuevaLista(nuevaLista: lista);
var
    actual, cantSesiones, cantReproducciones: integer;
begin
    while (nuevaLista <> nil) do begin
        actual := nuevaLista^.dato.anio;
        cantSesiones := 0;
        cantReproducciones := 0;
            while (nuevaLista <> nil) and (nuevaLista^.dato.anio = actual) do begin
                cantSesiones:= cantSesiones + 1;
                cantReproducciones:= cantReproducciones + nuevaLista^.dato.reproducciones;
                nuevaLista:= nuevaLista^.sig;
            end;
        writeln('Año: ', actual, ' Cantidad de sesiones: ', cantSesiones, ' Cantidad de reproducciones: ', cantReproducciones);
    end;
end;

var
    v: vector;
    l,nuevaLista: lista;

begin
    l:=nil;
    nuevaLista:=nil;
    inicializarVectorContador(v);
    cargarLista(l); //se dispone
    recorrerLista(l, v, nuevaLista);
    recorrerVector(v);
    recorrerNuevaLista(nuevaLista);
end.