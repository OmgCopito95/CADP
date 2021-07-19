//EJERCICIO 9 PRACTICA 7

{
9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se
tiene: código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4:
suspenso, 5: comedia, 6: bélica, 7: documental y 8: terror) y puntaje promedio otorgado por las
críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura
finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).

}


program ejercicios ;
const
dimf =8;
type
  rango=1..dimf;
  str=string[40];

  vector=array [rango] of real;

  peliculas=record;
    cod_peli:integer;
    titulo:str;
    cod_genero:rango;
    puntaje_prom:real;
  end;

  lista=^nodo;

  nodo=record
    elem :peliculas
    sig:lista;
  end;

  criticos=record;
    dni:integer;
    nombre:str;
    apellido:str;
    codigo_peli:integer;
    puntaje:real;
  end;

//procesos//
procedure cargar_lista_pelis (var l:lista); // ya se dispone


procedure inicializar_vector (var v:vector);
var
i:integer;
begin
  for := 1 to dimf do begin
    v[i]:=0;
  end;
end;

procedure leerCritico (var a:criticos);
begin
	readln(a.codigo_peli);
		if (a.codigo_peli<>-1) then begin;
			readln(a.nombre);
			readln(a.dni);
			readln(a.apellido);
			readln(a.puntaje);
	end;
end;


function cumple (dni:integer):boolean;
var
	digito,par,impar:integer;ok:boolean
begin
	ok:false;
	par:=0;
	impar:=0;
	while dni <> 0 do begin
		digito:=dni mod 10
		if digito mod 2 = 0 then
			par:=par+1
		else
			impar:=impar+1;
		dni:=dni div 10;
	end;
	if par = impar then
		ok:=true
	cumple:=ok;
end;

procedure ActualizarOrdenado(var l:lista; promedio:real; aux:integer);
var
	auxLista:lista;
begin
	auxLista:=l;
	while (l^.elem.cod_peli <> aux) do
		auxLista:=auxLista^sig
	auxLista^.elem.puntaje_prom:=promedio

end;

procedure maximo (ve:vector)
var
	i:integer;
	max:real;
	categoria:integer
begin
	max:=-1;
	for i:=1 to dimF do begin
		if (ve[i].puntaje/ve[i].cantidad > max )then
		   max:=ve[i]
		   categoria:=i
	end;
	writeln(categoria);
end;

ActualizarVector (l:lista,var ve:vector);
var
	i:integer;
    act:integer;
begin

		while (l <> nil) do begin
		    ve[l^.dato.codigo_genero].puntaje:=ve[l^.dato.codigo_genero].puntaje+l^.elem.puntaje_prom
		    ve[l^.dato.codigo_genero].cant:=ve[l^.dato.codigo_genero].cant+1
			l:=l^.sig;
		end;

	maximo(ve);

end;
begin
	while l<>nil
		ve[l^.elem.cod_genero] = ve[l^.elem.cod_genero] + l^.elem.puntaje_prom

procedure modificarListaYvector (var l:lista; var ve:vector);
var
	c:criticos;
	aux:integer;
	cantCriticos:integer;
	sumadorPuntajes,promedio:real;
begin
	leerCritico (a);
	while (a.codigo_peli <> -1) do begin

		aux:=a.codigo_peli;
		cantCriticos:=0;
		sumadorPuntajes:=0;

			while (a.codigo_peli <> -1) and (aux = a.codigo_peli) do begin
				cantCriticos:=cantCriticos+1;
				sumadorPuntajes:=sumadorPuntajes+a.puntaje;
				if cumple(a.dni) then             //C
					writeln (a.nombre,a.apellido);
				leerCritico(a);
			end;
		promedio:=sumadorPuntajes/cantCriticos;
		ActualizarOrdenado(l,promedio,aux);
	end;
	ActualizarVector (l,ve); //B
end;

procedure eliminar (var l:lista; num:integer);
var
	cumple:boolean;
	ant,act:lista;
begin
	cumple:=false;
	act:=l; ant:=l;
	while (act <> nil) and (act^.elem.cod_peli <> num) do begin
		ant:=act;
		act:=act^.sig;
	end;
	if act <> nil then begin
		cumple:=true
		if l=act then
			l=l^.sig
		else
			ant^.sig:=act^.sig
	end;
	dispose(act);
	if cumple then
		writeln('se elimino con exito');
	else
		writeln ('no esta el elemento')
