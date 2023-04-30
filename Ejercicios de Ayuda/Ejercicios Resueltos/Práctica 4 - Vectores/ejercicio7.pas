//EJERCICIO 7
{Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.}

program contar_digitos;

const
  dimF = 9;

type
  rango = 0..dimF;
  vector = array[rango] of integer;

procedure descomponerNumero(numero: integer; var v: vector);
var
  dig: integer;
begin
  while (numero <> 0) do begin
    dig := numero MOD 10; // extrae el último dígito
    v[dig] := v[dig] + 1; // incrementa el contador del dígito
    numero := numero DIV 10; // quita el último dígito del número
  end;
end;

procedure imprimirVector(v: vector);
var
  i: rango;
begin
  for i := 0 to dimF do begin
    writeln('el digito ', i, ' aparecio ', v[i], ' veces.');
  end;
end;

procedure inicializarVector(var v: vector);
var
  i: integer;
begin
  for i := 0 to dimF do begin
    v[i] := 0;
  end;
end;

procedure actualizarMaximo(cuenta: integer; i: rango; var max: integer; var digMasLeido: rango);
begin
  if cuenta > max then begin
    max := cuenta;
    digMasLeido := i;
  end;
end;

procedure recorrerVector(v: vector);
var
  max, digMasLeido: integer;
  i: rango;
begin
  max := -1;
  for i := 0 to dimF do begin
    if v[i] > 0 then begin
      writeln('el digito ', i, ' aparecio ', v[i], ' veces.');
    end else begin
      writeln('el digito ', i, ' no tuvo ocurrencias.');
    end;
    actualizarMaximo(v[i], i, max, digMasLeido);
  end;
  writeln('el digito mas leido es ', digMasLeido, ', con ', max, ' ocurrencias.');
end;

var
  v: vector;
  num: integer;
begin
  inicializarVector(v);
  writeln('Ingrese numeros enteros (terminar con -1):');
  read(num);
  while (num <> -1) do begin
    descomponerNumero(num, v);
    read(num);
  end;
  recorrerVector(v);
end.
