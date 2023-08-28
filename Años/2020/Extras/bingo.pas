program Bingo;
const
   maxJugadores = 10; //cantidad de jugadores
   longCarton = 100;  //cantidad de casilleros disponibles en cada carton
   numerosXcarton = 15; //cantidad de numeros que tiene cada carton
   puntosParaGanar = 20; //cantidad de puntos que tiene que hacer un jugador para ganar todo el juego
   
 type
    Tjugador = record
				nombre : string;
				puntos : integer;
				end;
	vectorJugadores = array[1..maxJugadores] of Tjugador;
	
	Tcarton = array[1..longCarton] of boolean;
	
	Tpartida = record //representa a un jugador jugando una partida
				cantAciertos : integer;
				carton, marcas : TCarton;
			end;
	vectorPartida = array[1..maxJugadores] of Tpartida;
	
function obtenerNumeroNoRepetido(carton : TCarton) : integer;
var
  num : integer;
begin
	num := Random(longCarton) + 1;
	while (carton[num]) do 
		num := Random(longCarton) + 1; 

	obtenerNumeroNoRepetido := num;
end;	
	
	
procedure generarCarton(var carton,marcas : Tcarton);
var
  i,cantNumeros : integer;
begin
  cantNumeros := 0;
  for i:= 1 to longCarton do begin
	marcas[i] := false;
	carton[i] := false;
  end;
  
  while (cantNumeros <= numerosXcarton) do begin
	carton[ obtenerNumeroNoRepetido(carton) ] := true;
	cantNumeros := cantNumeros + 1;
  end; 
end;

procedure imprimirCarton(c : TCarton);
var 
   i : integer;
begin
 for i:= 1 to longCarton do
	if (c[i]) then 
		write('| ',i,' ')
	else 
		write('| X ');
  write('|');		
end;

procedure cargarJugadores(var v : vectorJugadores);
var
  i : integer;
begin
	for i := 1 to maxJugadores do begin
		//writeln('Ingrese el nombre del jugador ',i);
		//readln(v[i].nombre);
		v[i].nombre := chr(i+64)+chr(i+64)+chr(i+64); 
		v[i].puntos := 0;
	end;
end;  

procedure inicializarPartida(var puntosAAsignar : integer; var v : vectorPartida; var numerosQueSalieron : TCarton; var jugadoresActivos : integer);
var
  i : integer;
begin
	for i:= 1 to maxJugadores do begin
		generarCarton(v[i].carton,v[i].marcas);
		v[i].cantAciertos := 0;
	end;
	for i := 1 to longCarton do numerosQueSalieron[i] := false;
	
	puntosAAsignar := 3; //el primer ganador recibe 3 puntos
	jugadoresActivos := maxJugadores; //el juego arranca con todos los jugadores
end;  

procedure procesarNumeroJugador(num : integer; var p : tpartida);
begin
		if (p.carton[num]) then begin //verifico si el jugador i tiene el numero num en su carton
			p.marcas[num] := true; //marco que salió el número num. Esto no es realmente necesario!
			p.cantAciertos := p.cantAciertos + 1;
		end;
end;

{ dado un numero num que acaba de salir, verifica qué cartones lo tienen}
procedure procesarNumeroPartida(num : integer; var v : vectorPartida);
var
   i : integer;
begin
	for i := 1 to maxJugadores do
		procesarNumeroJugador(num,v[i]);		
end;



{ verifica si algún jugador ganó la partida, y le asigna los puntos correspondientes }
procedure buscarGanadorPartida(var v : vectorPartida; var puntos : integer; var jugadores : vectorJugadores; var jugadoresActivos : integer);
var
   i : integer;
   hayGanador : boolean;
begin
	hayGanador := false;
	for i := 1 to maxJugadores do begin
		if (v[i].cantAciertos = numerosXCarton) then //ya salieron todos los números 
		begin
			jugadores[i].puntos := jugadores[i].puntos + puntos; //le doy los puntos al jugador
			v[i].cantAciertos := -1; //le cambio el valor así no vuelvo a darle los puntos en esta partida
			hayGanador := true; //anoto que alguien completó su tablero
			jugadoresActivos := jugadoresActivos - 1; // ya hay un jugador que terminó el juego
		end;
	end;
			
	if (hayGanador) then 
		puntos := puntos - 1; //la proxima vez que alguien complete su tablero, obtendrá menos puntos

