program project1;

type

  rango = 1..26;
  cadena15 = String[15];

  categoria = record
    nombre: cadena15;
    precioxKg: real;
  end;

  vectorCategorias = array [rango] of categoria;

  vectorMontos = array [rango] of real;

  compra = record
    dni: integer;
    categoria: rango;
    cantidadKg: integer;
  end;

  listaCompras = ^nodo;
  nodo = record
    dato: compra;
    sig: listaCompras;
  end;


procedure leerCategoria(var c: categoria; var cod: rango);
begin
  readln(cod);
  readln(c.nombre);
  readln(c.precioxKg);
end;

procedure informacionDeCategorias(var vCat: vectorCategorias);
var
   c: categoria;
   i: integer;
   cod: rango;
begin

  for i:=1 to 26 do begin
      leerCategoria(c,cod);
      vCat[cod] := c;
  end;

end;

function cumpleDni(dni:integer):boolean;
var
   dig,cant:integer;
begin
  cant:=0;
  while(dni<>0) and (cant < 3)do begin
      dig:=dni mod 10;
      if dig mod 2 = 0 then
         cant:=cant+1;
      dni:=dni div 10;
  end;

  cumpleDni:=(cant>=3);
end;

procedure actualizarMaximo(cantCompras:integer;dni:integer;var max:integer; var dniMax: integer);
begin
  if (cantCompras > max) then begin
    max:=cantCompras;
    dniMax:=dni;
  end;
end;

procedure recorrerLista(l:listaCompras; vCat: vectorCategorias; var montoCategorias: vectorMontos; var cantComprasDni3Digitos:integer; var dniMax: integer);
var
  dniActual,cantCompras,max:integer;
begin
  max:=-1;
  cantComprasDni3Digitos :=0;
  while (l<>nil) do begin

      dniActual:=l^.dato.dni; //me guardo el dni actual
      cantCompras:=0; //pongo en cero la var que cuenta cant de compras de clientes

      while(l<>nil) and (l^.dato.dni = dniActual) do begin
          cantCompras := cantCompras + 1; //sumo una compra para el cliente
          montoCategorias[l^.dato.categoria]:=montoCategorias[l^.dato.categoria] + (l^.dato.cantidadKg * vCat[l^.dato.categoria].precioxKg);
          l:=l^.sig;
      end;

      if (cumpleDni(dniActual))then
         cantComprasDni3Digitos := cantComprasDni3Digitos + cantCompras;

      actualizarMaximo(cantCompras,dniActual,max,dniMax);
  end;

end;

procedure inicializarVectorMontos(var vMontos:vectorMontos);
var
   i: integer;
begin
  for i:=1 to 26 do
      vMontos[i]:=0;
end;

procedure recorrerVectorMontos(v: vectorMontos);
var
   i:integer;
begin
  writeln('punto B');
  for i:=1 to 26 do
      writeln('para la categoria',i,'se junto',v[i]);
end;

var
   vCat: vectorCategorias;
   l: listaCompras;
   vMontos: vectorMontos;
   cantCompras,dniMax:integer;

begin
  l:=nil;
  cantCompras:=0;
  dniMax:=0;

  //cargarListaCompras(l); // se dispone
  informacionDeCategorias(vCat);

  inicializarVectorMontos(vMontos);
  recorrerLista(l,vCat,vMontos,cantCompras,dniMax);

  writeln('punto A', dniMax);
  writeln('punto C', cantCompras);
  recorrerVectorMontos(vMontos);


end.

