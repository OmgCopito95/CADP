{
Un centro de deportes quiere almacenar la información de sus clientes y de los 4 tipos de actividades que ofrece: 
1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre. 
Para ello, se debe leer el precio mensual de cada actividad y almacenarlo en un vector. 
Además, se debe leer y almacenar la información de los 1000 clientes del centro de deportes. 
De cada uno se conoce: código de cliente, DNI, apellido, nombre, edad y el número de actividad elegida (1..4). 

Escribir un programa que invoque a módulos para resolver cada inciso: 
a) Lea la información de los clientes y los almacene en una estructura de datos. La lectura finaliza con el código de cliente -1 y 
los clientes se leen ordenados por código de cliente. Como máximo el centro de deportes atiende a 1000 clientes.
b) Informe el nombre y apellido de los clientes cuya edad supera el promedio de las edades de los clientes del centro de deportes.
c) Agregar un nuevo cliente, con el código siguiente al último código de cliente ingresado, para el cliente Juan García con DNI 11111, de 20 años 
de edad y que eligió la actividad Libre.
d) Informe el nombre y apellido del cliente con un código de cliente determinado.
e) Informe el nombre y apellido de los clientes mayores de 70 años.
f) Sabiendo que el código de cliente 3300 no existe, inserte un nuevo cliente con ese código para el cliente Ana Paus  de 45 años y actividad 
elegida Musculación.
g) Elimine el cliente correspondiente a un código que se lee. 
h) Elimine todos los clientes que realizan la actividad Spinning.

}
program ejercicioClase3;
const dimF = 1000;
      n = 4;
type vectorPrecios = array [1..n] of real;
     cadena30 = string [30];
     edades = 15..80;
     rango = 1..n;
     rango2 = 0..dimF;
     cliente = record
                 cod: integer;
                 dni: integer;
                 apeYnom: cadena30;
                 edad: edades;
                 act: rango;
               end;
     vectorClientes = array [1..dimF] of cliente;
     
procedure CargarPrecios (var vP: vectorPrecios);     
var i: rango;
begin
  For i:= 1 to n do
  begin
    write ('Precio actividad ', i, ': ');
    readln ( vp [i]);
  end;
  writeln;
end;

procedure ModuloA (var vC: vectorClientes; var dimL: rango2);
{Lea la información de los clientes y los almacene en una estructura de datos. 
 La lectura finaliza con el código de cliente -1 y los clientes se leen ordenados por código de cliente. 
 Como máximo el centro de deportes atiende a 1000 clientes.
}
  procedure LeerCliente (var c: cliente);
  begin
    write ('Codigo: '); readln (c.cod);
    if (c.cod <> -1)
    then begin
			write ('DNI: '); readln (c.dni);
			write ('Apellido y nombre: '); readln (c.apeYnom);
			write ('Edad: '); readln (c.edad);
			write ('Actividad: '); readln (c.act);
	     end;
    writeln;
  end;
  
var cli: cliente;
begin
  writeln;
  writeln ('----- Modulo A -----');
  writeln;
  LeerCliente (cli); dimL:=0;
  while (cli.cod <> -1) and (dimL < dimF) do
  begin
    dimL:= dimL +1;
    vC[dimL]:= cli;
    LeerCliente (cli); 
  end;
end;    

procedure ModuloB (vC: vectorClientes; dimL: rango2);
{Informe el nombre y apellido de los clientes cuya edad supera el promedio de las edades de 
los clientes del centro de deportes.}

  Function Promedio (vC: vectorClientes; dimL: rango2): real;
  var i: rango2; suma: integer;
  begin
    suma:= 0;
    For i:= 1 to dimL do
      suma:= suma + vC[i].edad;
    Promedio:= suma/dimL;
  end;
var prom: real; i: rango2;
Begin
  writeln;
  writeln ('----- Modulo B -----');
  writeln;
  if (dimL = 0)
  then writeln('No se cargaron clientes')
  else begin
         prom:= Promedio (vC, dimL);
         writeln('Clientes cuya edad supera el promedio de edades');
         For i:= 1 to dimL do
           if (vC[i].edad > prom) then writeln (vC[i].apeYnom);
       end;
end;

procedure ModuloC (var vC: vectorClientes; var dimL: rango2);
{Agregar un nuevo cliente, con el código siguiente al último código de cliente ingresado, 
para el cliente Juan García con DNI 11111, de 20 años de edad y que eligió la actividad Libre.}
var cli: cliente;
Begin
  writeln;
  writeln ('----- Modulo C -----');
  writeln;
  if  (dimL = dimF) 
  then writeln ('El vector no tiene mas lugar')
  else begin
		if (dimL = 0)
			then cli.cod:= 1
			else cli.cod:= vC[dimL].cod + 1;
	    cli.dni:= 11111;
	    cli.apeYnom:= 'Juan Garcia';
	    cli.edad:= 20;
	    cli.act:= 4;
	    dimL:= dimL + 1;
	    vC[dimL] := cli;
	    writeln ('El cliente con codigo ', cli.cod, ' fue agregado exitosamente')
	   end;