end;

//programa principal
var
	l:lista;
	ve:vector;
	cod:integer;

begin
	l:=nil;
	cargar_lista_pelis (l); // ya se dispone
	inicializar_vector(ve);
	modificarListaYvector(l,ve);
	readln(cod)
	eliminar(l,cod);
 end;

//---------------------------------------------------------------------------------

//EJERCICIO 10 PRACTICA 7

{10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que
les provee sus productos. De cada empresa se conoce su código, nombre, si es estatal o privada,
nombre de la ciudad donde está radicada y los cultivos que realiza (a lo sumo 20). Para cada cultivo
de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), cantidad de hectáreas
dedicadas y la cantidad de meses que lleva el ciclo de cultivo.
a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información
se ingresa hasta que llegue una empresa con código -1 (la cual no debe procesarse). Para cada
empresa se leen todos sus cultivos, hasta que se ingrese un cultivo con 0 hectáreas (que no
debe procesarse).
Una vez leída y almacenada la información, calcular e informar:
b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}


Program ejer10;

CONST
  dimF = 20;

Type
     str20 = string[20];

     r_cultivo = record
         tipo: str20;
		 hectareas: integer;
		 mesesCultivo: integer;
     end;

     vector = array [1..20] of r_cultivo;

     r_empresa = record
         codigo: integer;
		 nombre: str20;
		 PublicaPrivada: str20;
		 ciudad: str20;
		 cultivo: vector;
		 cantCultivo: integer //dimL
     end;

	 lista = ^nodo;

	 nodo = record
	     dato:r_empresa;
		 sig:lista;
	 end;





{====================== Comienzo Cargar Lista ======================}

Procedure Leer_Cultivo (VAR c:r_cultivo; VAR dimL:integer;VAR v:vector);
Begin
     with c do begin
		 writeln('Ingrese la cantidad de hectareas');
         readln(hectareas);
		 while (hectareas <> 0) AND (dimL < dimF) do begin
           
               writeln('>> Ingrese tipo de cultivo');
		       readln(tipo);
	           writeln('Ingrese la cantidad de meses que se necesita para cultivar');
		       readln(mesesCultivo);

		       dimL:= dimL + 1;
			   v[dimL]:= c;

		       writeln('Ingrese la cantidad de hectareas');
               readln(hectareas);
		 end;
	 end;
end;



Procedure LEER (VAR e:r_empresa);
VAR
  c:r_cultivo;
Begin
     e.cantCultivos:=0;
     With e do begin
	     writeln('Ingrese el codigo de la empresa');
		 readln(codigo);
		 If (codigo <> -1) then begin
		     writeln('Ingrese el nombre de la empresa');
		     readln(nombre);
		     writeln('Ingrese si es PUBLICA o PRIVADA');
		     readln(PublicaPrivada);
		     writeln('Ingrese la ciudad donde se encuentra la empresa');
		     readln(ciudad);
             writeln('SE COMENZARA A LEER LOS TIPOS DE CULTIVOS QUE TIENE LA EMPRESA');
			 Leer_Cultivo(c,e.cantCultivos,e.cultivo);
		 end;                 //diml              //vector de la empresa
	 end;
End;



Procedure AgregarAdelante (VAR L:lista; e:r_empresa; pos:integer);
VAR
  aux:lista;
Begin
     new(aux);
	 aux^.dato:= e;
	 aux^.dato.cantCultivo:= pos;
	 aux^.sig:= L;
	 L:= aux;
End;


Procedure CargarLista (VAR L:lista);
VAR
  e:r_empresa;
  pos:integer;
Begin
     LEER(e);
	 While (e.codigo <> -1) do begin
	     AgregarAdelante(L,e,pos);
         writeln;
		 LEER(e);
	 end;
End;

{====================== Fin Cargar Lista ======================}



{====================== Comienzo Inciso B ======================}
Function Busqueda (v:vector; dimL:integer; busco:str20): boolean;
VAR
  pos:integer;
  exito:boolean;
