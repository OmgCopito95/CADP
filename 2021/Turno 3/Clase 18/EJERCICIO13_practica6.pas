Program ejer13practica6;
const
dimf=4;
type
cadena=string[30];


vcontador=array [1..4] of integer;

lista=^nodo;

usuario = record
	email:cadena;
	rol:1..4;
	revista:cadena;
	dias:integer;
	end;
vuser = array[1..dimf] of usuario;

userlista = record
	user:cadena;
	dia:integer;
	end;
	
nodo = record
	dato:userlista;
	sig:lista;
	end;
procedure leeruser (VAR u:usuario);
begin
		writeln ('email');
		readln (u.email);
		writeln ('rol');
		readln (u.rol);
		writeln ('revista');
		readln (u.revista);
		writeln ('dias');
		readln (u.dias);
end;

procedure cargarvuser (VAR vu:vuser);
var
i:integer;
u:usuario;
begin
for i:= 1 to dimf do
	begin
		leeruser (u);
		vu[i]:=u;
	end;
end;


procedure cargaruserlista (email:cadena;dias:integer;VAR us:userlista); //NO HACE FALTA, PODRIA HACERSE EN EL INSERTAR ORDENADO
begin
		us.user:=email;
		us.dia:=dias;
end;

procedure inicializarvc (var vc:vcontador);
var
i:integer;
begin
for i:=1 to 4 do
		vc[i]:=0;
end;

	
procedure agregarordenado (var l:lista;us:userlista);
var
nue,act,ant:lista;
begin
	new(nue);
	nue^.dato:=us;
	act:=l;
	ant:=l;
	while(act<>nil)and(us.dia > act^.dato.dia)do
		begin
			ant:=act;
			act:=act^.sig;
		end;
	if(act=ant)then
		l:=nue
		else
			ant^.sig:=nue;
	nue^.sig:=act;
end;

procedure dosmaximos (email:string;dias:integer;VAR maxn1, maxn2:cadena;VAR max1,max2:integer);
begin
		if (dias > max1) then
			begin
				max2:=max1;
				maxn2:=maxn1;
				max1:=dias;
				maxn1:=email;
			end
			else
				if (dias > max2) then
					begin
						maxn2:=email;
						max2:=dias;
					end;		
end;

procedure recorrervector (vu:vuser;VAR l:lista;VAR vc:vcontador);
var
max1,max2,i:integer;
maxn2,maxn1:cadena;
us:userlista;
begin
max1:=-1;
max2:=-1;
for i:= 1 to dimf do
	begin
		//cargo la lista ordenada
		if (vu[i].revista = 'economica') then
				begin
				cargaruserlista(vu[i].email,vu[i].dias,us);
				agregarordenado (l,us);
				end;
		
		//cargo el vector contador
		vc[vu[i].rol]:=vc[vu[i].rol]+1;
	
		//dos maximos
		dosmaximos (vu[i].email,vu[i].dias,maxn1,maxn2,max1,max2);
	end;
    writeln ('los usuarios con mas tiempo sin ingresar son ',maxn1,' y ',maxn2);
end;

procedure imprimirlista (l:lista);
begin
	while (l<>nil) do
		begin
			writeln ('el usario ',l^.dato.user, ' no ingresa hace ',l^.dato.dia,' dias');
			l:=l^.sig;
		end;
end;

procedure imprimirvc (vc:vcontador);
var
i:integer;
begin
for i:= 1 to 4 do
		writeln ('el rol ',i, ' tiene una cantidad total de usarios de ',vc[i]);
end;

VAR
l:lista;
vu:vuser;//se dispone
vc:vcontador;

begin
l:=nil;
cargarvuser (vu);//se dispone
inicializarvc (vc);
recorrervector (vu,l,vc);
imprimirlista (l);//PARTE A
imprimirvc (vc);
end.































