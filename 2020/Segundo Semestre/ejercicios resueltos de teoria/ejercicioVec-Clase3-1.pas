program ejercicioVec1(Clase3);
{
 Un centro de deportes quiere almacenar la información de sus clientes y de los 4 tipos de actividades que ofrece: 
 1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre. 
  Para ello, se debe leer el precio mensual de cada actividad y almacenarlo en un vector. 
  Además, se debe leer y almacenar la información de los 1000 clientes del centro de deportes. 
  De cada uno se conoce: código de cliente, DNI, apellido y nombre, fecha de ingreso, 
  edad y el número de actividad elegida (1..4). 
  
  Escribir un programa que invoque a módulos para resolver cada inciso: 
a) Lea la información de los clientes y los almacene en una estructura de datos. La lectura finaliza con el código de cliente -1 y los clientes se leen ordenados por código de cliente. Como máximo el centro de deportes atiende a 1000 clientes.
b) Informe el nombre y apellido de los clientes cuya edad supera el promedio de las edades de los clientes del centro de deportes.
c) Agregar un nuevo cliente, con el código siguiente al último código de cliente ingresado, para el cliente Juan García con DNI 11111, de 20 años de edad y que eligió la actividad Libre, en el día de la fecha.
d) Informe el nombre y apellido del cliente con un código de cliente determinado.
e) Informe el nombre y apellido de los clientes con fecha de ingreso en un año determinado.
f) Sabiendo que el código de cliente 3300 no existe, inserte un nuevo cliente con ese código para el cliente Ana Paus  de 45 años y actividad elegida Musculación, en el día de la fecha.
g) Elimine el cliente correspondiente a un código que se lee. 
h)Elimine todos los clientes que realizan la actividad Spinning.

}

{tipos de datos definidos por el usuario}
const
  cant_act = 4;
  dimF = 1000;
type
  cadena = string[50];
  rango_act = 1..cant_act;
  rango_clientes = 0..dimF;
  rango_edad = 14..90;
  
  dias=1..31;
  meses=1..12;
  anios= 1900..3000;
  
  fecha= record
           d:dias;
           m:meses;
           a:anios;
         end;   

  precios = array[rango_act] of real;
  contador = array[rango_act] of integer;

  cliente = record
    cod: integer;
    dni: integer;
    ape: cadena;
    nom: cadena;
    fe_ing: fecha;
    edad: rango_edad;
    act: rango_act;
  end;

  clientes = array[1..dimF] of cliente;

{procesos y funciones}

procedure cargar_precios(var vec_pre: precios);
var
  i: rango_act;
begin
  FOR i:= 1 to cant_act DO BEGIN
    write('- Precio ', i, ': ');
    readln(vec_pre[i]);
  END;
end;


procedure AsignarDatosCliF(cod:integer; var c: cliente);
  begin
    writeln;
    writeln('-- NUEVO CLIENTE A INSERTAR--');
    c.cod:= cod;
    c.dni := 12121;
    c.ape := 'Paus';
    c.nom := 'Ana';
    with c.fe_ing do begin
      d := 28;
      m := 10;
      a := 2020;
    end;
    c.edad:= 45;
    c.act:= 1;
  end;

procedure leer_Datoscliente(var c: cliente);
  begin
    writeln;
    writeln('-- NUEVO CLIENTE --');
    write('- Codigo: ');
    readln(c.cod);
    write('- DNI: ');
    readln(c.dni);
    write('- Apellido: ');
    readln(c.ape);
    write('- Nombre: ');
    readln(c.nom);
    with c.fe_ing do begin
      writeln('- Fecha Ingreso - ');
      write('- Dia: ');
      readln(d);
      write('- Mes: ');
      readln(m);
      write('- Anio: ');
      readln(a);
    end;
    write('- Edad: ');
    readln(c.edad);
    write('- Actividad: ');
    readln(c.act);
  end;


