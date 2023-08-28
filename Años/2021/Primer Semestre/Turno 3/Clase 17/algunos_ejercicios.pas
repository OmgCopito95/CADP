//--------------------- EJERCICIO 6

program ESA;

type
cadena=string[50];
vectorcontador = array [1..7] of integer;


sonda = record
	nombre:cadena;
	duracion:integer;
	constru:real;
	mant:real;
	rango:integer;
end;

lista=^nodo;

nodo=record
	dato:sonda;
	sig:lista;
end;

procedure leersonda (VAR s:sonda);
	begin
		writeln ('Ingrese nombre');
		readln(s.nombre);
		writeln ('Ingrese duracion');
		readln(s.duracion);
		writeln ('Ingrese construc');
		readln(s.constru);
		writeln ('Ingrese mant');
		readln(s.mant);
		writeln ('Ingrese rango');
		readln(s.rango);
	end;


procedure agregaradelante(var l:lista; s:sonda);
    var
        nue:lista;
    begin
        new(nue);
        nue^.dato:=s;
        nue^.sig:=l;
        l:=nue;
    end;

procedure cargar (VAR l:lista;VAR totalsonda:integer; VAR totalcosto:real; VAR totalduracion:integer);
var
s:sonda;
begin
    totalsonda:=0;
    totalcosto:=0;
    totalduracion:=0;
	repeat 
		leersonda(s);
		totalsonda:=totalsonda+1;
		totalcosto:= totalcosto + s.constru;
		totalduracion:=totalduracion + s.duracion;
		agregaradelante(l,s);
	until (s.nombre='gaia');
end;

procedure dosmaximos (name:cadena; constru,mant:real; VAR maxm,maxc:real; VAR maxname:cadena);
	begin
		if ((constru > maxc) and (mant > maxm)) then     //podrias sumar ambas variables
			begin
				maxc:=constru;
				maxm:=mant;
				maxname:=name;
			end;		
	end;

procedure inicializarv (VAR v:vectorcontador);
var
i:integer;
begin
	for i:= 1 to 7 do
		v[i]:=0;
end;

function promediocosto (totalsonda:integer;totalcosto:real):real;
	begin
		promediocosto:= totalcosto/totalsonda;
	end;

function promedioduracion (totalsonda:integer;totalduracion:integer):real;
	begin
		promedioduracion:= totalduracion/totalsonda;
	end;

procedure imprimirvector (v:vectorcontador);
var
i:integer;
begin
	for i:=1 to 7 do
		writeln ('La cantidad de sondas en el rango ',i,' es de ',v[i]);
end;


procedure recorrerlista (l:lista;VAR v:vectorcontador;promsonda:real;promdur:real);
var
sondadur:integer;
maxm,maxc:real;
maxname:cadena;
begin
maxm:=-1;
maxc:=-1;
sondadur:=0;
	while (l<>nil) do
		begin
			//A. sonda mas costosa. maximos
			dosmaximos (l^.dato.nombre,l^.dato.constru,l^.dato.mant,maxm,maxc,maxname);
			
			//B. cantidad de sondas que realizan estudios.
			v[l^.dato.rango]:=v[l^.dato.rango]+1;	

			//C. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas
			if (l^.dato.duracion > promdur) then
				sondadur:=sondadur +1;
			
			//D. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
			
			if (l^.dato.constru > promsonda) then
					writeln ('La sonda que supera el costo promedio de construccion es ',l^.dato.nombre);
			
			
			l:=l^.sig;
		end;
	writeln('La sonda mas costosa es ',maxname);
	writeln('La cantidad de sondas cuya duracion estimada supera la duracion promedio de todas las sondas es ',sondadur);
end;




var
v:vectorcontador;
totalsonda,totalduracion:integer;
totalcosto,promsonda,promdur:real;
l:lista;
begin
	l:=nil;
	cargar(l,totalsonda,totalcosto,totalduracion);
	promsonda:=promediocosto(totalsonda,totalcosto);
    promdur:= promedioduracion(totalsonda,totalduracion);
	recorrerlista(l,v,promsonda,promdur);
	imprimirvector(v);
end.



// ---------------------------------------------------------------------------




//pseudocodigo ejercicio 13

    cargaVector() //se dispone

    for 1 to 3600
        if pertenece a la revista economica
           agregarordenado
        le sumo 1 al vector contador
        actualizarDosMaximos()
    end
    imprimir lista
    imprimir vector contador
    imprimir los dos max

// ---------------------------------------------------------------------------


