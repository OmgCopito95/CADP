program ejercicio_4;
{
 Escriba un programa que lea código, rubro y precio de productos de un supermercado e informe:

 - El código y precio de los dos productos mas caros.
 - La cantidad de productos cuyo código incluya al menos un 0.
 - Para cada código de producto, la cantidad de dígitos 5 que posee.
 - La cantidad de productos del rubro “Librería”.

 Nota: la lectura finaliza cuando se lee precio de producto 0.
}

{tipos de definidos por el usuario}
type
  cadena = string[50];

{declaración de los procesos y/o funciones}

{proceso que actualiza los máximos. En este caso se calculan dos máximos}
procedure maximos(p: real; c: integer; var pm1, pm2: real; var cm1, cm2: integer);
begin
  {se verifica si el precio recibido supera el primer máximo}
  if (p > pm1) then begin
    {se actualizan ambos máximos. Si es mayor al primero también es mayor al segundo}
    pm2 := pm1;
    pm1 := p;
    cm2 := cm1;
    cm1 := c;
  end
  else begin
    {se verifica si el precio supera el segundo máximo}
    if (p > pm2) then begin
      {se actualiza solamente el segundo máximo}
      pm2 := p;
      cm2 := c;
    end;
  end;
end;

{función que verifica si el código recibido contiene un dígito 0}
function codigo_con_digito_cero(c: integer): boolean;
begin
  {se utiliza la función MOD para quedarse con el dígito menos significativo y si es cero finaliza el while}
  while ((c MOD 10) <> 0) do
    {se utiliza DIV para cortar el número y descartar e dígito menos significativo}
    c := c DIV 10;
  {retorno de la función}
  codigo_con_digito_cero := (c > 0);
end;

{función que calcula la cantidad de digitos 5 que posee el codigo recibido}
function cantidad_digitos_cinco(c: integer): integer;
var
  cant_dig_cinco: integer;
begin
  cant_dig_cinco := 0;
  while (c > 0) do begin
    {se utiliza la función MOD para quedarse con el dígito menos significativo y verificar si es un 5}
    if ((c MOD 10) = 5) then
      cant_dig_cinco := cant_dig_cinco + 1;
    {se utiliza DIV para cortar el número y descartar e dígito menos significativo}
    c := c DIV 10;
  end;
  {retorno de la función}
  cantidad_digitos_cinco := cant_dig_cinco;
end;

{variables del programa principal}
var
  {variables de lectura de información}
  codigo: integer; precio: real; rubro: cadena;

  {variables para el calculo de ambos máximos}
  cod_max_1, cod_max_2: integer;
  precio_max_1, precio_max_2: real;

  {variable para la cantidad de productos que incluyen un 0}
  cant_prod_0: integer;

  {variable para la cantidad de productos con rubro Libreria}
  cant_rub_lib: integer;
begin
  {se inicializan los máximos en 0, debido a que el 0 no es considerado un precio válido a procesar}
  precio_max_1 := 0;
  cod_max_1 := 0;
  {los contadores se inicializan en 0}
  cant_prod_0 := 0;
  cant_rub_lib := 0;

  {se inicia con la lectura de productos}

  write('- Precio: ');
  readln(precio);
  {se utiliza una estructura iterativa precondicional debido que no se conoce cuantos productos se van a leer}
  while (precio <> 0) do begin
    write('- Codigo: ');
    readln(codigo);
    write('- Rubro: ');
    readln(rubro);

    {se verifica si hay nuevos máximos}
    maximos(precio, codigo, precio_max_1, precio_max_2, cod_max_1, cod_max_2);

    {se verifica si el código contiene un 0}
    if (codigo_con_digito_cero(codigo)) then
      cant_prod_0 := cant_prod_0 + 1;

    {se calcula e imprime la cantidad de digitos 5 que posee cada producto. Es por cada producto}
    writeln;
    writeln('-- La cantidad de digitos 5 que posee el codigo es: ', cantidad_digitos_cinco(codigo));

    {se verifica el rubro}
    if (rubro = 'Libreria') then
      cant_rub_lib := cant_rub_lib + 1;

    {se vuelve a leer el precio de otro producto}
    writeln;
    write('- Precio: ');
    readln(precio);
  end;

  writeln;
  writeln('---- Informes solicitados ----');
  writeln;
  {verificamos que se han leídos productos y hay al menos un máximo}
  if (precio_max_1 > 0) then begin
    writeln('-- El codigo del produco mas caro es: ', cod_max_1, ' y el precio es: ', precio_max_1:0:2);
    writeln('-- El codigo del segundo producto mas caro es: ', cod_max_2, ' y el precio es: ', precio_max_2:0:2);
  end
  else
    writeln ('-- Los maximos no han sido actualizados');
  writeln;
  writeln('-- La cantidad de productos que posee al menos un cero en su codigo es: ', cant_prod_0);
  writeln;
  writeln('-- La cantidad de productos del rubro Libreria es: ', cant_rub_lib);
  writeln;
  writeln('---- Presione entrar para finalizar ----');
  readln;
end.