procedure cargar_clientesA(var cli: clientes; var diml: rango_clientes; var SE: integer);

  procedure leer_cliente(var c: cliente);
  begin
    writeln;
    writeln('-- NUEVO CLIENTE --');
    write('- Codigo: ');
    readln(c.cod);
    if (c.cod <> -1) then begin 
        write('- DNI: ');
        readln(c.dni);
        write('- Apellido: ');
        readln(c.ape);
        write('- Nombre: ');
        readln(c.nom);
        with c.fe_ing do begin
          writeln('- Fecha Ingreso - ');
          write('- Dia: ');
          readln(d);
          write('- Mes: ');
          readln(m);
          write('- Anio: ');
          readln(a);
        end;
        write('- Edad: ');
        readln(c.edad);
        write('- Actividad: ');
        readln(c.act);
     end;   
  end;

var c: cliente; 
begin
  diml:= 0; 
  SE :=0;
  leer_cliente(c);
  while (diml<dimF) and (c.cod<>-1) DO BEGIN
    diml:= diml+1;
    cli[diml] := c;
    SE := SE + cli[diml].edad;
    leer_cliente(c);
  END;
end;


procedure AsignarDatosCliC(codigo:integer; var c: cliente);
  begin
    writeln;
    writeln('-- NUEVO CLIENTE --');
    c.cod:= codigo+1;
    c.dni := 11111;
    c.ape := 'Garcia';
    c.nom := 'Juan';
    with c.fe_ing do begin
      d := 28;
      m := 10;
      a := 2020;
    end;
    c.edad:= 20;
    c.act:= 4;
  end;
  
procedure AgregarCli (var cli:clientes; var diml: rango_clientes; c:cliente; var exito:boolean);

begin
  exito:=false;
  if (diml<dimF)then begin 
				  exito:=true; 	
                  cli[diml+1]:= c;
                  diml := diml+1;
                end;  
end;

procedure mostrar_clientes(cli: clientes; dl: rango_clientes);
  var i: rango_clientes;
  begin
    FOR i:= 1 to dl DO BEGIN
      writeln;
      writeln('-- DATOS CLIENTE ', i);
      writeln;
      write(' DNI: ');
      writeln(cli[i].dni);
      write(' Codigo: ');
      writeln(cli[i].cod);
      write(' Apellido: ');
      writeln(cli[i].ape);
      write(' Nombre: ');
      writeln(cli[i].nom);
      write(' Fecha Ingreso: ');
      writeln(cli[i].fe_ing.d, '/', cli[i].fe_ing.m, '/', cli[i].fe_ing.a);  
      write(' Edad: ');
      writeln(cli[i].edad);
      write(' Actividad: ');
      writeln(cli[i].act);
      writeln ('--------------------------------------------');
      writeln;
    end;   
  end;
  
procedure MostrarClientesB (cli:clientes; diml:rango_clientes; p: integer);
 var i:rango_clientes;
 begin
   writeln;                  
   writeln('-- NOMBRE Y APELLIDO DE LOS CLIENTES QUE SUPERAN EL PROMEDIO');
   writeln;
   for i:= 1 to diml do begin
    if (cli[i].edad > p) then begin
                           writeln;                  
                           writeln('-- NOMBRE Y APELLIDO DEL CLIENTE: ', cli[i].nom,' ', cli[i].ape );
                         end; 
   end;
 end; 

Function BuscoPosElemOrd (x: integer; cli:clientes; diml: rango_clientes): rango_clientes;
  var pos : rango_clientes;
  begin
    pos:=1;
    while (pos<=diml) and (x>cli[pos].cod) do
             pos:=pos+1;
    if ( pos>dimL ) or (x<cli[pos].cod) then pos:=0;
    BuscoPosElemOrd:= pos;
  end; 

 procedure informarE (cli:clientes; diml:rango_clientes; dato: anios);
 var i:rango_clientes;
 begin
   writeln;                  
   writeln('-- NOMBRE Y APELLIDO DE LOS CLIENTES QUE HAN INGRESADO EN: ', dato);
   writeln;
   for i:= 1 to diml do begin
    if (cli[i].fe_ing.a = dato) then begin
                                  writeln;                  
                                  writeln('-- ', cli[i].nom,' ', cli[i].ape );
                                 end; 
   end;
 end;   


procedure AsignarDatosCliF(var c: cliente);
  begin
    c.cod:= 3300;
    c.dni := 12121;
    c.ape := 'Paus';
    c.nom := 'Ana';
    with c.fe_ing do begin
      d := 28;
      m := 10;
      a := 2020;
    end;
    c.edad:= 45;
    c.act:= 1;
  end;
  
  