Begin
     pos:= 1;
	 exito:= false;
	 while (pos <= dimL) AND (not exito) do begin
	     If (busco = v[pos].tipo) then
		     exito:= true
		 Else
		     pos:= pos + 1;
	 end;
	 If (exito = false) then
	     Busqueda:= false
	 Else
	     Busqueda:= true;
End;




Function Dos_Ceros (cod:integer):boolean;
VAR
   dig:integer;
   cant: integer;
Begin
     cant:= 0;
	 While (cod <> 0) AND (cant <= 2) do begin
	     dig:= dig MOD 10;
		 IF (dig = 0) then
		     cant:= cant + 1;
		 cod:= cod DIV 10;
	 end;
	 If (cant >= 2) then
	     Dos_Ceros:= true
	 Else
	     Dos_Ceros:= false;
End;



{====================== Fin Inciso B ======================}




{====================== Comienzo de Busqueda de un elemento del vector ======================}

Function Busqueda_Posicion (v:vector; dimL:integer; busco:str20): integer;
VAR
  pos:integer;
  exito:boolean;
Begin
     pos:= 1;
	 exito:= false;
	 while (pos <= dimL) AND (not exito) do begin
	     If (busco = v[pos].tipo) then
		     exito:= true
		 Else
		     pos:= pos + 1;
	 end;
	 If (exito = false) then
	    Busqueda_Posicion:= 0
	 Else
	    Busqueda_Posicion:= pos;
End;

{====================== Fin de Busqueda de un elemento del vector ======================}




{====================== Comienzo Inciso C ======================}

Function Sumar (v:vector; dimL:integer): integer;
VAR
   i:integer;
   sumaVec: integer;
Begin
     For i:= 1 to dimL do
	     sumaVec:= sumaVec + v[i].hectareas;
	 Sumar:= sumaVec
End;

{====================== Fin Inciso C ======================}




{====================== Comienzo Inciso D ======================}

Procedure MAXIMO (tiempo:integer; VAR max:integer; name:str20; VAR maxNombre:str20);
Begin
     If (tiempo > max) then begin
	     max:= tiempo;
		 maxNombre:= name;
	 end;
End;

{====================== Fin Inciso D ======================}






{====================== Comienzo Recorrer ======================}

Procedure Recorrer (L:lista);
VAR
  busco,maxNombre: str20;
  TotalHectareas,TiempoCultivoMaiz,max: integer;
  pos:integer;
  Porcentaje:real;
Begin
     max:= -1;

     While (L <> nil) do begin
         TotalHectareas:= 0;
         Porcentaje:= 0;

	     busco:= 'TRIGO';
	     If (Busqueda(L^.dato.cultivo,L^.dato.cantCultivo,busco)) then begin               //Inciso B
		     If (L^.dato.ciudad = 'SAN MIGUEL DEL MONTE') AND (Dos_Ceros(L^.dato.codigo)) then
			     writeln('Nombre de la empresa: ',L^.dato.nombre);
		 end;

         //TODAS LAS HECTAREAS DE LOS CULTIVOS DE ESA EMPRESA
		 TotalHectareas:= TotalHectareas + Sumar (L^.dato.cultivo,L^.dato.cantCultivo);  //Inciso C


		 busco:= 'SOJA';
         pos:= Busqueda_Posicion (L^.dato.cultivo,L^.dato.cantCultivo,busco);
         If (pos <> 0) then begin
		     writeln('La cantidad de hectáreas dedicadas al cultivo de soja es: ',L^.dato.cultivo[pos].hectareas);
		     Porcentaje:= (L^.dato.cultivo[pos].hectareas * 100)/ TotalHectareas;
		     writeln('Porcentaje representa con respecto al total de hectareas: ',Porcentaje:3:2,'%');
         end;


         busco:= 'MAIZ';
         pos:= Busqueda_Posicion (L^.dato.cultivo,L^.dato.cantCultivo,busco);              //Inciso D
         If (pos <> 0) then begin
             TiempoCultivoMaiz:= L^.dato.cultivo[pos].mesesCultivo;
		     MAXIMO (TiempoCultivoMaiz, max,L^.dato.nombre, maxNombre);
         end;

		 busco:= 'GIRASOL';
    	 pos:= Busqueda_Posicion (L^.dato.cultivo,L^.dato.cantCultivo,busco);
         If (pos <> 0) then begin
		    If (L^.dato.cultivo[pos].mesesCultivo < 5) AND (L^.dato.PublicaPrivada = 'PRIVADA') then
		           L^.dato.cultivo[pos].mesesCultivo:= L^.dato.cultivo[pos].mesesCultivo + 1;
		 end;

	     L:= L^.sig;
	 end;
	 writeln('La empresa que dedica mas tiempo al cultivo de maiz es: ',maxNombre);
