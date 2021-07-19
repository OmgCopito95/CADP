{13. La tienda de libros Amazon Books está analizando información de algunas editoriales.
 Para elloAmazon cuenta con una tabla con las 35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura,
Historia, Literatura, etc.).

De cada libro se conoce:
 su título,
 nombre de la editorial,
 cantidad de páginas,
 año de edición,
 cantidad de veces que fue vendido
 y código del área temática (1..35).

Realizar un programa que:

A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) .
y devuelva en una estructura de datos adecuada para la editorial “Planeta Libros”, con la siguiente información:

- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.

B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.}


program ejercicios;
const
dimf=35;
type
  rango=1..dimf;
  str=string[40];

  vector =array [rango] of string[20];

  detalle=record
    titulo_data:str;
    nombre_area_tematica:str;
    cant_paginas_mas_250_ventas: integer;
  end;

  lista=^nodo;

  nodo=record
    elem:detalle;
    sig:lista;
  end;


  libro=record            // libros que se leen.
    titulo:str;
    nombre_editorial:str;
    cant_paginas:integer;
    anio_edicion:integer;
    cant_vendido:integer;
    tematic:rango;
  end;

  editorial=record
    nombre_editorial:str;
    anio_libro_mas_antiguo: integer;
    cant_libros_editados:integer;
    total_ventas:integer;
    lista_deta: lista ;
  end;


//procesos//

procedure leerLibro (var l:libro);
begin

	readln (l.titulo);
	//if (l.titulo <> 'Relato de un náufrago') then begin
		readln (l.nombre_editorial);
		readln(l.ant_paginas);
		readln(l.anio_edicion);
		readln(l.cant_vendido);
		readln(l.tematic);
	//end;

end;

procedure actualizarMinimo (anio:integer; var min:integer);
begin
	if anio < min then
		min:=aniol;
	end;
end;

procedure agregarAdelante (var lis:lista; l:libro; v:vector)

var
	aux:lista;

begin
	new(aux);
	aux^.detalle.titulo_data:=l.titulo;
	aux^.detalle.nombre_area_tematica:=v[l.tematic];
	aux^.detalle.cant_paginas_mas_250_ventas:=l.cant_paginas;
	aux^.sig:=lis;
	lis:=aux;
end;



  detalle=record
    titulo_data:str;
    nombre_area_tematica:str;
    cant_paginas_mas_250_ventas: integer;
  end;

procedure leerEditorial(var e:editorial; v:vector);
var
	l:libro
	lis:lista
	anio_minimo:integer;
	suma:integer;
	cant:integer;
begin
	lis:=nil
	anio_minimo:=9999;
	suma:=0;
    cant:=0;
	repeat
	    leerLibro (l);
        if(l.editorial = 'Planeta Libros')then begin
          actualizarMinimo(l.anio_edicion,anio_minimo);
		  cant:=cant+1;
		  suma:=suma+l.cant_vendido;
		  if (l.cant_vendido > 250) then
			 agregarAdelante(lis,l,v);
        end;
	until (l.titulo = 'Relato de un náufrago')

	e.anio_libro_mas_antiguo := anio_minimo;
	e.nombre_editorial:=l.nombre_editorial;
	e.cant_libros_editados:=cant;
	e.total_ventas:=suma;
	e.lista_deta:=lis;
end;

procedure imprimirRegistro(r:detalle)
begin
	writeln(r.titulo_data);
    //falta imprimir nombre de la editorial

	//writeln(r.nombre_area_tematica);
	//writeln(r.cant_paginas_mas_250_ventas);
end;

procedure imprimirLista (l:lista);
begin
	while l <> nil do begin
		imprimirRegistro(l^.elem);
		l:=l^.sig;
	end;
end;


var
v:vector;
e:editorial;
begin
	leerEditorial(e,v);
	imprimirLista(e.lista_deta);
end.




{

14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar
información de préstamos de libros efectuados en marzo de 2020. Para ello, se debe leer la información
de los préstamos realizados. De cada préstamo se lee: nro. de préstamo, ISBN del libro prestado, nro. de
socio al que se prestó el libro, día del préstamo (1..31). La información de los préstamos se lee de manera
ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).

Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.
B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par

}



program: ej1;
const
	dimF = 31;
type
	dias = 1..dimF;
	vectorContador = array [dias] of integer;

	prestamos = record
		prestamo:integer;
		isbn:integer;
		socio:integer;
		dia:dias;
	end;

	libro = record
		isbn:integer;
		cant_prestamos:integer;
	end;

	lista = ^nodo
		dato:libro;
		sig:lista;
	end;


procedure inicializarVector (var v:vector);
var
	i:integer;
begin
	for i:=1 to dimF do
		v[i]:=0;
end;


procedure leer (var p:prestamos);

begin
	readln(p.isbn)
	if p.isbn <> -1 then begin
		readln(p.prestamo);
		readln(p.socio);
		readln(p.dia);
end;

