{AGREGAR ADELANTE -> guarda los datos al reves
AGREGAR ATRAS -> guarda en el mismo orden
INSERTAR ORDENADO -> guarda ordenado bajo un criterio}

{
El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos astronómicos
observados durante el año 2015.
Los objetos se clasifican en 7 categorías: 1: estrellas, 2: planetas, 3: satélites,
4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su descubrimiento.


A. Desarrolle un programa que lea y almacene la información de los objetos que han sido observados.
Dicha información se lee hasta encontrar un objeto con código -1 (el cual no debe procesarse).
La estructura generada debe mantener el orden en que fueron leídos los datos.


B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente información:
1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.
}

program project1;
type

   rango=1..7;
   cadena20=string[20];

   objeto=record
     cod:integer;
     cat: rango;
     nombre: cadena20;
     distancia: real;
     nombreDesc: cadena20;
     anio: integer;
   end;

   lista=^nodo;
   nodo=record
     dato:objeto;
     sig:lista;
   end;


   vectorContador = array [rango] of integer;

procedure agregarAtras(var l:lista; dato: objeto);
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
procedure leerObjeto(var o:objeto);
var
begin
   readln(o.cod);
   if(o.cod <> -1)then begin
     readln(o.anio);
     readln(o.cat);
     readln(o.distancia);
     readln(o.nombre);
     readln(o.nombreDesc);
   end;
end;
procedure cargarLista(var L:lista);
var
  o:objeto;
begin
   leerObjeto(o);
   while(o.cod<>-1)do begin  //no debe procesarse
     agregarAtras(L,o);  //La estructura generada debe mantener el orden en que fueron leídos los datos.
     leerObjeto(o);
   end;
end;

function planetaDescubierto(anio:integer; nombre:cadena20):boolean;
begin
   {if(anio < 1600) and (nombre = 'Galileo Galilei')
         planetaDescubierto:=true;
   else;
        planetaDescubierto:=false;}

   planetaDescubierto:= (anio < 1600) and (nombre = 'Galileo Galilei')
end;

procedure imprimirVc(vc:vectorContador);
var
  i:integer;
begin
   for(i:=1 to 7)do begin
     writeln('para la categoria',i,'hay',vc[i],'objetos.');  //-> PARA LA CATEGORIA 1 HAY 50 OBJETOS
   end;                                                     //-> PARA LA CATEGORIA 2 HAY 23 OBJETOS

end;


procedure actualizarDosMaximos(dist:real; cod: integer; var max1,max2,codMax1,codMax2:integer);
begin
   if(dist > max1) then begin
      max2:=max1;
      max1:=dist;
      codMax2:=codMax1;
      codMax1:=cod;
    end
    else
        if (dist > max2) then begin
           max2:=dist;
           codMax2:=cod;
        end;
end;

procedure recorrerLista(L:lista; var vc:vectorContador);
var
  max1,max2:real;
  cantPlanetas:integer;

begin
   max1:=-999;
   max2:=-999;

   cantPlanetas:=0;  //punto 2

   while(L<>nil)do begin //CADA ITERACION ES UN OBJETO

     //1.Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
     actualizarDosMaximos(L^.dato.distancia,L^.dato.cod,max1,max2,codMax1,codMax2);  //-> procedure var max1,max2,codMax1,codMax2

     //2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
     if (L^.dato.cat=2) then // es planeta?

        if(planetaDescubierto(L^.dato.anio,L^.dato.nombreDesc))then
          cantPlanetas:=cantPlanetas+1;

     else if (L^.dato.cat = 1) then // es una estrella?
        //4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que impares.
        if(masDigitosParesQueImpares(L^.dato.cod))then //si es una estrella
           writeln(L^.dato.nombre); //lo imprimo porque me dice que informe
           //agregarAdelante()// si me decia que RETORNE los nombres, deberia guardar esos nombres adentro de una lista y devolverla

     //3. La cantidad de objetos observados por cada categoría.
     vc[L^.dato.cat]:= vc[L^.dato.cat] +1;

     L:=L^.sig;
   end;

   //1.imprimo los maximos
   writeln(codMax1,codMax2);

   //2. imprimo cant de planetas
   writeln(cantPlanetas);

   //3. imprimo vector contador
   imprimirVc(vc);
end;

procedure inicializarVectorContador(var vc:vectorContador);
var
  i:integer;
begin
   for(i:=1 to 7)do begin
     vc[i]:=0;
   end;
end;

//PROGRAMA PRINCIPAL
var
  L:lista;
  vc:vectorContador;
begin
  inicializarVectorContador(vc);
  L:=nil; //INICIALIZO LA LISTA
  cargarLista(L,vc);
  recorrerLista(L);

end.