end;


{ Simula una partida completa }
procedure jugarPartida(var jugadores : vectorJugadores);
var
	jugadoresActivos,bolilla,puntosAAsignar : integer;
	partida : vectorPartida;
	numerosQueSalieron : TCarton;
begin

	inicializarPartida(puntosAAsignar, partida, numerosQueSalieron,jugadoresActivos);
	
	while ((puntosAAsignar > 0) and (jugadoresActivos > 0)) do begin //el juego puede terminar porque se repartieron todos los puntos, o porque ganaron todos (por ej. juuusto se completan 10 cartones a la vez. Qué mala suerte!)
		bolilla := obtenerNumeroNoRepetido(numerosQueSalieron); //saco un numero
		procesarNumeroPartida(bolilla,partida);
		numerosQueSalieron[bolilla] := true;
		buscarGanadorPartida(partida,puntosAAsignar,jugadores, jugadoresActivos);
	end;

end;


function hayGanadorJuego(jugadores : vectorJugadores) : boolean;
var
  i : integer;
begin
	i := 1;
	while (i <= maxJugadores) and (jugadores[i].puntos < puntosParaGanar) do
		i := i + 1;
		
	hayGanadorJuego := (i <= maxJugadores);	
end;


procedure ordenarPodio(var v : vectorJugadores);
var
	i,j : integer;
	jug : Tjugador;
begin
	for j := 1 to maxJugadores do 
		for i:= j to maxJugadores do begin
			if (v[i].puntos > v[j].puntos) then begin
				jug := v[j];
				v[j] := v[i];
				v[i] := jug;
			end;
		end;
end;

procedure imprimirPuntos(jugadores : vectorJugadores);
var 
  i,j,cant,max : integer;
  puestoActual,puntosActual : integer;
begin

	ordenarPodio(jugadores);

	{ primero imprimimos a todos los ganadores }

	max := jugadores[1].puntos;
	cant := 1;
	while (max = jugadores[cant].puntos) do begin
		writeln('Ganador: ',jugadores[cant].nombre ,' con ', jugadores[cant].puntos, ' puntos');
		cant := cant + 1;
	end;
	
	{ ahora imprimimos el resto, con la ayuda de nuestro amigo "corte de control" }
	i := cant;
	puestoActual := 2;
	while (i <= maxJugadores) do begin
			puntosActual := jugadores[i].puntos;	
		while (i <= maxJugadores) and (puntosActual = jugadores[i].puntos) do begin
			for j:=1 to puestoActual do write('-.'); //un decorado visual
			writeln(' => Puesto ',puestoActual,': ', jugadores[i].nombre, ' obtuvo ',jugadores[i].puntos, ' puntos');
			i := i + 1;
		end;
		puestoActual := puestoActual + 1;		
	end;	
end;

{ por si en algun momento quiero saber quién obtuvo más puntos } 
function ganador(v : vectorJugadores) : integer;
var 
	i,max,posmax : integer;
begin
	max := 0;
	for i := 1 to maxJugadores do begin
		if (v[i].puntos > max) then begin
			max := v[i].puntos;
			posMax := i;
		end;
	end;
	ganador := posMax;
end;



var
   jugadores : vectorJugadores;
   cantPartidas : integer;
begin
   Randomize; 
   cargarJugadores(jugadores);
   cantPartidas := 0;
   while (not hayGanadorJuego(jugadores)) do begin
		jugarPartida(jugadores);
		cantPartidas := cantPartidas + 1;
   end;
    
    writeln('-----------------------------------------------------------------');
	writeln('--------------Juego terminado en ',cantPartidas, ' partidas---------------------');	
	writeln('-----------------------------------------------------------------');
    writeln();
    
	
	imprimirPuntos(jugadores);
   
end.
	