Procedure InsertarElemOrd (var cli:clientes; var diml: rango_clientes; c:cliente; var exito: boolean);
  
  Function DeterminarPosicion ( x: integer; cli:clientes;diml:rango_clientes): rango_clientes;
  var pos:rango_clientes;
  begin
    pos:=1;
    while (pos<=diml) and (x > cli[pos].cod) do 
      pos:=pos+1;
    DeterminarPosicion:= pos;
  end; 

 Procedure Insertar (var cli:clientes; var diml:rango_clientes; pos: rango_clientes; c:cliente);
  var j: rango_clientes;
  begin
   for j:= dimL downto pos do 
     cli[j+1]:=cli[j];
   cli[pos]:=c; 
   dimL := dimL + 1;
  End;

var pos: rango_clientes;
Begin
 exito := false;  
 if (dimL < dimF) then begin
                    exito := true;
                    asignarDatosCliF (c);
                    pos:= DeterminarPosicion (c.cod,cli,diml);
                    Insertar (cli, diml, pos, c);
                  end;
end;

Procedure BorrarElem (var cli:clientes; var diml:rango_clientes; codigo:integer; var exito:boolean);
Function BuscarPosElem (x:integer;cli:clientes;diml:rango_clientes):rango_clientes;
var pos:rango_clientes; exito: boolean;
Begin
 pos:=1; exito:= false;
 while (pos<=dimL) and (not exito) do
      if (x = cli[pos].cod) then exito:= true
                            else pos:=pos+1;
 if (exito = false) then pos:=0;
 BuscarPosElem := pos;
end;

Procedure BorrarPosModif (var cli:clientes; var diml:integer; pos:rango_clientes);
var i:rango_clientes;
begin
 for i:= pos + 1 to diml do
     cli[i-1]:= cli[i];
 diml:= diml-1 ;         
end;
 
var pos: rango_clientes;
Begin
  exito:= false;
  pos:= BuscarPosElem (codigo, cli, diml);
  if pos <> 0 then begin
                 BorrarPosModif (cli, diml, pos);
                 exito:= true;
              end;
end;

procedure BorrarTodosAct (var cli: clientes; var diml:rango_clientes; act:rango_act);
Procedure BorrarPosModif (var cli:clientes; var diml:rango_clientes; pos:rango_clientes);
var i:rango_clientes;
 begin
    for i:= pos + 1  to   diml  do
       cli [ i - 1 ]:= cli [ i] ;
    diml:= diml - 1 ;         
 end;

var pos:rango_clientes;
begin
pos:= 1;
while (pos<=diml) do begin
  if cli[pos].act=act then BorrarPosModif(cli,diml,pos)
                      else pos:=pos+1;  
end;                      
end;


{variables del programa principal}
var
  {vector de los precios de las actividades}
  vec_pre: precios;
  {datos de los cliente}
  cli: clientes;
  {datos cliente nuevo}
  c:cliente;
  {variables para dimensión lógica y posición a insertar/borrar}
  diml, pos: rango_clientes;
  a:anios; act:rango_act;
  suma, codigo, pro: integer;
  exito:boolean;
  