procedure agregarAdelante (var l:lista; prestamos:integer; act:integer);
var
	nue:lista;
begin
	new(nue);
	nue^.dato.isbn:=act;
	nue^.dato.cant_prestamos:=prestamos;
	nue^.sig:=l;
	l:=nue;
end;
procedure minimo (v:vector);
var
	min,i:integer;
	dia:dias;
begin
	min:=9999;
	dia:=-1;
	for i:=1 to dimF do begin
		if v[i] < min then begin
			min := v[i]
			dia := i;
		end;
	end;
	writeln (dia);
end;

function cumple (prestamo:integer; socio:integer) : boolean;
var
	ok:boolean;
begin
	ok:=false
		if (prestamo mod 2 <> 0) and (socio mod 2 = 0) then
			ok:=true;
	cumple:=ok
end;

procesarInformacion (var l:lista; var v:vector);

var
	p:prestamos;
	act:integer;
	cant_prestamos,totalPrestamos,nroImparPrestamoPar:integer;
begin
	totalPrestamos:=0;
	nroImparPrestamoPar:=0;
	leer(p);
	while (p.isbn <> -1) do begin
		act:=isbn
		cant_prestamos:=0
		while (p.isbn <> -1) and (act = isbn)do begin
			totalPrestamos:=Totalprestamos+1;
			if cumple (p.prestamo,p.socio) then
				nroImparPrestamoPar:=nroImparPrestamoPar+1
			cant_prestamos:=cant_prestamos+1
			v[p.dia]:=v[p.dia]+1

			leer (p)
		end;
		agregarAdelante(l,cant_prestamos,act)
	end;
	minimo (v);
	writeln((nroImparPrestamoPar/totalPrestamos)*100:2:2);


end;


var
	l:lista; v:vectorContador
begin
	l=:nil;
	inicializarVector(v);
	procesarInformacion(l,v);
end.




{

Evaluación Parcial (2/3/2021)
La Asociación Internacional de Tenis administra la información de sus asociados y necesita disponer de un programa
modularizado que:
A)	Lea y almacene la información de los asociados. De cada asociado se conoce: Nro Socio,  Apellido, nombre,
categoría (A, B, C, D o E),
	monto básico, montos de los premios obtenidos (a lo sumo 10) y fecha de ingreso a la Asociación. La lectura
    de la información se lee ordenada
	por Nro de socio (de menor a mayor) y finaliza cuando se lee el Nro de Socio -1. La lectura de los montos
    de los premios para cada asociado
	finaliza al leer monto -1. La información debe quedar ordenada por Nro de socio (de menor a mayor).

B)	Una vez leída y almacenada la información:
a.	Obtener una lista de “Pagos” con DNI del asociado y pago total al asociado.  El pago total se calcula de la
siguiente manera:
-	ASOCIADO Categoría A, C, E  Monto básico + premios.
-	ASOCIADO Categoría B, D  Se adiciona, al monto básico + premios, $2000 por cada año de asociado.
b.	Informar para cada categoría la cantidad de asociados que cuenta.
c.	Eliminar de la lista de “Pagos” el asociado con un Nro de Socio que se lee de teclado, de ser posible.


}


program parcial;

const
	dimF = 10;
type
	str = string [20];
	cat = 'A'..'E';
	rangoPremio = 1..dimF;
	Tdia = 1..31;
	Tmes = 1..12;

vectorPremios = array [rangoPremio]  of real;

fecha = record
	dia: Tdia;
	mes: Tmes;
	anio:integer;
end;

asociados = record
	num:integer;
	apellido:str;
	nombre:str;
	categoria:cat;
	basico:real;
	premios:vectorPremios;
	ingreso:fecha;
	dimL:integer;
end;

listaA = ^nodo;
nodo = record
	dato:asociado;
	sig:listaA;
end;

pagos = record
	dni:integer;
	total:real;
end;
listaP = ^elem;
elem = record
	info:pagos;
	sig:listaP;
end;

vectorContador = array [cat] of integer;

procedure inicializarContador (var vc:vectorContador);
var
	i:char;
begin
	for i:='a' to 'e' do
		v[i]:= 0;
end;

procedure leerFecha (var f:fecha);
begin
	readln(f.dia);
	readln(f.mes);
	readln(f.anio);

end;

procedure leerVectorP (var v:premios;var dimL:integer);
var
	monto:real;
begin
	realn (monto);
	while (dimL < dimF) and (monto <> -1) do begin
		dimL:=dimL+1;
		v[dimL]:=monto;
		readln(monto);
	end;
end;

procedure leerAsociado (var a:asociado);
begin
	realn(a.num);
	if num <> -1 then begin
		readln(a.apellido);
		readln(a.nombre);
		readln(a.categoria);
		readln(a.basico);
		dimL:=0;
		leerVectorP(a.premios,a.dimL);
		leerFecha(a.fecha);

end;

procedure agregarAtras (var la:listaA;var ult:ListaA a:asociado);
var
	nue:listaA;
