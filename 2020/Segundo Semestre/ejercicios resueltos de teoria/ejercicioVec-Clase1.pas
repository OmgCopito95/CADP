program ejercicioVec(Clase1);
{
 Un centro de deportes quiere almacenar la información de sus clientes y de los 4 tipos de actividades que ofrece: 
 1) Musculación, 2) Spinning, 3) Cross Fit, 4) Libre. 
  Para ello, se debe leer el precio mensual de cada actividad y almacenarlo en un vector. 
  Además, se debe leer y almacenar la información de los 1000 clientes del centro de deportes. 
  De cada uno se conoce: código de cliente, DNI, apellido, nombre, edad y el número de actividad elegida (1..4). 
  Al finalizar la lectura y el almacenamiento de los clientes, se pide: 
  a)	Informar el monto total a recaudar por cuotas.
  b)	El DNI de los clientes que superen el promedio de edad entre todos los clientes.
  c)	Informar el código de actividad más elegido.

Se sabe que cada cliente elige una sola actividad. Modularizar su solución.
}

{tipos de datos definidos por el usuario}
const
  cant_act = 4;
  cant_cli = 1000;
type
  cadena = string[50];
  rango_act = 1..cant_act;
  rango_clientes = 1..cant_cli;
  rango_edad = 14..90;

  precios = array[rango_act] of real;
  contador = array[rango_act] of integer;

  cliente = record
    cod: integer;
    dni: integer;
    ape: cadena;
    nom: cadena;
    edad: rango_edad;
    act: rango_act;
  end;

  clientes = array[rango_clientes] of cliente;

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

procedure cargar_clientes(var cli: clientes);

  procedure leer_cliente(var c: cliente);
  begin
    writeln;
    writeln('-- NUEVO CLIENTE --');
    write('- DNI: ');
    readln(c.dni);
    write('- Codigo: ');
    readln(c.cod);
    write('- Apellido: ');
    readln(c.ape);
    write('- Nombre: ');
    readln(c.nom);
    write('- Edad: ');
    readln(c.edad);
    write('- Actividad: ');
    readln(c.act);
  end;

var c: cliente; i: integer;
begin
  For i:= 1 to cant_cli DO BEGIN
    leer_cliente(c);
    cli[i] := c;
  END;
end;

procedure procesar_informacion(cli: clientes; var monto_total: real; var suma_edad: integer; var c: contador; vec_pre: precios);

  procedure inicializar_contador(var c: contador);
  var i: rango_act;
  begin
   FOR i:= 1 to cant_act DO
     c[i] := 0;
  end;

var
  i: rango_clientes;
begin
  monto_total := 0;
  suma_edad := 0;
  inicializar_contador(c);
  FOR i:= 1 to cant_cli DO BEGIN
    monto_total := monto_total + vec_pre[cli[i].act];
    c[cli[i].act] := c[cli[i].act] + 1;
    suma_edad := suma_edad + cli[i].edad;
  END;
end;

function max_actividad(c: contador):rango_act;
var
  i, act_max: rango_act;
begin
  act_max := 1;
  FOR i:= 2 to cant_act DO
    IF (c[i] > c[act_max]) THEN
      act_max := i;
  max_actividad := act_max;
end;


{variables del programa principal}
var
  {vector de los precios de las actividades}
  vec_pre: precios;
  {datos del cliente}
  cli: clientes;
  prom: real;
  {variables para realizar los informes solicitados}
  suma_edad, i: integer;
  cont: contador;
  monto_total: real;
begin
  writeln('-- CARGA DE PRECIOS DE LAS ACTIVIDADES --');
  writeln;
  cargar_precios(vec_pre);
  writeln;
  writeln('-- CARGA DE CLIENTES --');
  writeln;
  cargar_clientes(cli);
  writeln;
  writeln('-- SE PROCESA LA INFORMACION --');
  writeln;
  procesar_informacion(cli, monto_total, suma_edad, cont, vec_pre);
  writeln;
  writeln('-- INFORMES --');
  writeln;
  writeln('- El monto total recaudado es: ', monto_total:4:0);
  writeln;
  writeln('- La actividad mas elegida es: ', max_actividad(cont));
  writeln;
  writeln('- Los DNI que superan el promedio de edad son: ');
  prom:= suma_edad / cant_cli;
  FOR i:= 1 to cant_cli DO
    IF (cli[i].edad > prom) THEN BEGIN
      writeln;
      writeln ('  -- DNI: ', cli[i].dni);
      writeln;
    END;
  writeln('-- Presione una tecla para finalizar --');
  readln;
end.