End;

{====================== Fin Recorrer ======================}




{====================== PROGRAMA PRINCIPAL ======================}

VAR
  L:lista;
Begin
  L:= nil;
  CargarLista (L);
  Recorrer (L);
  readln();
End.



//-------------------------------------------------------------------------------------

//EJERCICIO 1 PRACTICA 7


{
1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.
Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.
}

program project1;
type
  genero=1..5;
  cadena20=string[20];
  actor=record
    DNI:integer;
    apellido:cadena20;
    nombre:cadena20;
    edad:integer;
    codigo:genero;
  end;
  vgenero=array[genero]of integer;
  lista=^nodo;
  nodo=record
    dato:actor;
    sig:lista;
  end;
procedure LeerActor (var a:actor);
begin
  with a do begin
    writeln('Ingrese el DNI,apellido,nombre,edad y codigo(1 al 5)');
    readln(DNI);
    readln(apellido);
    readln(nombre);
    readln(edad);
    readln(codigo);
  end;
end;
function MasPares(dni:integer):integer;
var
  aux,dig,cant_pares,cant_impares:integer;
begin
  cant_pares:=0;
  cant_impares:=0;
  while (dni<>0) do begin
    dig:= dni mod 10;
    if (dig mod 2 =0) then cant_pares:=cant_pares+1
    else cant_impares:=cant_impares+1;
    dni:=dni div 10;
  end;
  if (cant_pares>cant_impares) then aux:=1
  else aux:=0;
  MasPares:=aux;
end;
procedure cargarlista(var l,ult:lista;var cantPares:integer;var vec:vgenero);
var
  nue:lista;
  a:actor;
begin
  repeat
    LeerActor(a);
            new(nue);
            nue^.dato:=a;
            nue^.sig:=nil;      //MODULARIZAR
            if (l<>nil) then
              ult^.sig:=nue
            else
              l:=nue;
            ult:=nue;
    vec[a.codigo]:=vec[a.codigo]+1;    //hacer en un recorrer lista
    cantPares:=cantPares+MasPares(a.DNI); //hacer en un recorrer lista
  until(a.DNI=33555444);
end;
procedure inicializar (var v:vgenero);
var
  i:integer;
begin
  for i:=1 to 5 do
    v[i]:=0;
end;
procedure dos_max_generos(v:vgenero;var maxgenero,maxgenero2:integer);
var
  i,aux,aux2:integer;
begin
  aux:=-1;
  aux2:=-1;
  for i:=1 to 5 do begin
    if (aux<v[i]) then begin
      maxgenero2:=maxgenero;
      maxgenero:=i;
      aux2:=aux;
      aux:=v[i];
    end
    else begin
      if (aux2<v[i]) then begin
        maxgenero2:=i;
        aux2:=v[i];
      end;
    end;
  end;
end;
procedure eliminar_actor(var l:lista;dni:integer;var exito:boolean);
var
  ant,act:lista;
begin
  exito:=false;
  act:=l;
  while (act<>nil) and (act^.dato.dni<>dni) do begin
    ant:=act;
    act:=act^.sig;
  end;
  if (act<>nil) then begin
    exito:=true;
    if (act=l) then l:=act^.sig
    else ant^.sig:=act^.sig;
    dispose(act);
    end;
end;
var
  PtrActor,ult:lista;
  vector_genero:vgenero;
  cantPares,maxgenero,maxgenero2,DNI:integer;
  exito:boolean;
begin
  PtrActor:=nil;
  ult:=nil;
  cantPares:=0;
  inicializar(vector_genero);
  cargarlista(PtrActor,ult,cantPares,vector_genero);
  dos_max_generos(vector_genero,maxgenero,maxgenero2);
  writeln('Ingrese DNI para eliminar actor');
  readln(DNI);
  eliminar_actor(PtrActor,DNI,exito);
  if (exito) then writeln('El actor fue eliminado');
  else ('Dicho DNI no existe');
  writeln('La cantidad de DNI con mas digitos pares que impares es: ',cantPares);
  writeln('Los dos codigos de genero mas elegido son: ',maxgenero,' y ',maxgenero2);
