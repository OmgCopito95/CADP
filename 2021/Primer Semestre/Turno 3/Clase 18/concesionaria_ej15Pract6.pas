program ejerConcesionariaParcial;
type
	string20=string[20];

	pedido=record
		pais_destino:string20;
		forma_pago:1..4;
		end;

	lista=^nodo;	

	nodo=record
		dato:pedido;
		sig:lista;
		end;

	vector_forma_pago=array[1..4] of integer;

	procedure cargarvector(var vfp:vector_forma_pago);
		var
			i:integer;
		begin
			for i:=1 to 4 do
				vfp[i]:=0;
		end;	

	procedure recorrer(l:lista; var vfp:vector_forma_pago);
		var
			actual:string20;
			cant_pedidos, i,formaPagoMax, max:integer;
		begin
			max:=-1;
			while (l <> nil) do begin
				actual:=l^.dato.pais_destino;
				cant_pedidos:=0;
				while (l <> nil) and (l^.dato.pais_destino = actual) do begin
					cant_pedidos:=cant_pedidos+1;
					vfp[l^.dato.forma_pago]:=vfp[l^.dato.forma_pago]+1;
					l:=l^.sig;
				end;
				writeln(' Para cada pais, la cantidad de pedidos a entregar es para ',actual, ', ',cant_pedidos);
			end;

			for i:=1 to 4 do begin    //MODULARIZAR
				if (vfp[i] > max) then begin
					max:=vfp[i];
                    formaPagoMax:=i
                end;
            end;
			writeln('La forma de pago más utilizada es ', formaPagoMax);
		end;

	var
		l:lista;
		vfp:vector_forma_pago;
	begin
		l:=nil;
		cargarvector(vfp);
		//cargarlista(l); SE DIASPONE
		recorrer(l, vfp);
		readln();
	end.




 //--------------------------------------------------------------

program ej15practica6;

type
	alumno = record
		dni:integer;
		apellido:string;
		nombre:string;
		nota:integer;
	end;

	lista=^nodo;
	nodo=record
		dato:alumno;
		sig:lista;
	end;

procedure agregarnodo (var l:lista; a:alumno);
var
	aux:lista;
begin
	new(aux);
	aux^.dato:=a;
	aux:=l;
	l:=aux;
end;

procedure imprimirlista (l:lista);
begin
	while (l<>nil) do begin
		writeln(l^.dato.dni);
		writeln(l^.dato.apellido);
		writeln(l^.dato.nombre);
		writeln(l^.dato.nota);    //FALTA AVANZAR EN LA LISTA!
	end;
end;

var
      //HACER UN VECTOR DE LISTAS!
	l1,l2,l3,l4,l5,ldada,aux:lista;
	turno1:boolean; //'contador' para separar aulas de estudiantes que promocionaron
	cant:integer; //contador para separar aulas de estudiantes que aprobaron

begin
	l1:=nil;l2:=nil;l3:=nil;l4:=nil;l5:=nil;
	cargarlista(l_dada); //dado
	aux:=l_dada;
	while (aux <> nil) do begin    //MODULARIZAR
		if aux^.dato.nota>=8 then begin
			if turno1=false then
				agregarnodo(l4,aux^.dato)
			else
				agregarnodo(l1,aux^.dato);
			turno1:= NOT turno1;
		end
		else
			if (aux^.dato.nota <8) and (aux^.dato.nota >=5) then begin // aca puede que falten o sobren begin-end
				if (cant > 3) then
					cant:=1;
				if cant=1 then begin
					agregarnodo(l2,aux^.dato);
					cant:=cant+1;
				end
					else if cant=2 then begin
						agregarnodo(l3,aux^.dato);
						cant:=cant+1;
					end
						else if cant=3 then begin
							agregarnodo(l5,aux^.dato);
							cant:=cant+1
						end;
			end;
		aux:=aux^.sig;
	end;
	imprimirlista(l1);
	imprimirlista(l2);     //RECORRER EL VECTOR DE LISTAS!
	imprimirlista(l3);
	imprimirlista(l4);
	imprimirlista(l5);
end.






