begin
	new(nue);
	nue^.dato:=a;
	nue^.sig:=nil;
	if(l=nil)then begin
		l:=nue;
	else
		ult^.sig:= nue;
	end;
	ult:= nue;
end;


end;


procedure cargarListaA ( var la:listaA );
var
	a:asociado;
	ult:listaA;
begin
	ult:=nil;
	leerAsociado (a);
	while (a.num <> -1) do begin
		agregarAtras (la,ult,a);
		leerAsociado (a);
	end;
end;

function totalVector (v:premios; dimL:integer): real;
var
	i:integer;
	total:real;
begin
	for i:=1 to dimL do
		total := total+v[i];
	totalVector := total;
end;

procedure agregarLista (var lp:listaP; dni:integer; total:real;)
var
	nue:listaP;
begin
	new(nue);
	nue^.data.dni:=dni
	nue^.data.total:=total;
	nue^.sig:=lp;
	lp:=nue;
end;

procedure cargarVectorContador (var vc:vectorContador;categoria:cat);
begin
	vc[categoria]:= vc[categoria] + 1
end;

procedure imprimirVector (vc:vectorContador);
var
	i:char;
begin
	for i:= 'a' to 'e' do
		writeln(vc[i]);
end;

procedure procesarInformacion (var lp:listaP; la:listaA; var vc:vectorContador);

var
	total:real;
begin
	while (la <> nil) do begin
		total:=0
		if ((la^.dato.cat = 'a')or (la^.dato.cat = 'c') or (la^.dato.cat = 'e')) then
			total = la^.dato.monto + totalVector (la^.dato.premio,la^.dato.dimL);
		else
			total = la^.dato.monto + totalVector (la^.dato.premio,la^.dato.dimL) + (2000*la^.dato.fecha.anio)
		agregarlista (lp,la^.dato.dni,total);
		cargarVectorContador (vc,la^.dato.categoria)
		la:=la^.sig;
	end;
	imprimirVector (vc);
end;


function buscarOrdenado(la:listaA; nro:integer):integer;
begin
	while (la <> nil) and (la^.dato.num < nro)
		la:=la^.sig
	if (la <> nil) and (la^.dato.num = nro)
		buscarOrdenado:= la^.dato.dni
	else
		buscarOrdenado:=-1
end;

procedure eliminar (var lp:listaP; dni:integer);
var
	ant,act:listaP;
begin
	act:=lp;
	ant:=lp;
	while (act <> nil) and (act^.data.dni <> dni) do begin
		ant:=act
		act:=act^.sig;
	end;
	if (act <> nil) then  begin
		if (act = lp) then
			lp:=lp^.sig;
		else
			ant^.sig:=act^.sig;
	    dispose (act);
    end;
end;

procedure eliminar (var lp:listaP; nro:integer,la:listaA);
var
	dni:integer;
begin
	dni:=buscarOrdenado(la,nro);
	if (dni <> -1) then
		eliminar(lp,dni);
		writeln ('se elimino el usuario con numero: ',nro);
	else
		writeln ('no se encontro');
end;

//pp

var
	vc:vectorContador;
	lp:listaP;
	la:listaA;
	nro:integer
begin
	la=nil;
	lp=nil;
	inicializarContador (vc);
	CargarListaA (la);
	ProcesarDatos (lp,la,vc);
	readln (nro);
	eliminar(lp,nro,la);
end.












 {
 read(monto)
 while(dimL<dimF) and (monto <>-1)
    dimL:=diml+1;
    vectorMontos[dimL]:=monto
    read(monto)
 end;
   }




 ///CASOS RAROS DE ACCESOS A ESTRUCTURAS

   alumno=record
     nombre:string[10]

  lista^=nodo
  nodo = record
     dato: alumno
     sig

  vector_numeros = array[1..10] of lista;


  v[1]^.dato.nombre:='juanito';



  dir = record
    localidad: stirng[20];
    numeroLaCsa:vector_alumnos;
  end;

  persona = record
    direccion: dir;
  end;

  lista de personas


  p:persona


  p.direccion.localidad:='city bell';
  l^.dato.direccion.numeroLaCsa[1]:=190;

  lp^.dato.direccion.numeroLaCsa[1]^.dato.nombre:='pedrito';

  //---------------------------------------------------------------

   lista_montos=^nodo1;
   nodo1 = record
    dato: integer;
    sig: lista_montos;
   end;

   obra = record
    nombre_obra:String[20];
    montos: lista_montos;
   end;
 
   vector_obras = array [1..100] of obra;

   persona=record
    nombre:string[20];
    obrasSociales: vector_obras;
   end;

   lista=^nodo;
   nodo = record
    dato:persona
    sig:lista;
   end;

 var
    l: lista;

 //si quiero imprimir un monto de una obra social teniendo la lista de personas por ejemplo:


  writeln(l^.dato.obrasSociales[1].montos^.dato)

  //si le quiero cambiar el nombre a la obra social
  l^.dato.obrasSociales[8].nombre_obra:='un nombre';