end.



//--------------------------------------------------------------
//--------------------------------------------------------------
//--------------------------------------------------------------


function cumple(dni:integer):boolean;
var
    dig:integer;
    esImpar:boolean;
begin
    esImpar:=false;
    while (dni<> 0) and ( not esImpar) do begin //mientras no termine y sea impar
        dig:= dni mod 10;// 121 -
        if (dig mod 2 = 1) then
            esImpar:=true; //es impar, por lo tanto no cumple
        dni:=dni div 10;
    end;
    cumple:= not esImpar;
end;


//------------------------------------------------------------------------

{ PARCIAL VIEJO

Un centro de estética ofrece 12 planes para sus clientes: ozonoterapia, cama solar, spa,
depilación, tratamiento antiarrugas, etc.
Cada plan posee un código de plan (1..12), un costo total y una cantidad de sesiones. Se
dispone de una estructura con esta información.

El centro de estética posee como máximo 9000 clientes.
Realizar un programa que lea información de los clientes del centro de estética.
De cada cliente se lee su nombre, DNI, ciudad de origen, código de plan contratado, y si
ya finalizó el tratamiento.
La información de los clientes finaliza al ingresar al cliente "Mirtha Legrand" con DNI
2.320.718 (que debe procesarse) o al alcanzarse el máximo de clientes.


Una vez leída y almacenada la información, procesar los datos para:

1) Informar la ganancia del centro para cada tipo de plan (incluyendo tratamientos
finalizados y no finalizados).
2) Almacenar en una lista todos los datos de los clientes cuyos tratamientos aún no han
finalizado.


}



program parcialcentro;

const
totalPlames = 12;
totalClientes = 9000;
type

	str=string[30];
	rangoPlanes = 1..totalPlanes;
	rangoClientes = 1..totalClientes;
	planes = record
		costo:real;
		sesiones:integer;
	end;
	vectorPlanes = array [rangoPlanes] of planes;
	cliente = record
		nombre:str;
		dni:integer;
		ciudad:str;
		codigo:rangoPlanes;
		tratamiento:boolean;
	end;
	vectorClientes = array [rangoClientes] of cliente;
	vectorContador = array [rangoPlanes] of real;
	lista = ^nodo;
	nodo = record
		elemento:clientes;
		sig:lista;
	end;

//modulos
procedure leerCliente (var c:cliente);
begin
	readln(c.nombre);
	readln(c.dni);
	readln(c.ciudad);
	readln(c.codigo);
	readln(c.tratamiento);
end;

procedure inicializarVcontador (var vc:vectorContador);
var
	i:integer;
begin
	for i:=1 to totalPlames do
		vc[i]:=0;
end;


procedure cargarClientes (var c:vectorClientes; var dimL:integer);
var
	aux:cliente;
begin
	repeat
		leerCliente (aux);
		dimL := dimL+1;
		c[dimL]:=aux
	until (dimL = totalClientes) or ((aux.nombre = 'mirtha legrand') and (aux.dni = 2320718));
end;

procedure cargarlista(var l:lista; dato:cliente);
var
	nue:lista
begin
	new(nue);
	nue^.elemento:=dato;
	nue^.sig:=l;
	l:=nue;
end;

procedure imprimirVector (vc:vectorContador)
var
	i:integer;
begin
	for i:=1 to totalPlanes do
	    writeln ('no tengo ganas de poner el comentario')
        writeln (vc[i]);
end;

recorrerVector (c:vectorCliente; var l:lista; dimL:integer; var vc:vectorContador; p:vectorPlanes);
var
	i:integer
	costo:real;
begin
	for i:=1 to dimL do begin
		if (c[i].tratamiento = true) then
			cargarlista(l,c[i]);
	vc[c[i].codigo] :=vc [c[i].codigo] + (p[c[i].codigo].costo * p[c[i].codigo].sesiones)
	end;
	imprimirVector(vc);
end;


//pp
var
	l:lista;
	p:vectorPlanes;
	c:vectorClientes;
	dimL:integer;
	vc:vectorContador