{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar proyectos
de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se han
determinado los siguientes criterios:
-sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.

  A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los nuevos
criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el costo
total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello, utilice
el módulo realizado en b}




//CORREGIR - DEBERIA RECORRER LA LISTA DEL PUNTO 6
Program project1;

Type

   str10= string[10];

   sonda = record
         nombre:str10;
		 cantMeses: integer;
		 costoConstruccion: real;
		 costoMantenimiento: real;
		 rango: 1..7;
   end;

   lista= ^nodo;

   nodo = record
         dato:sonda;
		 sig: lista;
   end;


{================= Comienzo LEER =================}
Procedure LEER (VAR s:sonda);
Begin
     with s do begin
	     writeln('Ingres el nombre de la sonda');
		 readln(nombre);
		 writeln('Ingrese la cantida de Meses que permanecera activa');
		 readln(cantMeses);
		 writeln('Ingrese el costo de la construccion');
		 readln(costoConstruccion);
		 writeln('Ingrese el costo mensual de manetenimiento');
		 readln(costoMantenimiento);
		 writeln('Ingrese el rango (de 1 a 7):');
		 readln(rango);
	 end;
End;
{================= Fin LEER =================}



{================= Comienzo INCISO A =================}

Function CumpleRequisito (construccion,manetenimiento:real; rang:integer):boolean; //a
Begin
    CumpleRequisito:= (manetenimiento < construccion) AND (rang <> 1);
End;
{================= Fin INCISO A =================}





{================= Comienzo Armar Nodo / Agregar Adelante =================}
Procedure AgregarAdelante(VAR L:lista; s:sonda);
VAR
   aux:lista;
Begin
     new(aux);
	 aux^.dato:= s;
	 aux^.sig:= L;
	 L:= aux;
End;




Procedure ARMARNODO (listaSondas:lista; VAR L,P:lista);  //PUNTO B
VAR
  s:sonda;
Begin

      while(listaSondas <> nil)do begin  //recorro la lista dle punto 6

		 If (CumpleRequisito(listaSondas^.dato.costoConstruccion,listaSondas^.dato.costoMantenimiento,listaSondas^.dato.rango)) then begin;
		     writeln('La sonda ',s.nombre,' cumple requisito para la financiacion');
			 AgregarAdelante(P,s);
        end

		 Else begin
		     writeln('La sonda ',s.nombre,' NO cumple requisito para la financiacion');
		 	 AgregarAdelante(L,s);
		 end;
         writeln;

        listaSondas:=listaSondas^.sig;
      end;


End;
{================= Fin Armar Nodo / Agregar Adelante =================}




{================= Comienzo Inciso C =================}

Procedure RECORRER (L:lista);
Var
  CostoTotalSondas,TOTAL: real;
  CantSondas: integer;
Begin
     TOTAL:=0;
     CantSondas:=0;

     while (L <> nil) do begin

	     CantSondas:= CantSondas + 1;
         TOTAL:= TOTAL + L^.dato.costoConstruccion + L^.dato.costoMantenimiento;

	     L:=L^.sig;
	 end;
	 Writeln('La cantidad total de sondas no financiadas es: ',CantSondas);
	 writeln('El costo total de todas las sondas no financiadas es: $',TOTAL:6:2);
End;
{================= Fin Inciso C =================}




{================= PROGRAMA PRINCIPAL =================}
Var
L,P: lista;
Begin
     L:= nil;
	 P:=nil;
	 ARMARNODO (L,P);
	 RECORRER (L);
	 readln();
End.


//------------------------------------------------------------------------------------------------------------

