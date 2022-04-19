Program ejercicioParcial2019;

type
cadena=string[50];

lista=^nodo;

alumno=record
	dni:integer;
	beca:1..7;
	facu:cadena;
	ciudad:cadena;
	end;

nodo=record
	dato:alumno;
	sig:lita;
	end;

becas=record
	tipo:cadena;
	monto:integer;
	end;

vbecas=array [1..7] of becas;

vcontador=array [1..7] of integer;

procedure leeralumno (VAR a:alumno);
begin
	readln (a.dni);
    readln (a.beca);
    readln (a.facu);
    readln (a.ciudad);
end;

procedure agregaradelante (Var l:lista;a:alumno);
var
nue:lista;
begin
new (nue);
nue^.dato:=a;
nue^.sig:=l;
l:=nue;
end;

procedure cargarlista (var l:lita);
var
a:alumno
begin
	repeat
		leeralumno(a)
		agregaradelante (l,a);
	until (a.dni = '29000000')
end;


function cumple (facu:cadena;ciudad:cadena):boolean;
begin
	if ((facu = 'Facultad de informatica') and ((ciudad = 'la plata') or (ciudad = 'ensenada') or (ciudad = 'berisso'))  then
			cumple:=true;
end;


procedure descomponer (dni:integer;VAR dnipar:integer);
var
cantpar,num,dig:integer;
begin
	cantpar:=0;
	num:=dni;
	while (num <> 0) do  //agregar corte cant digitos
		begin
			dig:=num MOD 10;
			if ((dig mod 2) =0) then
					cantpar:=cantpar+1;
			num:=num DIV 10;
		end;
	if (cantpar <=3) then
			dnipar:=danipar + 1;
end;

procedura inicializarvc (var vc:vcontador);
var
i:integer;
begin
for i:= 1 to 7 do 
	vc[i]:=0;
end;

procedure recorrerlista (l:lista;VAR vc:vcontador);
var
cantlpbe,dnipar:integer;
begin
	cantlpbe:=0;
	dnipar:=0;
    read(dni)
	while (l <> nil) do
		begin
			// sumo la cantidad de tipos de becas
			vc[l^.dato.beca]:=vc[l^.dato.beca] + 1;
			
			// sumo la cantidad de informatica de lp bss y ens
			if (cumple(l^.dato.facu,l^.dato.ciudad)) then
					cantlpbe:=cantlpbe + 1;
			
			// cuento la cantidad de dni a lo sumo 3 dig par
			descomponer (l^.dato.dni,dnipar);

			l:=l^.sig;
		end;
	writeln ('la cantidad de becas para lp bsso y ens es de ',cantlpbe);
	writeln ('la cantidad de alumnos con a lo sumo 3 dig pares es ', dnipar);
end;

procedure imprimirvc (vc:vcontador;vb:vbecas);
var
i:integer;
begin
	for i := 1 to 7 do
		begin
			vc[i]:=vc[i] * vb[i].monto;
			writeln ('la cantidad total de dinero otorgado para la beca ',vb[i].tipo, ' es de ',vc[i]);
		end;
end;


//INCISO 3
while (l<>nil)
    if(si es el dni que busco)
        monto=monto+ vb[l^.dato.tipoBeca].monto




//pp
var
vc:vcontador;
vb:vbecas;
l:lista;
begin
l:=nil;
cargarvb (vb);//se dispone
inicializarvc (vc);
cargarlista (l);
recorrerlista (l,vc);
imprimirvc (vc,vb);
moduloPunto3(l,read(dni))
end.