begin
	l:=nil;
	dimL:=0;
	inicializarVcontador(vc);
	cargarPlanes(p); // se dispone
	cargarClientes(c,dimL);
	recorrerVector(c,l,dimL,vc,p);
end.


//--------------------------------------------------------------------
//--------------------------------------------------------------------

// EJERCICIO 7 PRACTICA 6  (NO ESTA DEL TODO CHEQUEADO SI ESTA BIEN,OJO)

program Ejer7;
type
  cadena50=string[50];
  sonda=record
          nombre:cadena50;
          duracion:integer;//meses de duracion
          costo:real;      //costo de la construccion de la nave
          costo_mensual:real;  //costo mantenimiento mensual
          rango:1..7;
        end;

  lista=^nodo;

  nodo=record
    dato:sonda;
    sig:lista;
  end;
  ptrvector=^vespectro;
  vespectro=array[1..7]of integer;
procedure LeerSonda (var son:sonda);
begin
  with son do begin
    writeln('Ingrese el nombre, duracion estimada de la mision, el costo de construccion, el costo de mantenimiento mensual y el rango del espectro electromagnetico de la sonda');
    readln(nombre,duracion,costo,costo_mensual,rango);
  end;
end;
procedure CrearLista (var pri,ult:lista;s:sonda);
var
  nue,act:lista;
begin
  new(nue);
  nue^.dato:=s;
  nue^.sig:=nil;
  if (pri<>nil) then ult^.sig:=nue
  else pri:=nue;
  ult:=nue;
end;
function cumple(s:sonda):boolean;
begin
  cumple:=((s.costo_mensual*s.duracion)<s.costo);
end;
procedure DividirListas(PunSonda:lista;var Lcumple,Lnocumple:lista);
var
  nue,ultcumple,ultnocumple:lista;
begin
  ultcumple:=nil;
  ultnocumple:=nil;
  while (PunSonda<>nil) do begin

     if (cumple(PunSonda^.dato)) then begin
         agregarAdelante(Lcumple,PunSonda^.dato)
     else
         agregarAdelante(Lnocumple,PunSonda^.dato)

    PunSonda:=PunSonda^.sig;
  end;
end;
procedure recorrerListaCumple(LC:lista);
begin
  while (LC<>nil) do begin
    writeln(LC^.dato.nombre);
    LC:=LC^.sig;
  end;
end;
procedure recorrerListaNoCumple(LNC:lista);
begin
  while (LNC<>nil) do begin
    writeln(LNC^.dato.nombre);
    LNC:=LNC^.sig;
  end;
end;
{c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y
el costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}
procedure ProyectosNoFinanciadosH2020 (LNC:lista;var Costo:real;var cantidad:integer);
begin
  while (LNC<>nil) do begin
    cantidad:=cantidad+1;
    costo:=costo+(LNC^.dato.costo*LNC^.dato.costo_mensual);
    LNC:=LNC^.sig;
  end;
end;

var
  PunVec:ptrvector;
  PunSonda,ult,ListaCumple,ListaNoCumple:lista;
  info_sonda:sonda;
  costo_total:real;
  cantidad_proyectos:integer;
begin
  PunSonda:=nil;
  ListaCumple:=nil;
  ListaNoCumple:=nil;
  ult:=nil;
  costo_total:=0;
  cantidad_proyectos:=0;

  repeat                        //MODULO
    LeerSonda(info_sonda);
    CrearLista(PunSonda,ult,info_sonda);
    if (cumple(info_sonda)) then writeln('Cumple con los criterios H2020')
    else writeln('No cumple con los criterios H2020');
  until(info_sonda.nombre='GAIA');



  DividirListas(PunSonda,ListaCumple,ListaNoCumple);
  writeln('Lista que recorre las sondas que no cumple');
  recorrerListaCumple(ListaCumple);
  writeln('Lista que recorre las sondas que no cumple');
  recorrerListaNoCumple(ListaNoCumple);

  ProyectosNoFinanciadosH2020(ListaNoCumple,costo_total,cantidad_proyectos);
  writeln('La cantidad de proyectos que no se van a financiar por H2020 es: ',cantidad_proyectos);
  writeln('El costo total que se ahorra en el H2020 es: ',costo_total:1:2);
  readln();
end.



