begin
  writeln('-- CARGA DE PRECIOS DE LAS ACTIVIDADES --');
  writeln;
  cargar_precios(vec_pre);
  writeln;
  writeln('-- CARGA DE CLIENTES --');
  writeln;
  writeln;
  writeln('-- Presione una tecla para continuar con el Inciso a) --');
  readln;
  cargar_clientesA(cli,diml,suma);
  writeln;
  writeln('-- CLIENTES ALMACENADOS --');
  writeln;
  mostrar_clientes (cli, diml);
  writeln;
  writeln;
  writeln('-- Presione una tecla para continuar con el Inciso b) --');
  readln;
  if diml>0 then begin
              pro:=suma div diml;
              writeln;
              writeln('-- CLIENTES CON EDAD SUPERIOR AL PROMEDIO --');
              writeln;
              writeln ('Promedio obtenido: ', pro);
              writeln;
              MostrarClientesB (cli,diml,pro);
              writeln;
              writeln;
            end
            else begin
              writeln;
              write('-- NO HAY DATOS CARGADOS. NO SE PUEDE CALCULAR PROMEDIO --');
              writeln;
            end;  
  writeln('-- Presione una tecla para continuar con el Inciso c) --');
  readln;
  codigo:=cli[diml].cod;
  AsignarDatosCliC (codigo,c);
  AgregarCli (cli,diml,c,exito);
  if (exito)then begin
                  writeln;
                  writeln('-- SE AGREGO CLIENTE NUEVO --');
                  writeln;  
             end
             else begin
                  writeln;
                  writeln('-- NO ES POSIBLE AGREGAR CLIENTE NUEVO (VECTOR COMPLETO) --');
                  writeln;  
             end;
  writeln;
  writeln('-- Presione una tecla para continuar para mostrar Vector con cliente agregado --');
  readln;               
  writeln;
  writeln('-- CLIENTES ALMACENADOS LUEGO DE AGREGAR NUEVO CLIENTE --');
  writeln;
  mostrar_clientes (cli, diml);
  writeln;                
  writeln;
  writeln('-- Presione una tecla para continuar con el Inciso d)--');
  readln;
  writeln;
  write('-- INGRESE CODIGO DE CLIENTE PARA MOSTRAR SU NOMBRE Y APELLIDO --');
  read (codigo);
  writeln;
  pos:= BuscoPosElemOrd (codigo,cli,diml);
  if pos <> 0 then begin
                writeln;
                writeln('-- SE ENCONTRO EL CLIENTE CON CODIGO -- ', codigo);
                writeln;                  
                writeln('-- SU NOMBRE ES: ', cli[pos].nom);
                writeln('-- SU APELLIDO ES: ', cli[pos].ape);
               end 
               else begin
                writeln;
                writeln('-- NO SE ENCONTRO EL CLIENTE CON CODIGO -- ', codigo);
                writeln;
               end;
  writeln;
  writeln('-- Presione una tecla para continuar con el Inciso e) --');
  readln;
  writeln;
  writeln('-- INGRESE ANIO DE INGRESO AL CENTRO DE DEPORTES: ');
  read (a);
  writeln;
  informarE (cli,diml,a);
  writeln;
  writeln('-- Presione una tecla para continuar con el inciso f)--');
  readln;
  writeln;
  writeln('-- Se inserta de ser posible el cliente con codigo 3300 --');
  AsignarDatosCliF(c);
  InsertarElemOrd (cli,diml,c,exito);
  if exito then begin
             writeln ('SE INSERTO EL CLIENTE CON CODIGO 3300');
             writeln;
             writeln('-- CLIENTES ALMACENADOS LUEGO DE INSERTAR EL CLIENTE CON CODIGO 3300 --');
             writeln;
             mostrar_clientes (cli, diml);
             writeln;   
           end  
           else writeln ('NO SE PUDO INSERTAR EL CLIENTE CON CODIGO 3300');
  writeln;
  writeln;
  writeln('-- Presione una tecla para continuar con el Inciso g) --');
  readln;
  writeln;
  writeln;
  write('- Ingrese codigo de cliente a eliminar (de ser posible): ');
  readln(codigo);
  BorrarElem (cli,diml,codigo,exito);
  if exito then begin
             writeln ('SE BORRO EL CLIENTE CON CODIGO ', codigo);
             writeln ('CLIENTES ALMACENADOS LUEGO DE ELIMINAR AL CLIENTE CON CODIGO LEIDO');
             writeln;
             mostrar_clientes (cli, diml);
             writeln;
           end  
           else writeln ('NO SE PUDO BORRAR EL CLIENTE CON CODIGO ', codigo);
  writeln;
  writeln;
  writeln('-- Presione una tecla para continuar con el Inciso h) --');
  readln;
  writeln;
  writeln;
  writeln('-- Se borraran todos los clientes que realizan la actividad Spinning --');
  BorrarTodosAct (cli,diml,2);
  writeln;
  writeln ('CLIENTES ALMACENADOS LUEGO DE ELIMINAR LOS QUE REALIZAN SPINNING');
  mostrar_clientes (cli, diml);
  writeln;
  writeln('-- Presione una tecla para finalizar --');
  readln;
end.