end;
Function BuscoPosElemOrd (x: integer; v:VectorClientes; dimL: rango2): rango2;
  var pos : rango2;
  begin
    pos:=1;
    while (pos <= dimL) and (x > v[pos].cod) do
             pos:=pos+1;
    if ( pos > dimL ) or (x < v [pos].cod) then pos:=0;
    BuscoPosElemOrd:= pos;
  end;
  
procedure ModuloD (vC: vectorClientes; dimL: rango2);
{Informe el nombre y apellido del cliente con un código de cliente determinado.}
var codigo: integer;
    pos: rango2;
Begin
  writeln;
  writeln ('----- Modulo D -----');
  writeln;
  write ('Ingresar codigo de cliente a buscar: ');
  read (codigo);
  pos:= BuscoPosElemOrd (codigo,vC, dimL);
  if (pos = 0)
  then writeln ('No existe el cliente de codigo ', codigo)
  else writeln ('Cliente encontrado ', vC[pos].apeYnom);
end;


procedure ModuloE (vC: vectorClientes; dimL: rango2);
{Informe el nombre y apellido de los clientes mayores de 70 años.  }
var i: rango2;
Begin
  writeln;
  writeln ('----- Modulo E -----');
  writeln;
  writeln('Clientes con edad mayor a 70');
  For i:= 1 to dimL do
    if (vC[i].edad > 70) then writeln (vC[i].apeYnom);
end;

procedure ModuloF (var vC: vectorClientes; var dimL: rango2);
{Sabiendo que el código de cliente 3300 no existe, inserte un nuevo cliente con ese código 
para el cliente Ana Paus, con DNI 8888, de 45 años y actividad elegida Musculación.}

  Procedure InsertarElemOrd (var v: vectorClientes; var dimL: rango2; elem : cliente; var exito: boolean);

  Function DeterminarPosicion ( x: integer;  v:VectorClientes; dimL: rango2): rango2;
     var pos : rango2;
    begin
        pos:=1;
         while (pos<=dimL) and (x > v[pos].cod) do 
          pos:=pos+1;
        DeterminarPosicion:= pos;
      end; 

  Procedure Insertar (var v:vectorClientes; var dimL:rango2; pos: rango2; elem:cliente);
    var j: rango2;
    begin
        for j:= dimL downto pos do 
          v [ j +1 ] := v [ j ] ;
        v [ pos ] := elem; 
        dimL := dimL + 1;
    End;

 var pos: rango2;

 Begin
   exito := false;  
   if (dimL < dimF) then begin
                           pos:= DeterminarPosicion (elem.cod, v, dimL);
                           Insertar (v, dimL, pos, elem);
                           exito := true;
                         end;
 end;
var cli: cliente; exito: boolean;
Begin
  writeln;
  writeln ('----- Modulo F -----');
  writeln;
  cli.cod:= 3300; cli.apeYnom:= 'Ana Paus'; cli.edad:= 45; cli.act:= 1; cli.dni:= 8888;
  InsertarElemOrd (vC, dimL, cli, exito);
  If (exito = false) 
  then writeln ('No hay más espacio')
  else writeln ('Cliente insertado exitosamente');
end;

Procedure BorrarPosModif (var v: vectorClientes; var dimL: rango2; pos: rango2);
var i: rango2;
begin
    for i:= pos + 1  to   dimL  do
       v [ i - 1 ]  :=  v [ i] ;
    dimL := dimL - 1 ;         
end;

procedure ModuloG (var vC: vectorClientes; var dimL: rango2);
{Elimine el cliente correspondiente a un código que se lee. }
var codigo: integer; pos: rango2;
Begin
  writeln;
  writeln ('----- Modulo G -----');
  writeln;
  write ('Ingresar el codigo del cliente a eliminar: ');
  read (codigo);
  pos:= BuscoPosElemOrd (codigo,vC, dimL);
  if (pos = 0)
  then writeln ('No existe el cliente de codigo ', codigo)
  else begin
         BorrarPosModif (vC, dimL, pos);         
         writeln ('Cliente eliminado exitosamente');
       end;
 end;
  
procedure ModuloH (var vC: vectorClientes; var dimL: rango2);
{Elimine todos los clientes que realizan la actividad Spinning. }
var pos: rango2;
Begin
  writeln;
  writeln ('----- Modulo H -----');
  writeln;
  pos:= 1;  
  while (pos <= dimL) do
    if (vC [pos].act = 2)
    then BorrarPosModif (vC, dimL, pos)
    else pos:= pos + 1;
end;
    
  
  
var vC: vectorClientes; dimL: rango2; vP: vectorPrecios;
begin
  // CargarPrecios (vP);
  ModuloA (vC, dimL);
  ModuloB (vC, dimL);
  ModuloC (vC, dimL);
  ModuloD (vC, dimL);
  ModuloE (vC, dimL);
  ModuloF (vC, dimL);
  ModuloG (vC, dimL);
  ModuloH (vC, dimL);
end.