{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un número
(que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su número,
en cuyo caso sale de la lista de espera. Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán todos
los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a uno por
vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}


Program ejer10;

Type
    cliente = record
	     DNI:integer;
		 nro:integer;
	end;

	lista = ^nodo;

	nodo=record
	     dato:cliente;
		 sig:lista;
	end;







{======================= Comienzo Cargar Lista =======================}

Procedure AgregarAtras (VAR L:lista; VAR ult:lista; c:cliente);
VAR
   nuevo:lista;
Begin
     new(nuevo);
     nuevo^.dato:= c;
     nuevo^.sig:= nil;
     If (L = nil) then
         L:= nuevo
	 ELSE
	     ult^.sig:= nuevo;
	 ult:= nuevo;
End;


Procedure RecibirCliente (identificacion:integer; VAR L:lista; VAR turno:integer);
VAR
  c:cliente;
  ult:lista;
Begin
     writeln('Se le entrega al cliente numero de espera');
     c.nro:=turno;
     writeln('el numero de turno es: ',c.nro);
	 turno:=turno + 1;
     writeln(' el campo C: ',c.nro,' y dni ',identificacion);
     c.DNI:= identificacion;
     writeln(' el campo C: ',c.nro,' y dni ',c.DNI);
	 AgregarAtras (L,ult,c);
End;



Procedure CargarLista (VAR L:lista);
VAR
   c:cliente;
   turno,identificacion:integer;
Begin
     turno:=1;
     writeln('Ingrese el DNI del cliente: ');
	 readln(c.DNI);
	 While (c.DNI <> 0) do begin
         //identificacion:= ;
	   	 RecibirCliente(c.DNI,L,turno);
         writeln;
		 writeln('Ingrese el DNI del cliente: ');
	     readln(c.DNI);
	 end;
End;

{======================= Fin Cargar Lista =======================}




{======================= Comienzo RECORRER Atender Cliente =======================}
Procedure AtenderCliente (L:lista; VAR dniActual,nroActual:integer);
Begin
     dniActual:= L^.dato.DNI;
     nroActual:= L^.dato.nro;
End;



Procedure RECORRER (var L:lista);
VAR
  dniActual,nroActual:integer;
  aux:lista;
Begin
     while (L <> nil) do begin
	     AtenderCliente (L,dniActual,nroActual);
		 writeln('El DNI del cliente a ser atendido es: ',dniActual,' con el numero ',nroActual);
		 aux:=L;
         L:= aux^.sig;
		 dispose(aux);
	 end;
End;

{======================= Fin RECORRER Atender Cliente =======================}





{======================= PROGRAMA PRINCIPAL =======================}

VAR
  L:lista;
Begin
     L:=nil;
     CargarLista(L);
	 RECORRER(L);
	 readln();
End.


// ------------------------------------------------------------------------------------------------------------


{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los egresados
que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado (de mayor
a menor).}


Program ejer11;
Const
     dimF = 10;
Type

     str10= string[10];

     egresado = record
         nroAlumno: integer;
         apellido:str10;
		 promedio:real;
     end;

	 lista= ^nodo;

	 nodo = record
	     dato: egresado;
		 sig:lista;
	 end;




{================= Comienzo LEER =================}
Procedure LEER (VAR e:egresado);
Begin
     with e do begin
	     writeln('Ingrese numero de Alumno');
		 readln(nroAlumno);
		 If (nroAlumno <> 0) then begin
		     writeln('Ingrese el apellido del alumno');
		     readln(apellido);
		     writeln('Inrese el promedio del alumno');
		     readln(promedio);
		 end;
	 end;
End;
{================= Fin LEER =================}



{================= Comienzo Armar Nodo / Insertar Ordenado segun Promedio =================}

Procedure InsertarOrdenado (Var L:lista; e:egresado);
Var
   nuevo:lista;
   act,ant:lista;
Begin
     new(nuevo);
	 nuevo^.dato:= e;
	 act:= L;
	 ant:= L;
	 While (act <> nil) AND (e.promedio < act^.dato.promedio) do begin
	     ant:= act;
		 act:= act^.sig;
	 end;
	 If (act=ant) then
	     L:= nuevo
	 Else
	     ant^.sig:= nuevo;
	 nuevo^.sig:= act;
End;

Procedure ArmarNodo (VAR L:lista);
Var
  e:egresado;
Begin
     LEER(e);
     while (e.nroAlumno <> 0) do begin
	     InsertarOrdenado(L,e);
         writeln;
		 LEER(e);
     end;
End;
{================= Fin Armar Nodo / Insertar Ordenado segun Promedio =================}





{================= Comienzo Imprimir Lista Ordenada segun Promedio =================}
Procedure ImprimirListaOrdenada (L:lista);
Begin
     for i:=1 to 10
	     writeln('promedio: ',L^.dato.promedio:2:2);
		 writeln('apellido: ',L^.dato.apellido);
		 writeln('numero: ',L^.dato.nroAlumno);
         L:= L^.sig;
	 end;
End;
{================= Fin Imprimir Lista Ordenada segun Promedio =================}


{================= PROGRAMA PRINCIPAL =================}
Var
   L: lista;
   v:v_maximo;
   dimL:integer;
Begin
    dimL:=0;
    L:= nil;
	ArmarNodo (L);
	ImprimirListaOrdenada (L);
	readln();
End.







